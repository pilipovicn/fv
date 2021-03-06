library ieee;
use ieee.std_logic_1164.all;


entity figure1_3 is
  port( clk: in std_logic;
        rst: in std_logic;
        A: in std_logic;
        B: in std_logic;
        C: in std_logic;
        D: in std_logic;
        E: in std_logic;
        F: in std_logic;
        G: in std_logic;
        H: in std_logic;
        output: out std_logic);
end figure1_3;

architecture arch of figure1_3 is
  signal dec1_ctrl: std_logic_vector(1 downto 0);
  signal dec2_ctrl: std_logic_vector(1 downto 0);
  signal dec1: std_logic_vector(3 downto 0);
  signal dec2: std_logic_vector(3 downto 0);
  signal mux_ctrl: std_logic_vector(3 downto 0);
  signal mux_out: std_logic;
  signal enable: std_logic := '1';
begin

  dec1_ctrl <= F & E;
  dec2_ctrl <= H & G;
  mux_ctrl <= D & C & B & A;
  
  with dec1_ctrl select
    dec1 <= "0001" when "00",
    "0010" when "01",
    "0100" when "10",
    "1000" when others;
  
  with dec2_ctrl select
    dec2 <= "0001" when "00",
    "0010" when "01",
    "0100" when "10",
    "1000" when others;
    
  with mux_ctrl select
    mux_out <= dec1(0) when "0000",
    dec1(1) when "0001",
    dec1(2) when "0010",
    dec1(3) when "0011",
    dec2(0) when "0100",
    dec2(1) when "0101",
    dec2(2) when "0110",
    dec2(3) when "0111",
    enable when others;
  
  process(clk) is
  begin
    if(rising_edge(clk)) then
      if(rst='1') then
        output <= '0';
      else
        output <= mux_out;
      end if; 
    end if;
  end process;
  
end architecture arch;
