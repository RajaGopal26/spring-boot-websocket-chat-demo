<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Spring 3 MVC Multipe Row Submit</title>
</head>
<body>

	<h2>Spring MVC Multiple Row Form Submit</h2>

	<form:form method="post" action="save">
		<table>
			<tr>
				<th>No.</th>
				<th>Name</th>
				<th>Lastname</th>
				<th>Email</th>
				<th>Phone</th>
			</tr>
			<c:forEach items="${contactForm}" var="contact" varStatus="status">
				<tr>
					<td align="center">${status.count}</td>
					<td><input path="contactForm[${status.index}].name"
						value="${contact.firstname}" /></td>
					<td><input path="contactForm[${status.index}].lastname"
						name="contactForm[${status.index}].lastname"
						value="${contact.lastname}" /></td>
					<td><input path="contactForm[${status.index}].email"
						name="contactForm[${status.index}].email" value="${contact.email}" /></td>
					<td><input path="contactForm[${status.index}].name"
						name="contactForm[${status.index}].phone" value="${contact.phone}" /></td>
				</tr>
			</c:forEach>
		</table>
		<br />
		<input click=update() type="submit" value="Save" />

	</form:form>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	function update(){
        $(document).ready(function () {
        	var contactForm;
        	let formElements = [];
            let changedFields = [];
            let dataJson = {};
            $('#testForm input,#testForm select').each(function () {
                let thisEle = $(this);
                formElements.push(thisEle);
            });

            console.log("formElements ", formElements);

            $('#testForm input,#testForm select').change(function () {
            	alert('table is changed');
                let alreadyExists = false;

                if (changedFields.length > 0) {
                    for (let c of changedFields) {
                        if ($(this)[0].name == c[0].name) {
                            alreadyExists = true;
                        }
                        if (alreadyExists) {
                            changedFields.pop(c);
                            console.log("c popped " + c);
                            console.log("c popped", c);
                        }
                    }
                }
                
                changedFields.push($(this));
                console.log("this changed", $(this));
                console.log("changedFields ", changedFields);
            });

            /* $("#subBtn").click(function () {
                 for (let f of formElements) {
                     for (let c of changedFields) {
                         console.log("loop");
                         if (f[0].name == c[0].name) {
                             console.log("samee ", f[0].name);
                             if (f[0].value != c[0].value) {
                                 console.log("changed ", f);
                             }
                             else {
                                 console.log("no change ", f);
                             }
                         }
                     }
                 }
             }); */
//             contactForm= changedFields;
        });
	}
    </script>
</body>
</html>