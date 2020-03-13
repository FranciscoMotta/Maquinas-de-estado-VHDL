
LIBRARY ieee;
USE ieee.std_logic_1164.all;

------------------------------------------------------------

ENTITY fsm_mealy IS
	PORT (w, reset, clock: IN STD_LOGIC;
			z: OUT STD_LOGIC);
END fsm_mealy;
			
------------------------------------------------------------

ARCHITECTURE arquitectura OF fsm_mealy IS

	TYPE state IS (A, B);
	SIGNAL pr_state, nx_state: state;

BEGIN
	
----------------- Seccion inferior: ------------------------

	PROCESS (reset, clock)
	BEGIN
		IF (reset='1') THEN
			pr_state <= A;
		ELSIF (clock'EVENT AND clock='1') THEN
			pr_state <= nx_state;
		END IF;
	END PROCESS;
	
----------------- Seccion superior: -----------------------
	
	PROCESS (w, pr_state)
	BEGIN
		CASE pr_state IS
			WHEN A =>
				IF (w = '1') THEN
					z <= '0';
					nx_state <= B;
				ELSE
					z <= '0';
					nx_state <= A;
				END IF;
			WHEN B =>
				IF (w = '1') THEN
					z <= '1';
					nx_state <= B;
				ELSE
					z <= '0';
					nx_state <= A;
				END IF;
		END CASE;
	END PROCESS;
END arquitectura;




