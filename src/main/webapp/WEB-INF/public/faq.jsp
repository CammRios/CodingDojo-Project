<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<main class="flex items-center justify-center bg-stone-50 py-5 dark:bg-neutral-800">
    <div class="container mx-auto p-4">
        <!-- Bienvenida y Pasos para Registrarte -->
        <section class="mb-8">
            <h2 class="text-2xl font-semibold mb-4 text-center">Bienvenido a CheLaburo</h2>
            <p class="mb-4">En CheLaburo, conectamos a usuarios como t� con LABURANTES que pueden ayudarte con una amplia gama de servicios, desde resolver problemas el�ctricos hasta facilitar tu mudanza, cuidar tu jard�n o pintar tu casa. Nuestros LABURANTES est�n aqu� para resolver tus necesidades. Para registrarte, simplemente accede a nuestra p�gina de registro, completa tus datos personales y explora una variedad de servicios disponibles para elegir el que mejor se adapte a tus necesidades.</p>
            
            <h3 class="text-xl font-semibold mb-2">Pasos para Registrarte:</h3>
            <ol class="list-decimal ml-6 mb-4">
                <li>Accede a nuestra p�gina de registro: Visita nuestro sitio web y haz clic en el bot�n <a href="#" class="text-blue-500 underline">�nete</a> para comenzar. </li>
                <li>Completa tus datos personales: Ingresa tu nombre completo, direcci�n de correo electr�nico y crea una contrase�a segura.</li>
                <li>Explora y elige tus servicios: Una vez registrado, podr�s acceder a la p�gina principal y seleccionar cualquier servicio que desees. Nuestro sistema te guiar� para encontrar el LABURANTE adecuado para tus necesidades.</li>
            </ol>
        </section>
        <section>
            <h3 class="text-2xl font-semibold mb-4">Preguntas Frecuentes</h3>
            <div id="accordion">
                <div class="accordion-item mb-2">
                    <div class="accordion-header bg-gray-100 p-4 cursor-pointer flex justify-between items-center" onclick="toggleAccordion(this)">
                        <h3 class="font-semibold">�Puedo comprar tarjetas regalo de CheLaburo?</h3>
                        <i class="fas fa-plus"></i>
                    </div>
                    <div class="accordion-content p-4 bg-white hidden">
                        <p>En estos momentos, no disponemos de tarjetas regalo de CheLaburo para la venta. Pr�ximamente estar�n disponibles.</p>
                    </div>
                </div>
                <div class="accordion-item mb-2">
                    <div class="accordion-header bg-gray-100 p-4 cursor-pointer flex justify-between items-center" onclick="toggleAccordion(this)">
                        <h3 class="font-semibold">�Qu� ofrecen los LABURANTES?</h3>
                        <i class="fas fa-plus"></i>
                    </div>
                    <div class="accordion-content p-4 bg-white hidden">
                        <p>Pod�s reservar servicios de muchas categor�as distintas, como montaje de muebles, fijaci�n a la pared, reparaciones menores del hogar y mucho m�s. CheLaburo te pone en contacto con contratistas independientes de tu zona para que te ayuden con los servicios.</p>
                        <p>Busc� en la p�gina de inicio de CheLaburo para encontrar la categor�a que desees.</p>
                    </div>
                </div>
                <div class="accordion-item mb-2">
                    <div class="accordion-header bg-gray-100 p-4 cursor-pointer flex justify-between items-center" onclick="toggleAccordion(this)">
                        <h3 class="font-semibold">�Est� CheLaburo disponible en mi ciudad?</h3>
                        <i class="fas fa-plus"></i>
                    </div>
                    <div class="accordion-content p-4 bg-white hidden">
                        <p>Actualmente, CheLaburo solo est� disponible en la zona de Capital Federal. Sin embargo, estamos trabajando para expandir nuestro servicio y pronto estaremos disponibles en m�s �reas.</p>
                    </div>
                </div>
                <div class="accordion-item mb-2">
                    <div class="accordion-header bg-gray-100 p-4 cursor-pointer flex justify-between items-center" onclick="toggleAccordion(this)">
                        <h3 class="font-semibold">�Los LABURANTES pueden ver mi n�mero de tel�fono, mi correo electr�nico o mi direcci�n?</h3>
                        <i class="fas fa-plus"></i>
                    </div>
                    <div class="accordion-content p-4 bg-white hidden">
                        <p>Nunca proporcionamos a los <b>LABURANTES</b> tu n�mero de tel�fono ni tu correo electr�nico. Toda la comunicaci�n se realiza a trav�s de la plataforma de CheLaburo. No es necesario proporcionar la informaci�n personal porque las funciones de llamada y chat en la aplicaci�n permiten a los <b>LABURANTES</b> contactar contigo directamente desde la aplicaci�n. Para que tu informaci�n siga siendo segura, te recomendamos que no intercambies los detalles de contacto con tu <b>LABURANTE</b>.</p>
                        <p>Hasta que el <b>LABURANTE</b> no acepte tu invitaci�n para realizar el servicio, tampoco podr� ver tu direcci�n completa.</p>
                    </div>
                </div>
                <div class="accordion-item mb-2">
                    <div class="accordion-header bg-gray-100 p-4 cursor-pointer flex justify-between items-center" onclick="toggleAccordion(this)">
                        <h3 class="font-semibold">�CheLaburo ofrece servicios profesionales?</h3>
                        <i class="fas fa-plus"></i>
                    </div>
                    <div class="accordion-content p-4 bg-white hidden">
                        <p>CheLaburo es una plataforma que conecta a clientes con <b>LABURANTES</b>. Si tu servicio requiere un profesional cualificado, confirm� que el <b>LABURANTE</b> disponga de la licencia y las credenciales necesarias o busca ayuda fuera de CheLaburo.</p>
                        <p>CheLaburo no ofrece ninguna garant�a respecto a la licencia, registro o acreditaci�n profesional de los <b>LABURANTES</b>.</p>
                    </div>
                </div>
                <div class="accordion-item mb-2">
                    <div class="accordion-header bg-gray-100 p-4 cursor-pointer flex justify-between items-center" onclick="toggleAccordion(this)">
                        <h3 class="font-semibold">�Qu� equipo y materiales tendr� el LABURANTE?</h3>
                        <i class="fas fa-plus"></i>
                    </div>
                    <div class="accordion-content p-4 bg-white hidden">
                        <p>Si necesit�s algo espec�fico para tu servicio, asegurate de incluirlo en la descripci�n. Tambi�n deber�as mandar un mensaje al <b>LABURANTE</b> tras la reserva para confirmar que tenga el equipo y materiales necesarios.</p>
                        <p>Los <b>LABURANTES</b> son aut�nomos, as� que el equipo y materiales que tengan variar�n de un <b>LABURANTE</b> a otro.</p>
                    </div>
                </div>
                <div class="accordion-item mb-2">
                    <div class="accordion-header bg-gray-100 p-4 cursor-pointer flex justify-between items-center" onclick="toggleAccordion(this)">
                        <h3 class="font-semibold">�Qu� debo hacer despu�s de reservar un servicio?</h3>
                        <i class="fas fa-plus"></i>
                    </div>
                    <div class="accordion-content p-4 bg-white hidden">
                        <p>Tras reservar un servicio, deber�as comentar tu servicio detalladamente, hacer cualquier pregunta que tengas y asegurarte de que todo quede claro.</p>
                        <p>Una vez comentado el servicio, pod�s confirmar la fecha y la hora en que tendr� lugar para que el <b>LABURANTE</b> pueda programarlo.</p>
                    </div>
                </div>
                <div class="accordion-item mb-2">
                    <div class="accordion-header bg-gray-100 p-4 cursor-pointer flex justify-between items-center" onclick="toggleAccordion(this)">
                        <h3 class="font-semibold">�Tengo que estar en casa cuando se haga mi servicio?</h3>
                        <i class="fas fa-plus"></i>
                    </div>
                    <div class="accordion-content p-4 bg-white hidden">
                        <p>Ten�s la responsabilidad de supervisar y dirigir el trabajo del <b>LABURANTE</b>. CheLaburo no controla, dirige ni supervisa el trabajo de los <b>LABURANTES</b>, ya que son aut�nomos independientes contratados por los clientes. Si no vas a estar en casa, asegurate de dar al <b>LABURANTE</b> todas las instrucciones que pueda necesitar para completar tu servicio correctamente.</p>
                    </div>
                </div>
                <div class="accordion-item mb-2">
                    <div class="accordion-header bg-gray-100 p-4 cursor-pointer flex justify-between items-center" onclick="toggleAccordion(this)">
                        <h3 class="font-semibold">�Por qu� no debo intercambiar informaci�n de contacto con mi LABURANTE?</h3>
                        <i class="fas fa-plus"></i>
                    </div>
                    <div class="accordion-content p-4 bg-white hidden">
                        <p>No proporcionamos informaci�n como tu n�mero de tel�fono ni tu correo electr�nico.</p>
                        <p>Para garantizar tu privacidad, te pedimos que no des tu informaci�n personal a los <b>LABURANTES</b> y que utilices la plataforma de CheLaburo como �nica forma de comunicaci�n.</p>
                    </div>
                </div>
                <div class="accordion-item mb-2">
                    <div class="accordion-header bg-gray-100 p-4 cursor-pointer flex justify-between items-center" onclick="toggleAccordion(this)">
                        <h3 class="font-semibold">�Qu� debo hacer si el LABURANTE ha cancelado el servicio?</h3>
                        <i class="fas fa-plus"></i>
                    </div>
                    <div class="accordion-content p-4 bg-white hidden">
                        <p>Sentimos que el <b>LABURANTE</b> no haya cumplido con su compromiso y haya cancelado el servicio. Si a�n necesit�s completarlo, pod�s volver a reservarlo y elegir a otro <b>LABURANTE</b>.</p>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>

<script>
    function toggleAccordion(element) {
        const allContents = document.querySelectorAll('.accordion-content');
        const allIcons = document.querySelectorAll('.accordion-header i');

        allContents.forEach(content => {
            if (content !== element.nextElementSibling) {
                content.style.display = 'none';
            }
        });

        allIcons.forEach(icon => {
            if (icon !== element.querySelector('i')) {
                icon.classList.remove('fa-minus');
                icon.classList.add('fa-plus');
            }
        });

        const content = element.nextElementSibling;
        const icon = element.querySelector('i');

        if (content.style.display === 'block') {
            content.style.display = 'none';
            icon.classList.remove('fa-minus');
            icon.classList.add('fa-plus');
        } else {
            content.style.display = 'block';
            icon.classList.remove('fa-plus');
            icon.classList.add('fa-minus');
        }
    }

    document.getElementById('menu-button').onclick = function () {
        const menu = document.getElementById('mobile-menu');
        menu.classList.toggle('hidden');
    }
</script>
