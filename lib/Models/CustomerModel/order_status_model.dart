import 'dart:convert';
/// status : true
/// data : [{"order_id":"51cbe069-d7cf-4eb0-b6c3-b6f888eacb0f","order_number":"45365124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-16","Delivery_date":"2024-01-16","quantity":2},{"order_id":"dc8a2059-ab24-41e7-8a89-213c71c38268","order_number":"53765124","total_amount":"8.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-16","Delivery_date":"2024-01-16","quantity":5},{"order_id":"4132f7e5-9d05-4eb6-ab4a-c1da737ee930","order_number":"fbe8f124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-15","Delivery_date":"2024-01-15","quantity":2},{"order_id":"868b8eea-d883-4cc6-b727-26384d39adcb","order_number":"13dfb124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-15","Delivery_date":"2024-01-15","quantity":2},{"order_id":"a51822e6-7445-40cc-b2bc-3cf73d7cc764","order_number":"f7268124","total_amount":"6.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-12","Delivery_date":"2024-01-12","quantity":3},{"order_id":"e5acda13-1cb9-4b41-8f6b-3a6446597abd","order_number":"8bdbd124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-12","Delivery_date":null,"quantity":1},{"order_id":"2600f3eb-f5a7-42f2-9f2c-eb5673e05382","order_number":"e3b60124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-12","Delivery_date":null,"quantity":0},{"order_id":"fdc95447-1347-43b7-8af2-0e18e86cfa48","order_number":"13e37124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-12","Delivery_date":null,"quantity":0},{"order_id":"c4eab0a4-d779-40d2-b1c1-260780eaa696","order_number":"0ea5e124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-12","Delivery_date":"2024-01-12","quantity":2},{"order_id":"daf3846e-0c9d-486d-8330-31f13cb86223","order_number":"50592124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-12","Delivery_date":null,"quantity":0},{"order_id":"1dba053c-950d-43d5-a6da-d59925c70ee4","order_number":"66e54124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-12","Delivery_date":null,"quantity":0},{"order_id":"efdab167-e9df-4ac2-a96a-dc55b5d51545","order_number":"035b5124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-12","Delivery_date":null,"quantity":1},{"order_id":"98183d0a-5dd3-45b8-95ec-121e6cc9d2a8","order_number":"2c274124","total_amount":"6.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-12","Delivery_date":"2024-01-12","quantity":3},{"order_id":"0537ad45-c88f-4220-bc88-6629c5ab0e2e","order_number":"956fc124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-12","Delivery_date":null,"quantity":1},{"order_id":"d475792f-c617-4f23-91f7-90c6bf86622d","order_number":"865bd124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-12","Delivery_date":null,"quantity":0},{"order_id":"1a90cbb5-c094-4a6e-9341-5dcf3f8331cf","order_number":"2bcb5124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-12","Delivery_date":"2024-01-12","quantity":2},{"order_id":"a052c73b-3526-479b-8593-ec42088dd63b","order_number":"fca65124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":0},{"order_id":"7456316b-a047-4f70-8db7-45f331329125","order_number":"dd663124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":0},{"order_id":"0898cf40-7837-427a-bcc5-bfd4759080fc","order_number":"942ad124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":1},{"order_id":"358991f3-ec11-4718-8fdd-741e2a89305f","order_number":"048a8124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":0},{"order_id":"7705af57-e714-418c-84a9-222f92324bce","order_number":"0b597124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":0},{"order_id":"9b33046e-9e8c-4ad9-8716-badce6a88991","order_number":"c4bbb124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":0},{"order_id":"511125f9-294e-4d3d-bc9c-8f610c4969d5","order_number":"06d35124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":0},{"order_id":"24f686e8-d1bd-4256-a9aa-94df3a853c9c","order_number":"ffe78124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":0},{"order_id":"6f70cf2e-dfd1-4ed8-b147-12b01ef8891c","order_number":"c7aad124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":0},{"order_id":"9c4e19e5-a4a3-4564-bc68-b77b48f92feb","order_number":"eb11c124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":0},{"order_id":"e1d25ecf-705c-459e-a0ae-ec8e675c086e","order_number":"de9f9124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":0},{"order_id":"6e076e1d-f550-4c39-acac-cd8713e5f87b","order_number":"d53ce124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":0},{"order_id":"f2c9ddc6-1585-4b51-9830-af05963844c8","order_number":"35232124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-11","Delivery_date":null,"quantity":1},{"order_id":"40d85e8f-7565-4474-bb25-f905b5192fd2","order_number":"e07ee124","total_amount":"6.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-10","Delivery_date":"2024-01-10","quantity":2},{"order_id":"82bab64f-80ad-45fa-8a34-403ac5b97f1d","order_number":"74fe7124","total_amount":"6.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-10","Delivery_date":"2024-01-10","quantity":3},{"order_id":"97f0e6bc-d791-4545-b194-fbcb5663ccfb","order_number":"f9a76124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-10","Delivery_date":"2024-01-10","quantity":2},{"order_id":"922b72ec-f1a1-4565-bd8b-0bff568feb2d","order_number":"9f962124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-10","Delivery_date":null,"quantity":1},{"order_id":"6eb0883e-c608-4cca-b57d-93aa6192ede6","order_number":"21d4a124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-10","Delivery_date":null,"quantity":1},{"order_id":"7ee799e2-b7b0-47c3-886a-f55c225ea88c","order_number":"c8ec2124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-10","Delivery_date":null,"quantity":0},{"order_id":"2f0ed27d-7f48-4adf-8100-f52e17e380c7","order_number":"a253b124","total_amount":"6.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-10","Delivery_date":"2024-01-09","quantity":3},{"order_id":"b4c1779f-a4fd-4442-907d-7a8eb8969e89","order_number":"d60c4124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-09","Delivery_date":"2024-01-09","quantity":2},{"order_id":"9cedc238-c449-4ee4-9360-3987ae87ec40","order_number":"53761124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-09","Delivery_date":"2024-01-09","quantity":2},{"order_id":"66d3d5d6-9448-4a30-86df-8e8e48424b43","order_number":"2e08e124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-09","Delivery_date":null,"quantity":1},{"order_id":"ed8bc0e4-da3b-40b3-ab33-acfdd5c5c820","order_number":"5afab124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-09","Delivery_date":null,"quantity":2},{"order_id":"afe0f8e7-9539-4912-a956-c71f89fff6f5","order_number":"3020d124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-09","Delivery_date":null,"quantity":2},{"order_id":"b55b4b32-cc26-42f9-86ee-af10351631c5","order_number":"68b12124","total_amount":"10.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-09","Delivery_date":"2024-01-09","quantity":5},{"order_id":"9638d04e-a9f8-43e8-9d1e-82d1cb25486c","order_number":"34bd2124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-09","Delivery_date":"2024-01-09","quantity":2},{"order_id":"ca22da36-8c10-47cd-944c-701e5182e38d","order_number":"46958124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-08","Delivery_date":"2024-01-08","quantity":2},{"order_id":"42e04cab-4b98-4d3e-bdd3-d6d1831d8db7","order_number":"f5195124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-08","Delivery_date":"2024-01-08","quantity":2},{"order_id":"b51d2c39-f56f-4097-bbde-8bacc9f488fb","order_number":"4b01a124","total_amount":"0.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-05","Delivery_date":"2024-01-05","quantity":0},{"order_id":"d0b1a05f-a04c-42d7-b8aa-d3604ce9d2ab","order_number":"86152124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-05","Delivery_date":"2024-01-05","quantity":2},{"order_id":"3ffd4493-7d0a-4fee-82a5-af1f103d6b57","order_number":"72202124","total_amount":"40.5","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-05","Delivery_date":"2024-01-05","quantity":2},{"order_id":"b5a53cdc-eae8-4d1f-80b2-41c42716ac6e","order_number":"f6562124","total_amount":"0","status":"Confirmation Pending","order_type":"Express","order_date":"2024-01-05","Delivery_date":"2024-01-05","quantity":0},{"order_id":"dde383d4-b480-4733-9272-ee42b7b5cee4","order_number":"924a8124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-05","Delivery_date":"2024-01-05","quantity":2},{"order_id":"65be973e-ee9b-494d-9058-bfeb37c0752e","order_number":"e9c7e124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-04","Delivery_date":"2024-01-04","quantity":1},{"order_id":"5e6e7531-0ead-484e-8318-55947b10856b","order_number":"ae7c2124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-04","Delivery_date":"2024-01-04","quantity":1},{"order_id":"53c44c04-719b-42cd-9ae6-34375531dd46","order_number":"ae95d124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-04","Delivery_date":"2024-01-04","quantity":1},{"order_id":"b4e344bd-354a-4238-90fb-96751b74c3a2","order_number":"14c23124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-04","Delivery_date":"2024-01-04","quantity":0},{"order_id":"f5e68441-077a-45a0-8128-310874dc8684","order_number":"123e8124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-10","Delivery_date":"2024-01-04","quantity":0},{"order_id":"5cd4c929-85c7-4c32-9b88-5279267f9b12","order_number":"fb825124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-04","Delivery_date":"2024-01-04","quantity":2},{"order_id":"5a181ae3-b4b7-42ea-85e6-873e4ff44cc2","order_number":"793e3124","total_amount":"50.5","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-04","Delivery_date":"2024-01-04","quantity":3},{"order_id":"208c84b5-2f03-4fbe-bca5-2f7511a06f3b","order_number":"3be99124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":1},{"order_id":"4cee9a4b-e848-44f6-9122-83c7feef831b","order_number":"35751124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":2},{"order_id":"7bd5bd49-f289-42e8-ba0b-85ce27dd927d","order_number":"84b96124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":0},{"order_id":"45c7eff8-7afa-4e56-b4db-452fb97f9717","order_number":"5b000124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":2},{"order_id":"c8bea252-cb6d-4b46-ab99-78419d8a2a91","order_number":"ea836124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":0},{"order_id":"52c93b75-5929-4ed5-b53f-9297a561046b","order_number":"a6ff3124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":1},{"order_id":"6a2ac3e8-3053-495a-b142-f45a17936421","order_number":"3c284124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":0},{"order_id":"7e01f041-0cc6-422b-bff4-236396f7b75f","order_number":"82808124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":2},{"order_id":"9c5a17f8-47d1-49d6-8e3a-4e7de1114e38","order_number":"2f567124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":2},{"order_id":"68374dd6-0177-4f28-85ce-ff91b5294229","order_number":"296d0124","total_amount":"0.5","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":4},{"order_id":"d22409ba-8e55-454a-9436-0b6000080e0d","order_number":"133ff124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":0},{"order_id":"830a5e0c-b5fd-4b53-93a1-192688fe3094","order_number":"6c911124","total_amount":"6.0","status":"Delivered","order_type":"Normal","order_date":"2024-01-12","Delivery_date":"2024-01-03","quantity":3},{"order_id":"cbb9c057-a981-4d95-b819-16f1966308d9","order_number":"3c5b1124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":2},{"order_id":"b890875a-8935-4ef6-aef4-13ec6481422d","order_number":"e7b58124","total_amount":"4.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2024-01-03","quantity":2},{"order_id":"c3e5082f-b660-4367-9694-4e243f99d078","order_number":"65cc2124","total_amount":"-60.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":14},{"order_id":"c5ec2c86-862c-4f91-98e8-7fcc56b34d5e","order_number":"d2e9b124","total_amount":"30.5","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-05","Delivery_date":"2024-01-02","quantity":2},{"order_id":"ebb5312f-9fa7-42b5-bb0e-080150a1258a","order_number":"6ebf8124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":0},{"order_id":"8708b975-1b5a-4888-8d42-14a9a991d455","order_number":"a8bb8124","total_amount":"40.5","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":3},{"order_id":"5cea9022-813d-473c-bc87-377d1a06d4c6","order_number":"62d10124","total_amount":"24.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":3},{"order_id":"22eb579b-205b-43a2-a99b-a522d4748885","order_number":"23c1d124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":2},{"order_id":"dace6c43-1190-4ba5-bb77-209eb1878c66","order_number":"631ae124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":0},{"order_id":"6c3579d7-9050-4f98-9d60-0e268c79d246","order_number":"f8a26124","total_amount":"0.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":0},{"order_id":"546cd7ae-797b-47e6-967c-dcabd81ceb34","order_number":"24308124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":1},{"order_id":"027b420c-8336-4af6-a1c5-2ea8998c35d9","order_number":"0ce3a124","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":1},{"order_id":"83a4998f-6bf3-44a7-9d2e-e228772e5bc9","order_number":"8f256124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":0},{"order_id":"89f4a34e-5e05-4953-9441-cd15c8184bae","order_number":"18bda124","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":0},{"order_id":"978d1187-26d2-4c6e-96d5-f39e56e2d7a0","order_number":"855ef124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":2},{"order_id":"397144b9-052a-420e-bed1-102ea13695bf","order_number":"93c2b124","total_amount":"8.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":4},{"order_id":"5f077169-3317-4480-8606-38526a5e7f9f","order_number":"2d142124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2024-01-02","quantity":2},{"order_id":"8bd0fb10-7721-4898-b8c6-e04d49ba2bf2","order_number":"412df124","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-01","Delivery_date":"2024-01-01","quantity":2},{"order_id":"4d88316b-403d-46d7-b040-19cd937c1b7e","order_number":"b8961124","total_amount":"18.0","status":"Confirmed","order_type":"Normal","order_date":"2024-01-01","Delivery_date":"2024-01-01","quantity":2},{"order_id":"967c96d8-590d-4305-ae01-4a7aadcd6720","order_number":"9a04b1223","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":2},{"order_id":"f11ff8e7-9acc-47d1-91b4-97ab01ba7dcb","order_number":"402381223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":0},{"order_id":"df27483f-271a-4642-94da-2b5f3afbc869","order_number":"045bd1223","total_amount":"0.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2024-01-02","Delivery_date":"2023-12-29","quantity":0},{"order_id":"5acd7123-2997-4aad-9ae5-4b6380410a85","order_number":"4f9f71223","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":2},{"order_id":"90e3e77b-da33-4c39-8861-718707616316","order_number":"a27671223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":0},{"order_id":"f0561583-4d96-4167-a763-fd07bcd88e46","order_number":"670421223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":0},{"order_id":"d950266d-913e-49fb-b343-e83057d1c097","order_number":"39cf21223","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":2},{"order_id":"7e763dd2-77d8-4480-8d08-d7fa40a4ccb9","order_number":"b5f941223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":0},{"order_id":"db0cb728-81a6-4ecd-a6d0-e06eed096f69","order_number":"f0cfa1223","total_amount":"7.0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":3},{"order_id":"549006e3-8804-4a27-8db9-784f2d1345c7","order_number":"89b2e1223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":0},{"order_id":"067a7be1-17ee-4178-add5-aaaf4cbe0f36","order_number":"456cc1223","total_amount":"20.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":2},{"order_id":"213d0940-955b-4bbf-aa56-33a875ac7ea1","order_number":"ffa571223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":0},{"order_id":"a6f883ba-d15d-4287-b4bc-293be5f4a727","order_number":"95dcc1223","total_amount":"40.0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":2},{"order_id":"0ff5dc3f-4416-43d5-b5b3-92f9b9480aca","order_number":"6b6941223","total_amount":"0.0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-29","Delivery_date":"2023-12-29","quantity":0},{"order_id":"39ed9caf-6b8d-412d-9aa9-ddc321c9fa44","order_number":"6b4d41223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-28","Delivery_date":"2023-12-28","quantity":0},{"order_id":"0a03becb-dddb-467e-aa48-648d01a7be7d","order_number":"811531223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-28","Delivery_date":"2023-12-28","quantity":0},{"order_id":"b883fc95-f49b-4f7a-994f-b69ceaecf6a7","order_number":"2057e1223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-28","Delivery_date":"2023-12-28","quantity":0},{"order_id":"bf356dc8-879d-48b3-89ce-97b183045531","order_number":"a41c31223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-28","Delivery_date":"2023-12-28","quantity":0},{"order_id":"5e005671-9d1c-45ca-9e51-5ee215e5c025","order_number":"d691a1223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"c547224d-f01c-40f4-9d1b-6d9b1658ddef","order_number":"4ad971223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"9d7f76cc-934f-4726-aa5c-e5ffccbdeac6","order_number":"9e4791223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-28","quantity":0},{"order_id":"eb7a68fc-3481-43bb-a9a0-cfa0b6128c8d","order_number":"b07441223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-28","quantity":0},{"order_id":"2458c128-a5fd-4586-a9d5-7da7abb23b41","order_number":"372361223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-28","quantity":0},{"order_id":"96c117f9-5922-4482-bff2-683b629d736a","order_number":"3cd601223","total_amount":"0","status":"Confirmed","order_type":"Express","order_date":"2023-12-27","Delivery_date":"2023-12-30","quantity":0},{"order_id":"6ed82199-4983-4d86-9cc6-90b0f5f999a8","order_number":"bd15b1223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"00d29081-6069-475b-b2df-3fa46fab7a84","order_number":"7204e1223","total_amount":"0","status":"Delivered","order_type":"Normal","order_date":"2024-01-12","Delivery_date":"2023-12-27","quantity":0},{"order_id":"d6e47ae8-4697-470b-b651-db6628bd0578","order_number":"96d641223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"a1fe300e-07fd-4b8a-9ec2-319089e087f3","order_number":"0b0ed1223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"38c1b8a6-b3d0-4dbd-bd05-9f2b8e64bf42","order_number":"b31c41223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"8a55484a-f7bc-4226-8e74-2c2e881b9bb1","order_number":"1c4e41223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"f2483600-9438-4b32-923f-e471f18a0039","order_number":"c6f0f1223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"ed119e86-b7d5-406d-9cbf-c1d334894e6b","order_number":"f273c1223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"f5762a9d-d053-4436-98b3-a0e84e322f13","order_number":"cb9c21223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"f26e043b-ecd3-4a71-9372-1a6b2630e2a3","order_number":"d0b0b1223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"66b581cd-702e-4cfa-b2ea-d2312f156270","order_number":"765911223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-27","Delivery_date":"2023-12-27","quantity":0},{"order_id":"01d6604b-9fc7-4f46-b4e0-57174c2ead66","order_number":"a3f9c1223","total_amount":"0","status":"Delivered","order_type":"Normal","order_date":"2024-01-10","Delivery_date":"2023-12-27","quantity":0},{"order_id":"52166099-6bb4-4158-9536-dedcd30790df","order_number":"960791223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-26","Delivery_date":"2023-12-26","quantity":0},{"order_id":"c1c78264-bca6-48e6-9792-d73e31c28b87","order_number":"397b21223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-26","Delivery_date":"2023-12-26","quantity":0},{"order_id":"98672e0b-eeb7-4e9e-951f-95b369b82c09","order_number":"e35e01223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"4d77f636-6949-418f-a7f9-5e1825d3a3a9","order_number":"99c831223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"6bce70ac-3b5a-4840-9a39-c9ec391b1fa1","order_number":"94b701223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"591e8889-f10d-4778-a809-48fbd0e4bf78","order_number":"bb0821223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"33e3a551-6253-4226-b659-f60ab0d972f4","order_number":"e43721223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"ff75a9ff-2c84-438d-b292-ccede6e829df","order_number":"d15cb1223","total_amount":"60.0","status":"Transit","order_type":"Normal","order_date":"2024-01-03","Delivery_date":"2023-12-22","quantity":4},{"order_id":"38ba1e2d-00ec-45b4-b07b-f78b4915c353","order_number":"2878a1223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"2ff736d9-2802-430a-9899-fef40c9d5524","order_number":"d52ae1223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"d92496d1-274c-4191-bd69-c58138ce78e7","order_number":"b01d51223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"82cde7e3-7382-4229-b9bd-09c4c3ddeff4","order_number":"c9b701223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"86b39db7-b3b0-467f-be0c-1c92b107c2f5","order_number":"792891223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"e776a3f3-2ca5-44a1-97dc-e061eae6ae57","order_number":"b766a1223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"55f3fa91-076f-424d-b368-11992c1075d2","order_number":"1e3281223","total_amount":"0","status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-22","quantity":0},{"order_id":"49a31136-aacc-45bd-96bb-1ee1be1bc4f8","order_number":"33ec51223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-22","Delivery_date":"2023-12-20","quantity":0},{"order_id":"e1efbd58-7a8f-4363-b91d-05a2ad0aaee3","order_number":"210dd1223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-19","Delivery_date":"2023-12-29","quantity":0},{"order_id":"6cb79350-e661-4371-8c41-572b7d1704d2","order_number":"7bd9a1223","total_amount":"0","status":"Confirmed","order_type":"Urgent","order_date":"2023-12-08","Delivery_date":"2023-12-27","quantity":0},{"order_id":"3568e1f5-ae65-4d7b-8f68-987475638286","order_number":"2a3981223","total_amount":"0","status":"Confirmed","order_type":"Urgent","order_date":"2023-12-08","Delivery_date":"2023-11-24","quantity":0},{"order_id":"f66c277e-b596-43d1-88fd-f77c13c41c7f","order_number":"1bdb41223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-08","Delivery_date":"2023-12-27","quantity":0},{"order_id":"261ac269-9a1d-4ef2-a1b5-882bfaa180a7","order_number":"13fc11223","total_amount":null,"status":"Confirmation Pending","order_type":"Express","order_date":"2023-12-08","Delivery_date":null,"quantity":0},{"order_id":"0dbd228a-5c0d-4011-812d-9c5e154e9dfd","order_number":"00eb41223","total_amount":null,"status":"Confirmation Pending","order_type":"Urgent","order_date":"2023-12-06","Delivery_date":null,"quantity":0},{"order_id":"4082cba5-d35e-4702-ae7b-4b88aee95c70","order_number":"581551223","total_amount":null,"status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-06","Delivery_date":null,"quantity":0},{"order_id":"a809c63b-3821-484f-a91b-99f0173232c8","order_number":"5f9df1223","total_amount":null,"status":"Confirmation Pending","order_type":"Express","order_date":"2023-12-06","Delivery_date":null,"quantity":0},{"order_id":"935d08a8-709a-4425-841e-5c37c4d85e2e","order_number":"33aff1223","total_amount":null,"status":"Confirmation Pending","order_type":"Normal","order_date":"2023-12-06","Delivery_date":null,"quantity":0},{"order_id":"d411d8bc-4504-4c32-b5bc-2ee399267f1c","order_number":"a7dfd1223","total_amount":null,"status":"Confirmation Pending","order_type":"Urgent","order_date":"2023-12-05","Delivery_date":null,"quantity":0},{"order_id":"6282deeb-b6d4-47e0-9971-b29f819aaf22","order_number":"dedb81223","total_amount":"0","status":"Confirmed","order_type":"Express","order_date":"2023-12-05","Delivery_date":"2023-12-27","quantity":0},{"order_id":"971d90c2-e1d6-41b7-9cea-c827680c58ca","order_number":"870171223","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-12-05","Delivery_date":"2023-12-27","quantity":0},{"order_id":"43a22e14-1a84-4eca-b901-0728645ca3b0","order_number":"3725b1123","total_amount":"20.0","status":"Confirmed","order_type":"Normal","order_date":"2023-11-16","Delivery_date":"2023-11-23","quantity":0},{"order_id":"a457c381-dde3-481d-aab0-a56c0ed317dc","order_number":"0556b1123","total_amount":"0","status":"Confirmed","order_type":"Express","order_date":"2023-11-14","Delivery_date":"2023-12-27","quantity":0},{"order_id":"c969209e-2d3c-4dba-a9ca-853c93341785","order_number":"d9fe01123","total_amount":"0","status":"Confirmed","order_type":"Normal","order_date":"2023-11-14","Delivery_date":"2023-12-27","quantity":0},{"order_id":"fbceb74c-5fca-49be-9917-ca570991f56c","order_number":"20af61123","total_amount":"0","status":"Confirmed","order_type":"Express","order_date":"2023-11-16","Delivery_date":"2023-12-27","quantity":0},{"order_id":"180b127f-466e-4c0f-8f32-8295100b2d07","order_number":"5e9e81123","total_amount":null,"status":"Ready For Delivery","order_type":"Urgent","order_date":"2023-11-06","Delivery_date":null,"quantity":0}]
/// message : "Data passed successfully"

