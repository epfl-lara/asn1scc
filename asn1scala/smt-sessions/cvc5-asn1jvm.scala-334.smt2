; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7904 () Bool)

(assert start!7904)

(declare-fun b!38519 () Bool)

(declare-fun res!32681 () Bool)

(declare-fun e!25290 () Bool)

(assert (=> b!38519 (=> res!32681 e!25290)))

(declare-datatypes ((List!456 0))(
  ( (Nil!453) (Cons!452 (h!571 Bool) (t!1206 List!456)) )
))
(declare-fun lt!58786 () List!456)

(declare-fun length!182 (List!456) Int)

(assert (=> b!38519 (= res!32681 (<= (length!182 lt!58786) 0))))

(declare-fun b!38520 () Bool)

(declare-fun res!32673 () Bool)

(declare-fun e!25283 () Bool)

(assert (=> b!38520 (=> res!32673 e!25283)))

(declare-datatypes ((array!1955 0))(
  ( (array!1956 (arr!1376 (Array (_ BitVec 32) (_ BitVec 8))) (size!880 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1510 0))(
  ( (BitStream!1511 (buf!1208 array!1955) (currentByte!2620 (_ BitVec 32)) (currentBit!2615 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1510)

(declare-datatypes ((Unit!2781 0))(
  ( (Unit!2782) )
))
(declare-datatypes ((tuple2!3724 0))(
  ( (tuple2!3725 (_1!1949 Unit!2781) (_2!1949 BitStream!1510)) )
))
(declare-fun lt!58762 () tuple2!3724)

(assert (=> b!38520 (= res!32673 (not (= (size!880 (buf!1208 thiss!1379)) (size!880 (buf!1208 (_2!1949 lt!58762))))))))

(declare-fun b!38521 () Bool)

(declare-fun e!25278 () Bool)

(assert (=> b!38521 (= e!25278 true)))

(declare-datatypes ((tuple2!3726 0))(
  ( (tuple2!3727 (_1!1950 BitStream!1510) (_2!1950 Bool)) )
))
(declare-fun lt!58782 () tuple2!3726)

(declare-datatypes ((tuple2!3728 0))(
  ( (tuple2!3729 (_1!1951 BitStream!1510) (_2!1951 BitStream!1510)) )
))
(declare-fun lt!58775 () tuple2!3728)

(declare-fun readBitPure!0 (BitStream!1510) tuple2!3726)

(assert (=> b!38521 (= lt!58782 (readBitPure!0 (_1!1951 lt!58775)))))

(declare-fun b!38522 () Bool)

(declare-fun e!25288 () Bool)

(declare-fun e!25284 () Bool)

(assert (=> b!38522 (= e!25288 (not e!25284))))

(declare-fun res!32669 () Bool)

(assert (=> b!38522 (=> res!32669 e!25284)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!38522 (= res!32669 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1510 BitStream!1510) Bool)

(assert (=> b!38522 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!58766 () Unit!2781)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1510) Unit!2781)

(assert (=> b!38522 (= lt!58766 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!58780 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!38522 (= lt!58780 (bitIndex!0 (size!880 (buf!1208 thiss!1379)) (currentByte!2620 thiss!1379) (currentBit!2615 thiss!1379)))))

(declare-fun srcBuffer!2 () array!1955)

(declare-fun lt!58781 () tuple2!3724)

(declare-fun e!25287 () Bool)

(declare-fun b!38523 () Bool)

(declare-fun lt!58765 () tuple2!3728)

(declare-fun head!293 (List!456) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1510 array!1955 (_ BitVec 64) (_ BitVec 64)) List!456)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1510 BitStream!1510 (_ BitVec 64)) List!456)

(assert (=> b!38523 (= e!25287 (= (head!293 (byteArrayBitContentToList!0 (_2!1949 lt!58781) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!293 (bitStreamReadBitsIntoList!0 (_2!1949 lt!58781) (_1!1951 lt!58765) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!38525 () Bool)

(declare-fun e!25280 () Bool)

(assert (=> b!38525 (= e!25280 e!25278)))

(declare-fun res!32672 () Bool)

(assert (=> b!38525 (=> res!32672 e!25278)))

(declare-fun lt!58777 () Bool)

(declare-fun lt!58779 () Bool)

(assert (=> b!38525 (= res!32672 (not (= lt!58777 lt!58779)))))

(declare-fun lt!58769 () Bool)

(assert (=> b!38525 (= lt!58769 lt!58777)))

(declare-fun bitAt!0 (array!1955 (_ BitVec 64)) Bool)

(assert (=> b!38525 (= lt!58777 (bitAt!0 (buf!1208 (_2!1949 lt!58762)) lt!58780))))

(declare-fun lt!58773 () (_ BitVec 64))

(declare-fun lt!58774 () Unit!2781)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1955 array!1955 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2781)

(assert (=> b!38525 (= lt!58774 (arrayBitRangesEqImpliesEq!0 (buf!1208 (_2!1949 lt!58781)) (buf!1208 (_2!1949 lt!58762)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!58780 lt!58773))))

(declare-fun b!38526 () Bool)

(declare-fun res!32687 () Bool)

(assert (=> b!38526 (=> (not res!32687) (not e!25288))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38526 (= res!32687 (validate_offset_bits!1 ((_ sign_extend 32) (size!880 (buf!1208 thiss!1379))) ((_ sign_extend 32) (currentByte!2620 thiss!1379)) ((_ sign_extend 32) (currentBit!2615 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!38527 () Bool)

(declare-fun e!25286 () Bool)

(declare-fun e!25277 () Bool)

(assert (=> b!38527 (= e!25286 e!25277)))

(declare-fun res!32678 () Bool)

(assert (=> b!38527 (=> res!32678 e!25277)))

(assert (=> b!38527 (= res!32678 (not (= (head!293 (byteArrayBitContentToList!0 (_2!1949 lt!58762) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!58779)))))

(assert (=> b!38527 (= lt!58779 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!38528 () Bool)

(declare-fun res!32670 () Bool)

(assert (=> b!38528 (=> res!32670 e!25283)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!38528 (= res!32670 (not (invariant!0 (currentBit!2615 (_2!1949 lt!58762)) (currentByte!2620 (_2!1949 lt!58762)) (size!880 (buf!1208 (_2!1949 lt!58762))))))))

(declare-fun b!38529 () Bool)

(declare-fun e!25276 () Bool)

(assert (=> b!38529 (= e!25276 e!25283)))

(declare-fun res!32683 () Bool)

(assert (=> b!38529 (=> res!32683 e!25283)))

(declare-fun lt!58772 () (_ BitVec 64))

(assert (=> b!38529 (= res!32683 (not (= lt!58772 (bvsub (bvadd lt!58780 to!314) i!635))))))

(assert (=> b!38529 (= lt!58772 (bitIndex!0 (size!880 (buf!1208 (_2!1949 lt!58762))) (currentByte!2620 (_2!1949 lt!58762)) (currentBit!2615 (_2!1949 lt!58762))))))

(declare-fun b!38530 () Bool)

(declare-fun e!25285 () Bool)

(assert (=> b!38530 (= e!25283 e!25285)))

(declare-fun res!32677 () Bool)

(assert (=> b!38530 (=> res!32677 e!25285)))

(assert (=> b!38530 (= res!32677 (not (= (size!880 (buf!1208 (_2!1949 lt!58781))) (size!880 (buf!1208 (_2!1949 lt!58762))))))))

(assert (=> b!38530 (= lt!58772 (bvsub (bvsub (bvadd lt!58773 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38530 (= lt!58773 (bitIndex!0 (size!880 (buf!1208 (_2!1949 lt!58781))) (currentByte!2620 (_2!1949 lt!58781)) (currentBit!2615 (_2!1949 lt!58781))))))

(assert (=> b!38530 (= (size!880 (buf!1208 (_2!1949 lt!58762))) (size!880 (buf!1208 thiss!1379)))))

(declare-fun b!38531 () Bool)

(declare-fun e!25291 () Bool)

(assert (=> b!38531 (= e!25291 e!25286)))

(declare-fun res!32679 () Bool)

(assert (=> b!38531 (=> res!32679 e!25286)))

(declare-fun lt!58785 () tuple2!3728)

(declare-fun lt!58771 () Bool)

(assert (=> b!38531 (= res!32679 (not (= lt!58771 (bitAt!0 (buf!1208 (_1!1951 lt!58785)) lt!58780))))))

(assert (=> b!38531 (= lt!58771 (bitAt!0 (buf!1208 (_1!1951 lt!58775)) lt!58780))))

(declare-fun b!38532 () Bool)

(assert (=> b!38532 (= e!25290 e!25291)))

(declare-fun res!32686 () Bool)

(assert (=> b!38532 (=> res!32686 e!25291)))

(declare-fun lt!58770 () List!456)

(declare-fun lt!58763 () List!456)

(assert (=> b!38532 (= res!32686 (not (= lt!58770 lt!58763)))))

(assert (=> b!38532 (= lt!58763 lt!58770)))

(declare-fun tail!173 (List!456) List!456)

(assert (=> b!38532 (= lt!58770 (tail!173 lt!58786))))

(declare-fun lt!58783 () Unit!2781)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1510 BitStream!1510 BitStream!1510 BitStream!1510 (_ BitVec 64) List!456) Unit!2781)

(assert (=> b!38532 (= lt!58783 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1949 lt!58762) (_2!1949 lt!58762) (_1!1951 lt!58775) (_1!1951 lt!58785) (bvsub to!314 i!635) lt!58786))))

(declare-fun b!38533 () Bool)

(declare-fun e!25289 () Bool)

(declare-fun array_inv!808 (array!1955) Bool)

(assert (=> b!38533 (= e!25289 (array_inv!808 (buf!1208 thiss!1379)))))

(declare-fun b!38534 () Bool)

(declare-fun res!32682 () Bool)

(assert (=> b!38534 (=> res!32682 e!25285)))

(assert (=> b!38534 (= res!32682 (not (invariant!0 (currentBit!2615 (_2!1949 lt!58781)) (currentByte!2620 (_2!1949 lt!58781)) (size!880 (buf!1208 (_2!1949 lt!58762))))))))

(declare-fun b!38535 () Bool)

(assert (=> b!38535 (= e!25285 e!25290)))

(declare-fun res!32675 () Bool)

(assert (=> b!38535 (=> res!32675 e!25290)))

(assert (=> b!38535 (= res!32675 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!58778 () (_ BitVec 64))

(assert (=> b!38535 (= lt!58763 (bitStreamReadBitsIntoList!0 (_2!1949 lt!58762) (_1!1951 lt!58785) lt!58778))))

(assert (=> b!38535 (= lt!58786 (bitStreamReadBitsIntoList!0 (_2!1949 lt!58762) (_1!1951 lt!58775) (bvsub to!314 i!635)))))

(assert (=> b!38535 (validate_offset_bits!1 ((_ sign_extend 32) (size!880 (buf!1208 (_2!1949 lt!58762)))) ((_ sign_extend 32) (currentByte!2620 (_2!1949 lt!58781))) ((_ sign_extend 32) (currentBit!2615 (_2!1949 lt!58781))) lt!58778)))

(declare-fun lt!58767 () Unit!2781)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1510 array!1955 (_ BitVec 64)) Unit!2781)

(assert (=> b!38535 (= lt!58767 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1949 lt!58781) (buf!1208 (_2!1949 lt!58762)) lt!58778))))

(declare-fun reader!0 (BitStream!1510 BitStream!1510) tuple2!3728)

(assert (=> b!38535 (= lt!58785 (reader!0 (_2!1949 lt!58781) (_2!1949 lt!58762)))))

(assert (=> b!38535 (validate_offset_bits!1 ((_ sign_extend 32) (size!880 (buf!1208 (_2!1949 lt!58762)))) ((_ sign_extend 32) (currentByte!2620 thiss!1379)) ((_ sign_extend 32) (currentBit!2615 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!58776 () Unit!2781)

(assert (=> b!38535 (= lt!58776 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1208 (_2!1949 lt!58762)) (bvsub to!314 i!635)))))

(assert (=> b!38535 (= lt!58775 (reader!0 thiss!1379 (_2!1949 lt!58762)))))

(declare-fun b!38536 () Bool)

(declare-fun res!32671 () Bool)

(assert (=> b!38536 (=> res!32671 e!25285)))

(assert (=> b!38536 (= res!32671 (not (invariant!0 (currentBit!2615 (_2!1949 lt!58781)) (currentByte!2620 (_2!1949 lt!58781)) (size!880 (buf!1208 (_2!1949 lt!58781))))))))

(declare-fun b!38537 () Bool)

(declare-fun e!25282 () Bool)

(assert (=> b!38537 (= e!25284 e!25282)))

(declare-fun res!32680 () Bool)

(assert (=> b!38537 (=> res!32680 e!25282)))

(assert (=> b!38537 (= res!32680 (not (isPrefixOf!0 thiss!1379 (_2!1949 lt!58781))))))

(assert (=> b!38537 (validate_offset_bits!1 ((_ sign_extend 32) (size!880 (buf!1208 (_2!1949 lt!58781)))) ((_ sign_extend 32) (currentByte!2620 (_2!1949 lt!58781))) ((_ sign_extend 32) (currentBit!2615 (_2!1949 lt!58781))) lt!58778)))

(assert (=> b!38537 (= lt!58778 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!58784 () Unit!2781)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1510 BitStream!1510 (_ BitVec 64) (_ BitVec 64)) Unit!2781)

(assert (=> b!38537 (= lt!58784 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1949 lt!58781) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1510 (_ BitVec 8) (_ BitVec 32)) tuple2!3724)

(assert (=> b!38537 (= lt!58781 (appendBitFromByte!0 thiss!1379 (select (arr!1376 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!38524 () Bool)

(assert (=> b!38524 (= e!25282 e!25276)))

(declare-fun res!32685 () Bool)

(assert (=> b!38524 (=> res!32685 e!25276)))

(assert (=> b!38524 (= res!32685 (not (isPrefixOf!0 (_2!1949 lt!58781) (_2!1949 lt!58762))))))

(assert (=> b!38524 (isPrefixOf!0 thiss!1379 (_2!1949 lt!58762))))

(declare-fun lt!58768 () Unit!2781)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1510 BitStream!1510 BitStream!1510) Unit!2781)

(assert (=> b!38524 (= lt!58768 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1949 lt!58781) (_2!1949 lt!58762)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1510 array!1955 (_ BitVec 64) (_ BitVec 64)) tuple2!3724)

(assert (=> b!38524 (= lt!58762 (appendBitsMSBFirstLoop!0 (_2!1949 lt!58781) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!38524 e!25287))

(declare-fun res!32674 () Bool)

(assert (=> b!38524 (=> (not res!32674) (not e!25287))))

(assert (=> b!38524 (= res!32674 (validate_offset_bits!1 ((_ sign_extend 32) (size!880 (buf!1208 (_2!1949 lt!58781)))) ((_ sign_extend 32) (currentByte!2620 thiss!1379)) ((_ sign_extend 32) (currentBit!2615 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!58764 () Unit!2781)

(assert (=> b!38524 (= lt!58764 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1208 (_2!1949 lt!58781)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38524 (= lt!58765 (reader!0 thiss!1379 (_2!1949 lt!58781)))))

(declare-fun res!32688 () Bool)

(assert (=> start!7904 (=> (not res!32688) (not e!25288))))

(assert (=> start!7904 (= res!32688 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!880 srcBuffer!2))))))))

(assert (=> start!7904 e!25288))

(assert (=> start!7904 true))

(assert (=> start!7904 (array_inv!808 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1510) Bool)

(assert (=> start!7904 (and (inv!12 thiss!1379) e!25289)))

(declare-fun b!38538 () Bool)

(declare-fun res!32676 () Bool)

(assert (=> b!38538 (=> res!32676 e!25286)))

(assert (=> b!38538 (= res!32676 (not (= (head!293 lt!58786) lt!58771)))))

(declare-fun b!38539 () Bool)

(assert (=> b!38539 (= e!25277 e!25280)))

(declare-fun res!32684 () Bool)

(assert (=> b!38539 (=> res!32684 e!25280)))

(assert (=> b!38539 (= res!32684 (not (= lt!58769 lt!58779)))))

(assert (=> b!38539 (= lt!58769 (bitAt!0 (buf!1208 (_2!1949 lt!58781)) lt!58780))))

(assert (= (and start!7904 res!32688) b!38526))

(assert (= (and b!38526 res!32687) b!38522))

(assert (= (and b!38522 (not res!32669)) b!38537))

(assert (= (and b!38537 (not res!32680)) b!38524))

(assert (= (and b!38524 res!32674) b!38523))

(assert (= (and b!38524 (not res!32685)) b!38529))

(assert (= (and b!38529 (not res!32683)) b!38528))

(assert (= (and b!38528 (not res!32670)) b!38520))

(assert (= (and b!38520 (not res!32673)) b!38530))

(assert (= (and b!38530 (not res!32677)) b!38536))

(assert (= (and b!38536 (not res!32671)) b!38534))

(assert (= (and b!38534 (not res!32682)) b!38535))

(assert (= (and b!38535 (not res!32675)) b!38519))

(assert (= (and b!38519 (not res!32681)) b!38532))

(assert (= (and b!38532 (not res!32686)) b!38531))

(assert (= (and b!38531 (not res!32679)) b!38538))

(assert (= (and b!38538 (not res!32676)) b!38527))

(assert (= (and b!38527 (not res!32678)) b!38539))

(assert (= (and b!38539 (not res!32684)) b!38525))

(assert (= (and b!38525 (not res!32672)) b!38521))

(assert (= start!7904 b!38533))

(declare-fun m!58695 () Bool)

(assert (=> b!38527 m!58695))

(assert (=> b!38527 m!58695))

(declare-fun m!58697 () Bool)

(assert (=> b!38527 m!58697))

(declare-fun m!58699 () Bool)

(assert (=> b!38527 m!58699))

(declare-fun m!58701 () Bool)

(assert (=> b!38526 m!58701))

(declare-fun m!58703 () Bool)

(assert (=> b!38524 m!58703))

(declare-fun m!58705 () Bool)

(assert (=> b!38524 m!58705))

(declare-fun m!58707 () Bool)

(assert (=> b!38524 m!58707))

(declare-fun m!58709 () Bool)

(assert (=> b!38524 m!58709))

(declare-fun m!58711 () Bool)

(assert (=> b!38524 m!58711))

(declare-fun m!58713 () Bool)

(assert (=> b!38524 m!58713))

(declare-fun m!58715 () Bool)

(assert (=> b!38524 m!58715))

(declare-fun m!58717 () Bool)

(assert (=> b!38533 m!58717))

(declare-fun m!58719 () Bool)

(assert (=> b!38530 m!58719))

(declare-fun m!58721 () Bool)

(assert (=> b!38521 m!58721))

(declare-fun m!58723 () Bool)

(assert (=> b!38531 m!58723))

(declare-fun m!58725 () Bool)

(assert (=> b!38531 m!58725))

(declare-fun m!58727 () Bool)

(assert (=> b!38538 m!58727))

(declare-fun m!58729 () Bool)

(assert (=> b!38534 m!58729))

(declare-fun m!58731 () Bool)

(assert (=> b!38539 m!58731))

(declare-fun m!58733 () Bool)

(assert (=> b!38522 m!58733))

(declare-fun m!58735 () Bool)

(assert (=> b!38522 m!58735))

(declare-fun m!58737 () Bool)

(assert (=> b!38522 m!58737))

(declare-fun m!58739 () Bool)

(assert (=> b!38529 m!58739))

(declare-fun m!58741 () Bool)

(assert (=> b!38525 m!58741))

(declare-fun m!58743 () Bool)

(assert (=> b!38525 m!58743))

(declare-fun m!58745 () Bool)

(assert (=> b!38536 m!58745))

(declare-fun m!58747 () Bool)

(assert (=> b!38528 m!58747))

(declare-fun m!58749 () Bool)

(assert (=> b!38532 m!58749))

(declare-fun m!58751 () Bool)

(assert (=> b!38532 m!58751))

(declare-fun m!58753 () Bool)

(assert (=> start!7904 m!58753))

(declare-fun m!58755 () Bool)

(assert (=> start!7904 m!58755))

(declare-fun m!58757 () Bool)

(assert (=> b!38519 m!58757))

(declare-fun m!58759 () Bool)

(assert (=> b!38523 m!58759))

(assert (=> b!38523 m!58759))

(declare-fun m!58761 () Bool)

(assert (=> b!38523 m!58761))

(declare-fun m!58763 () Bool)

(assert (=> b!38523 m!58763))

(assert (=> b!38523 m!58763))

(declare-fun m!58765 () Bool)

(assert (=> b!38523 m!58765))

(declare-fun m!58767 () Bool)

(assert (=> b!38535 m!58767))

(declare-fun m!58769 () Bool)

(assert (=> b!38535 m!58769))

(declare-fun m!58771 () Bool)

(assert (=> b!38535 m!58771))

(declare-fun m!58773 () Bool)

(assert (=> b!38535 m!58773))

(declare-fun m!58775 () Bool)

(assert (=> b!38535 m!58775))

(declare-fun m!58777 () Bool)

(assert (=> b!38535 m!58777))

(declare-fun m!58779 () Bool)

(assert (=> b!38535 m!58779))

(declare-fun m!58781 () Bool)

(assert (=> b!38535 m!58781))

(declare-fun m!58783 () Bool)

(assert (=> b!38537 m!58783))

(declare-fun m!58785 () Bool)

(assert (=> b!38537 m!58785))

(declare-fun m!58787 () Bool)

(assert (=> b!38537 m!58787))

(declare-fun m!58789 () Bool)

(assert (=> b!38537 m!58789))

(assert (=> b!38537 m!58785))

(declare-fun m!58791 () Bool)

(assert (=> b!38537 m!58791))

(push 1)

(assert (not b!38531))

(assert (not b!38536))

(assert (not b!38526))

(assert (not b!38523))

(assert (not b!38519))

(assert (not b!38539))

(assert (not b!38534))

(assert (not b!38537))

(assert (not b!38527))

(assert (not b!38524))

(assert (not b!38521))

(assert (not b!38525))

(assert (not b!38532))

(assert (not b!38538))

(assert (not b!38533))

(assert (not start!7904))

(assert (not b!38529))

(assert (not b!38522))

(assert (not b!38535))

(assert (not b!38530))

(assert (not b!38528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

