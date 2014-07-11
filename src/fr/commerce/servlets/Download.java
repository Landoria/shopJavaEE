package fr.commerce.servlets;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( urlPatterns = "/workspace/app_files/*", initParams = @WebInitParam( name = "chemin", value = "/workspace/app_files/" ) )
public class Download extends HttpServlet {
    private static final int DEFAULT_BUFFER_SIZE = 10240; // 10 ko
    private static final int TAILLE_TAMPON       = 10240; // 10 ko

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        String chemin = this.getServletConfig().getInitParameter( "chemin" );
        String fichierRequis = request.getPathInfo();
        if ( fichierRequis == null || fichierRequis.equals( "/" ) ) {
            response.sendError( HttpServletResponse.SC_NOT_FOUND );
            return;
        }
        fichierRequis = URLDecoder.decode( fichierRequis, "UTF-8" );
        File fichier = new File( chemin, fichierRequis );

        if ( !fichier.exists() ) {
            response.sendError( HttpServletResponse.SC_NOT_FOUND );
            return;
        }

        String type = getServletContext().getMimeType( fichier.getName() );
        if ( type == null ) {
            type = "image/jpg";
        }
        response.reset();
        response.setBufferSize( DEFAULT_BUFFER_SIZE );
        response.setContentType( type );
        response.setHeader( "content-length", String.valueOf( fichier.length() ) );
        response.setHeader( "content-disposition", "attachement; filename=\"" + fichier.getName() + "\"" );

        BufferedInputStream entree = null;
        BufferedOutputStream sortie = null;
        try {
            entree = new BufferedInputStream( new FileInputStream( fichier ), TAILLE_TAMPON );
            sortie = new BufferedOutputStream( response.getOutputStream(), TAILLE_TAMPON );

            byte[] tampon = new byte[TAILLE_TAMPON];
            int longueur = 0;
            while ( ( longueur = entree.read( tampon ) ) > 0 ) {
                sortie.write( tampon, 0, longueur );
            }

        } finally {
            try {
                entree.close();
            } catch ( IOException ignore ) {
            }
            try {
                sortie.close();
            } catch ( IOException ignore ) {
            }
        }

    }
}
