#!/bin/bash


  echo "------------------------------------------------------------------"
  echo "    SCRIPT PARA CRIAÇÃO DE PENDRIVE DE BOOT VIA TERMINAL          "
  echo " Desenvolvido por: Diego Castro - DC solucoes em TI               "
  echo "------------------------------------------------------------------"


  echo "Listando dispostivos"
  echo ""
  echo ""
sudo fdisk -l | grep sdc

echo "=================================================================================================================================
                                              ---   ATENÇÃO   --
	 Identifique CORRETAMENTE o seu pen drive, pois, caso contrário, poderá destruir todos os dados do seu disco rígido.
         Nos comandos a seguir, você deverá substituir o "X" pela letra correspondente ao seu pen drive. No meu caso, por exemplo,
                       é o disco identificado como "/dev/sdc", então preciso trocar o "X" pela letra "c". "
echo "================================================================================================================================"
		   

echo "============================================="
echo "informe o disco a ser desmontado, ex: sdc??:" 
echo "============================================="
read disco

sleep 5

echo "============================================"
echo "preparando dispositivo... aguarde!"
echo "============================================"
sudo umount /dev/$disco

sleep 5

sudo mkfs.vfat -I /dev/$disco
sleep 5

echo "==========================================================================="
echo "               infome o diretorio onde encontra-se a imagem.               "
echo " --- EX: /home/diego/Download/ubuntu-20.04.3-desktop-amd64.iso             "
echo "==========================================================================="
read path

sleep 5

echo "=========================================================================="
echo                           "Iniciando montagem"
echo "=========================================================================="
sudo dd if=$path of=/dev/$disco status=progress && sync

echo "=================================="
echo "------------concluido!------------"
echo "=================================="