OrderStatusModel testFromJson(String str) => OrderStatusModel.fromJson(json.decode(str));
String testToJson(OrderStatusModel data) => json.encode(data.toJson());
class OrderStatusModel {
  OrderStatusModel({
    this.status,
    this.data,
    this.message,});

  OrderStatusModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(OrderStatusData.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  List<OrderStatusData>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

/// order_id : "51cbe069-d7cf-4eb0-b6c3-b6f888eacb0f"
/// order_number : "45365124"
/// total_amount : "4.0"
/// status : "Confirmed"
/// order_type : "Normal"
/// order_date : "2024-01-16"
/// Delivery_date : "2024-01-16"
/// quantity : 2

OrderStatusData dataFromJson(String str) => OrderStatusData.fromJson(json.decode(str));
String dataToJson(OrderStatusData data) => json.encode(data.toJson());
class OrderStatusData {
  OrderStatusData({
    this.orderId,
    this.orderNumber,
    this.totalAmount,
    this.status,
    this.orderType,
    this.orderDate,
    this.deliveryDate,
    this.quantity,});

  OrderStatusData.fromJson(dynamic json) {
    orderId = json['order_id'];
    orderNumber = json['order_number'];
    totalAmount = json['total_amount'];
    status = json['status'];
    orderType = json['order_type'];
    orderDate = json['order_date'];
    deliveryDate = json['Delivery_date'];
    quantity = json['quantity'];
  }
  String? orderId;
  String? orderNumber;
  String? totalAmount;
  String? status;
  String? orderType;
  String? orderDate;
  String? deliveryDate;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = orderId;
    map['order_number'] = orderNumber;
    map['total_amount'] = totalAmount;
    map['status'] = status;
    map['order_type'] = orderType;
    map['order_date'] = orderDate;
    map['Delivery_date'] = deliveryDate;
    map['quantity'] = quantity;
    return map;
  }

}



// // To parse this JSON data, do
// //
// //     final orderStatusModel = orderStatusModelFromJson(jsonString);
//
// import 'dart:convert';
//
// OrderStatusModel orderStatusModelFromJson(String str) => OrderStatusModel.fromJson(json.decode(str));
//
// String orderStatusModelToJson(OrderStatusModel data) => json.encode(data.toJson());
//
// class OrderStatusModel {
//   final bool? status;
//   final List<OrderStatusData>? data;
//   final String? message;
//
//   OrderStatusModel({
//     this.status,
//     this.data,
//     this.message,
//   });
//
//   factory OrderStatusModel.fromJson(Map<String, dynamic> json) => OrderStatusModel(
//     status: json["status"],
//     data: json["data"] == null ? [] : List<OrderStatusData>.from(json["data"]!.map((x) => OrderStatusData.fromJson(x))),
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//     "message": message,
//   };
// }
//
// class OrderStatusData {
//   final String? orderId;
//   final String? orderNumber;
//   final String? totalAmount;
//   final Status? status;
//   final OrderType? orderType;
//   final DateTime? orderDate;
//   final DateTime? deliveryDate;
//   final int? quantity;
//
//   OrderStatusData({
//     this.orderId,
//     this.orderNumber,
//     this.totalAmount,
//     this.status,
//     this.orderType,
//     this.orderDate,
//     this.deliveryDate,
//     this.quantity,
//   });
//
//   factory OrderStatusData.fromJson(Map<String, dynamic> json) => OrderStatusData(
//     orderId: json["order_id"],
//     orderNumber: json["order_number"],
//     totalAmount: json["total_amount"],
//     status: statusValues.map[json["status"]]!,
//     orderType: orderTypeValues.map[json["order_type"]]!,
//     orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
//     deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
//     quantity: json["quantity"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "order_id": orderId,
//     "order_number": orderNumber,
//     "total_amount": totalAmount,
//     "status": statusValues.reverse[status],
//     "order_type": orderTypeValues.reverse[orderType],
//     "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
//     "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
//     "quantity": quantity,
//   };
// }
//
// enum OrderType {
//   EXPRESS,
//   NORMAL,
//   URGENT
// }
//
// final orderTypeValues = EnumValues({
//   "Express": OrderType.EXPRESS,
//   "Normal": OrderType.NORMAL,
//   "Urgent": OrderType.URGENT
// });
//
// enum Status {
//   CONFIRMATION_PENDING,
//   CONFIRMED,
//   DELIVERED,
//   READY_FOR_DELIVERY,
//   TRANSIT
// }
//
// final statusValues = EnumValues({
//   "Confirmation Pending": Status.CONFIRMATION_PENDING,
//   "Confirmed": Status.CONFIRMED,
//   "Delivered": Status.DELIVERED,
//   "Ready For Delivery": Status.READY_FOR_DELIVERY,
//   "Transit": Status.TRANSIT
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
