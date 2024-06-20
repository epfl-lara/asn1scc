; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13392 () Bool)

(assert start!13392)

(declare-fun b!68640 () Bool)

(declare-fun e!44890 () Bool)

(declare-fun e!44880 () Bool)

(assert (=> b!68640 (= e!44890 e!44880)))

(declare-fun res!56751 () Bool)

(assert (=> b!68640 (=> res!56751 e!44880)))

(declare-datatypes ((array!2890 0))(
  ( (array!2891 (arr!1916 (Array (_ BitVec 32) (_ BitVec 8))) (size!1340 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2290 0))(
  ( (BitStream!2291 (buf!1721 array!2890) (currentByte!3417 (_ BitVec 32)) (currentBit!3412 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4613 0))(
  ( (Unit!4614) )
))
(declare-datatypes ((tuple2!6012 0))(
  ( (tuple2!6013 (_1!3117 Unit!4613) (_2!3117 BitStream!2290)) )
))
(declare-fun lt!109888 () tuple2!6012)

(declare-fun lt!109884 () tuple2!6012)

(assert (=> b!68640 (= res!56751 (not (= (size!1340 (buf!1721 (_2!3117 lt!109888))) (size!1340 (buf!1721 (_2!3117 lt!109884))))))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!109886 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!109882 () (_ BitVec 64))

(assert (=> b!68640 (= lt!109882 (bvsub (bvsub (bvadd lt!109886 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!68640 (= lt!109886 (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109888))) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888))))))

(declare-fun thiss!1379 () BitStream!2290)

(assert (=> b!68640 (= (size!1340 (buf!1721 (_2!3117 lt!109884))) (size!1340 (buf!1721 thiss!1379)))))

(declare-fun b!68641 () Bool)

(declare-fun res!56760 () Bool)

(assert (=> b!68641 (=> res!56760 e!44890)))

(assert (=> b!68641 (= res!56760 (not (= (size!1340 (buf!1721 thiss!1379)) (size!1340 (buf!1721 (_2!3117 lt!109884))))))))

(declare-fun b!68642 () Bool)

(declare-fun res!56766 () Bool)

(declare-fun e!44888 () Bool)

(assert (=> b!68642 (=> res!56766 e!44888)))

(declare-fun lt!109892 () (_ BitVec 64))

(declare-fun lt!109896 () Bool)

(declare-fun bitAt!0 (array!2890 (_ BitVec 64)) Bool)

(assert (=> b!68642 (= res!56766 (not (= (bitAt!0 (buf!1721 (_2!3117 lt!109888)) lt!109892) lt!109896)))))

(declare-fun b!68643 () Bool)

(declare-fun res!56756 () Bool)

(assert (=> b!68643 (=> res!56756 e!44880)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!68643 (= res!56756 (not (invariant!0 (currentBit!3412 (_2!3117 lt!109888)) (currentByte!3417 (_2!3117 lt!109888)) (size!1340 (buf!1721 (_2!3117 lt!109884))))))))

(declare-fun b!68644 () Bool)

(declare-fun e!44889 () Bool)

(declare-fun e!44881 () Bool)

(assert (=> b!68644 (= e!44889 e!44881)))

(declare-fun res!56764 () Bool)

(assert (=> b!68644 (=> res!56764 e!44881)))

(declare-datatypes ((List!720 0))(
  ( (Nil!717) (Cons!716 (h!835 Bool) (t!1470 List!720)) )
))
(declare-fun lt!109885 () List!720)

(declare-fun lt!109883 () List!720)

(assert (=> b!68644 (= res!56764 (not (= lt!109885 lt!109883)))))

(assert (=> b!68644 (= lt!109883 lt!109885)))

(declare-fun lt!109879 () List!720)

(declare-fun tail!324 (List!720) List!720)

(assert (=> b!68644 (= lt!109885 (tail!324 lt!109879))))

(declare-fun lt!109897 () Unit!4613)

(declare-datatypes ((tuple2!6014 0))(
  ( (tuple2!6015 (_1!3118 BitStream!2290) (_2!3118 BitStream!2290)) )
))
(declare-fun lt!109877 () tuple2!6014)

(declare-fun lt!109881 () tuple2!6014)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2290 BitStream!2290 BitStream!2290 BitStream!2290 (_ BitVec 64) List!720) Unit!4613)

(assert (=> b!68644 (= lt!109897 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3117 lt!109884) (_2!3117 lt!109884) (_1!3118 lt!109881) (_1!3118 lt!109877) (bvsub to!314 i!635) lt!109879))))

(declare-fun b!68645 () Bool)

(assert (=> b!68645 (= e!44888 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!109886) (bvsle lt!109886 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888))))))))))

(declare-fun b!68646 () Bool)

(declare-fun e!44883 () Bool)

(declare-fun e!44887 () Bool)

(assert (=> b!68646 (= e!44883 e!44887)))

(declare-fun res!56759 () Bool)

(assert (=> b!68646 (=> res!56759 e!44887)))

(declare-fun isPrefixOf!0 (BitStream!2290 BitStream!2290) Bool)

(assert (=> b!68646 (= res!56759 (not (isPrefixOf!0 thiss!1379 (_2!3117 lt!109888))))))

(declare-fun lt!109880 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68646 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888))) lt!109880)))

(assert (=> b!68646 (= lt!109880 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109889 () Unit!4613)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2290 BitStream!2290 (_ BitVec 64) (_ BitVec 64)) Unit!4613)

(assert (=> b!68646 (= lt!109889 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3117 lt!109888) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2890)

(declare-fun appendBitFromByte!0 (BitStream!2290 (_ BitVec 8) (_ BitVec 32)) tuple2!6012)

(assert (=> b!68646 (= lt!109888 (appendBitFromByte!0 thiss!1379 (select (arr!1916 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!68648 () Bool)

(declare-fun e!44886 () Bool)

(assert (=> b!68648 (= e!44886 e!44890)))

(declare-fun res!56763 () Bool)

(assert (=> b!68648 (=> res!56763 e!44890)))

(assert (=> b!68648 (= res!56763 (not (= lt!109882 (bvsub (bvadd lt!109892 to!314) i!635))))))

(assert (=> b!68648 (= lt!109882 (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109884))) (currentByte!3417 (_2!3117 lt!109884)) (currentBit!3412 (_2!3117 lt!109884))))))

(declare-fun b!68649 () Bool)

(declare-fun res!56761 () Bool)

(assert (=> b!68649 (=> res!56761 e!44890)))

(assert (=> b!68649 (= res!56761 (not (invariant!0 (currentBit!3412 (_2!3117 lt!109884)) (currentByte!3417 (_2!3117 lt!109884)) (size!1340 (buf!1721 (_2!3117 lt!109884))))))))

(declare-fun b!68650 () Bool)

(declare-fun res!56749 () Bool)

(declare-fun e!44878 () Bool)

(assert (=> b!68650 (=> (not res!56749) (not e!44878))))

(assert (=> b!68650 (= res!56749 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 thiss!1379))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!68651 () Bool)

(declare-fun e!44891 () Bool)

(assert (=> b!68651 (= e!44891 e!44888)))

(declare-fun res!56752 () Bool)

(assert (=> b!68651 (=> res!56752 e!44888)))

(declare-fun head!539 (List!720) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2290 array!2890 (_ BitVec 64) (_ BitVec 64)) List!720)

(assert (=> b!68651 (= res!56752 (not (= (head!539 (byteArrayBitContentToList!0 (_2!3117 lt!109884) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!109896)))))

(assert (=> b!68651 (= lt!109896 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!68652 () Bool)

(declare-fun res!56765 () Bool)

(assert (=> b!68652 (=> res!56765 e!44891)))

(declare-fun lt!109895 () Bool)

(assert (=> b!68652 (= res!56765 (not (= (head!539 lt!109879) lt!109895)))))

(declare-fun b!68653 () Bool)

(assert (=> b!68653 (= e!44878 (not e!44883))))

(declare-fun res!56762 () Bool)

(assert (=> b!68653 (=> res!56762 e!44883)))

(assert (=> b!68653 (= res!56762 (bvsge i!635 to!314))))

(assert (=> b!68653 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!109890 () Unit!4613)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2290) Unit!4613)

(assert (=> b!68653 (= lt!109890 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!68653 (= lt!109892 (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)))))

(declare-fun b!68654 () Bool)

(declare-fun e!44882 () Bool)

(declare-fun array_inv!1204 (array!2890) Bool)

(assert (=> b!68654 (= e!44882 (array_inv!1204 (buf!1721 thiss!1379)))))

(declare-fun lt!109893 () tuple2!6014)

(declare-fun e!44884 () Bool)

(declare-fun b!68655 () Bool)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2290 BitStream!2290 (_ BitVec 64)) List!720)

(assert (=> b!68655 (= e!44884 (= (head!539 (byteArrayBitContentToList!0 (_2!3117 lt!109888) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!539 (bitStreamReadBitsIntoList!0 (_2!3117 lt!109888) (_1!3118 lt!109893) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!56753 () Bool)

(assert (=> start!13392 (=> (not res!56753) (not e!44878))))

(assert (=> start!13392 (= res!56753 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1340 srcBuffer!2))))))))

(assert (=> start!13392 e!44878))

(assert (=> start!13392 true))

(assert (=> start!13392 (array_inv!1204 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2290) Bool)

(assert (=> start!13392 (and (inv!12 thiss!1379) e!44882)))

(declare-fun b!68647 () Bool)

(assert (=> b!68647 (= e!44880 e!44889)))

(declare-fun res!56754 () Bool)

(assert (=> b!68647 (=> res!56754 e!44889)))

(assert (=> b!68647 (= res!56754 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!68647 (= lt!109883 (bitStreamReadBitsIntoList!0 (_2!3117 lt!109884) (_1!3118 lt!109877) lt!109880))))

(assert (=> b!68647 (= lt!109879 (bitStreamReadBitsIntoList!0 (_2!3117 lt!109884) (_1!3118 lt!109881) (bvsub to!314 i!635)))))

(assert (=> b!68647 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109884)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888))) lt!109880)))

(declare-fun lt!109894 () Unit!4613)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2290 array!2890 (_ BitVec 64)) Unit!4613)

(assert (=> b!68647 (= lt!109894 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3117 lt!109888) (buf!1721 (_2!3117 lt!109884)) lt!109880))))

(declare-fun reader!0 (BitStream!2290 BitStream!2290) tuple2!6014)

(assert (=> b!68647 (= lt!109877 (reader!0 (_2!3117 lt!109888) (_2!3117 lt!109884)))))

(assert (=> b!68647 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109884)))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!109891 () Unit!4613)

(assert (=> b!68647 (= lt!109891 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1721 (_2!3117 lt!109884)) (bvsub to!314 i!635)))))

(assert (=> b!68647 (= lt!109881 (reader!0 thiss!1379 (_2!3117 lt!109884)))))

(declare-fun b!68656 () Bool)

(assert (=> b!68656 (= e!44881 e!44891)))

(declare-fun res!56750 () Bool)

(assert (=> b!68656 (=> res!56750 e!44891)))

(assert (=> b!68656 (= res!56750 (not (= lt!109895 (bitAt!0 (buf!1721 (_1!3118 lt!109877)) lt!109892))))))

(assert (=> b!68656 (= lt!109895 (bitAt!0 (buf!1721 (_1!3118 lt!109881)) lt!109892))))

(declare-fun b!68657 () Bool)

(assert (=> b!68657 (= e!44887 e!44886)))

(declare-fun res!56758 () Bool)

(assert (=> b!68657 (=> res!56758 e!44886)))

(assert (=> b!68657 (= res!56758 (not (isPrefixOf!0 (_2!3117 lt!109888) (_2!3117 lt!109884))))))

(assert (=> b!68657 (isPrefixOf!0 thiss!1379 (_2!3117 lt!109884))))

(declare-fun lt!109887 () Unit!4613)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2290 BitStream!2290 BitStream!2290) Unit!4613)

(assert (=> b!68657 (= lt!109887 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3117 lt!109888) (_2!3117 lt!109884)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2290 array!2890 (_ BitVec 64) (_ BitVec 64)) tuple2!6012)

(assert (=> b!68657 (= lt!109884 (appendBitsMSBFirstLoop!0 (_2!3117 lt!109888) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!68657 e!44884))

(declare-fun res!56757 () Bool)

(assert (=> b!68657 (=> (not res!56757) (not e!44884))))

(assert (=> b!68657 (= res!56757 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109878 () Unit!4613)

(assert (=> b!68657 (= lt!109878 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1721 (_2!3117 lt!109888)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!68657 (= lt!109893 (reader!0 thiss!1379 (_2!3117 lt!109888)))))

(declare-fun b!68658 () Bool)

(declare-fun res!56748 () Bool)

(assert (=> b!68658 (=> res!56748 e!44880)))

(assert (=> b!68658 (= res!56748 (not (invariant!0 (currentBit!3412 (_2!3117 lt!109888)) (currentByte!3417 (_2!3117 lt!109888)) (size!1340 (buf!1721 (_2!3117 lt!109888))))))))

(declare-fun b!68659 () Bool)

(declare-fun res!56755 () Bool)

(assert (=> b!68659 (=> res!56755 e!44889)))

(declare-fun length!348 (List!720) Int)

(assert (=> b!68659 (= res!56755 (<= (length!348 lt!109879) 0))))

(assert (= (and start!13392 res!56753) b!68650))

(assert (= (and b!68650 res!56749) b!68653))

(assert (= (and b!68653 (not res!56762)) b!68646))

(assert (= (and b!68646 (not res!56759)) b!68657))

(assert (= (and b!68657 res!56757) b!68655))

(assert (= (and b!68657 (not res!56758)) b!68648))

(assert (= (and b!68648 (not res!56763)) b!68649))

(assert (= (and b!68649 (not res!56761)) b!68641))

(assert (= (and b!68641 (not res!56760)) b!68640))

(assert (= (and b!68640 (not res!56751)) b!68658))

(assert (= (and b!68658 (not res!56748)) b!68643))

(assert (= (and b!68643 (not res!56756)) b!68647))

(assert (= (and b!68647 (not res!56754)) b!68659))

(assert (= (and b!68659 (not res!56755)) b!68644))

(assert (= (and b!68644 (not res!56764)) b!68656))

(assert (= (and b!68656 (not res!56750)) b!68652))

(assert (= (and b!68652 (not res!56765)) b!68651))

(assert (= (and b!68651 (not res!56752)) b!68642))

(assert (= (and b!68642 (not res!56766)) b!68645))

(assert (= start!13392 b!68654))

(declare-fun m!109603 () Bool)

(assert (=> b!68650 m!109603))

(declare-fun m!109605 () Bool)

(assert (=> b!68655 m!109605))

(assert (=> b!68655 m!109605))

(declare-fun m!109607 () Bool)

(assert (=> b!68655 m!109607))

(declare-fun m!109609 () Bool)

(assert (=> b!68655 m!109609))

(assert (=> b!68655 m!109609))

(declare-fun m!109611 () Bool)

(assert (=> b!68655 m!109611))

(declare-fun m!109613 () Bool)

(assert (=> b!68652 m!109613))

(declare-fun m!109615 () Bool)

(assert (=> b!68656 m!109615))

(declare-fun m!109617 () Bool)

(assert (=> b!68656 m!109617))

(declare-fun m!109619 () Bool)

(assert (=> b!68648 m!109619))

(declare-fun m!109621 () Bool)

(assert (=> b!68642 m!109621))

(declare-fun m!109623 () Bool)

(assert (=> b!68653 m!109623))

(declare-fun m!109625 () Bool)

(assert (=> b!68653 m!109625))

(declare-fun m!109627 () Bool)

(assert (=> b!68653 m!109627))

(declare-fun m!109629 () Bool)

(assert (=> b!68657 m!109629))

(declare-fun m!109631 () Bool)

(assert (=> b!68657 m!109631))

(declare-fun m!109633 () Bool)

(assert (=> b!68657 m!109633))

(declare-fun m!109635 () Bool)

(assert (=> b!68657 m!109635))

(declare-fun m!109637 () Bool)

(assert (=> b!68657 m!109637))

(declare-fun m!109639 () Bool)

(assert (=> b!68657 m!109639))

(declare-fun m!109641 () Bool)

(assert (=> b!68657 m!109641))

(declare-fun m!109643 () Bool)

(assert (=> b!68651 m!109643))

(assert (=> b!68651 m!109643))

(declare-fun m!109645 () Bool)

(assert (=> b!68651 m!109645))

(declare-fun m!109647 () Bool)

(assert (=> b!68651 m!109647))

(declare-fun m!109649 () Bool)

(assert (=> b!68654 m!109649))

(declare-fun m!109651 () Bool)

(assert (=> b!68646 m!109651))

(declare-fun m!109653 () Bool)

(assert (=> b!68646 m!109653))

(declare-fun m!109655 () Bool)

(assert (=> b!68646 m!109655))

(declare-fun m!109657 () Bool)

(assert (=> b!68646 m!109657))

(assert (=> b!68646 m!109653))

(declare-fun m!109659 () Bool)

(assert (=> b!68646 m!109659))

(declare-fun m!109661 () Bool)

(assert (=> b!68640 m!109661))

(declare-fun m!109663 () Bool)

(assert (=> b!68659 m!109663))

(declare-fun m!109665 () Bool)

(assert (=> b!68658 m!109665))

(declare-fun m!109667 () Bool)

(assert (=> b!68649 m!109667))

(declare-fun m!109669 () Bool)

(assert (=> b!68644 m!109669))

(declare-fun m!109671 () Bool)

(assert (=> b!68644 m!109671))

(declare-fun m!109673 () Bool)

(assert (=> b!68647 m!109673))

(declare-fun m!109675 () Bool)

(assert (=> b!68647 m!109675))

(declare-fun m!109677 () Bool)

(assert (=> b!68647 m!109677))

(declare-fun m!109679 () Bool)

(assert (=> b!68647 m!109679))

(declare-fun m!109681 () Bool)

(assert (=> b!68647 m!109681))

(declare-fun m!109683 () Bool)

(assert (=> b!68647 m!109683))

(declare-fun m!109685 () Bool)

(assert (=> b!68647 m!109685))

(declare-fun m!109687 () Bool)

(assert (=> b!68647 m!109687))

(declare-fun m!109689 () Bool)

(assert (=> b!68643 m!109689))

(declare-fun m!109691 () Bool)

(assert (=> start!13392 m!109691))

(declare-fun m!109693 () Bool)

(assert (=> start!13392 m!109693))

(push 1)

(assert (not b!68659))

(assert (not b!68642))

(assert (not b!68646))

(assert (not b!68653))

(assert (not start!13392))

(assert (not b!68644))

(assert (not b!68657))

(assert (not b!68649))

(assert (not b!68655))

(assert (not b!68656))

(assert (not b!68654))

(assert (not b!68647))

(assert (not b!68658))

(assert (not b!68643))

(assert (not b!68640))

(assert (not b!68650))

(assert (not b!68652))

(assert (not b!68651))

(assert (not b!68648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!21882 () Bool)

(assert (=> d!21882 (= (invariant!0 (currentBit!3412 (_2!3117 lt!109884)) (currentByte!3417 (_2!3117 lt!109884)) (size!1340 (buf!1721 (_2!3117 lt!109884)))) (and (bvsge (currentBit!3412 (_2!3117 lt!109884)) #b00000000000000000000000000000000) (bvslt (currentBit!3412 (_2!3117 lt!109884)) #b00000000000000000000000000001000) (bvsge (currentByte!3417 (_2!3117 lt!109884)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3417 (_2!3117 lt!109884)) (size!1340 (buf!1721 (_2!3117 lt!109884)))) (and (= (currentBit!3412 (_2!3117 lt!109884)) #b00000000000000000000000000000000) (= (currentByte!3417 (_2!3117 lt!109884)) (size!1340 (buf!1721 (_2!3117 lt!109884))))))))))

(assert (=> b!68649 d!21882))

(declare-fun d!21890 () Bool)

(declare-fun size!1344 (List!720) Int)

(assert (=> d!21890 (= (length!348 lt!109879) (size!1344 lt!109879))))

(declare-fun bs!5283 () Bool)

(assert (= bs!5283 d!21890))

(declare-fun m!110001 () Bool)

(assert (=> bs!5283 m!110001))

(assert (=> b!68659 d!21890))

(declare-fun d!21894 () Bool)

(declare-fun e!45024 () Bool)

(assert (=> d!21894 e!45024))

(declare-fun res!56937 () Bool)

(assert (=> d!21894 (=> (not res!56937) (not e!45024))))

(declare-fun lt!110183 () (_ BitVec 64))

(declare-fun lt!110184 () (_ BitVec 64))

(declare-fun lt!110185 () (_ BitVec 64))

(assert (=> d!21894 (= res!56937 (= lt!110184 (bvsub lt!110183 lt!110185)))))

(assert (=> d!21894 (or (= (bvand lt!110183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110185 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110183 lt!110185) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21894 (= lt!110185 (remainingBits!0 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109884)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109884))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109884)))))))

(declare-fun lt!110180 () (_ BitVec 64))

(declare-fun lt!110182 () (_ BitVec 64))

(assert (=> d!21894 (= lt!110183 (bvmul lt!110180 lt!110182))))

(assert (=> d!21894 (or (= lt!110180 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!110182 (bvsdiv (bvmul lt!110180 lt!110182) lt!110180)))))

(assert (=> d!21894 (= lt!110182 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21894 (= lt!110180 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109884)))))))

(assert (=> d!21894 (= lt!110184 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109884))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109884)))))))

(assert (=> d!21894 (invariant!0 (currentBit!3412 (_2!3117 lt!109884)) (currentByte!3417 (_2!3117 lt!109884)) (size!1340 (buf!1721 (_2!3117 lt!109884))))))

(assert (=> d!21894 (= (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109884))) (currentByte!3417 (_2!3117 lt!109884)) (currentBit!3412 (_2!3117 lt!109884))) lt!110184)))

(declare-fun b!68872 () Bool)

(declare-fun res!56936 () Bool)

(assert (=> b!68872 (=> (not res!56936) (not e!45024))))

(assert (=> b!68872 (= res!56936 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!110184))))

(declare-fun b!68873 () Bool)

(declare-fun lt!110181 () (_ BitVec 64))

(assert (=> b!68873 (= e!45024 (bvsle lt!110184 (bvmul lt!110181 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68873 (or (= lt!110181 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!110181 #b0000000000000000000000000000000000000000000000000000000000001000) lt!110181)))))

(assert (=> b!68873 (= lt!110181 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109884)))))))

(assert (= (and d!21894 res!56937) b!68872))

(assert (= (and b!68872 res!56936) b!68873))

(declare-fun m!110023 () Bool)

(assert (=> d!21894 m!110023))

(assert (=> d!21894 m!109667))

(assert (=> b!68648 d!21894))

(declare-fun d!21918 () Bool)

(assert (=> d!21918 (= (invariant!0 (currentBit!3412 (_2!3117 lt!109888)) (currentByte!3417 (_2!3117 lt!109888)) (size!1340 (buf!1721 (_2!3117 lt!109888)))) (and (bvsge (currentBit!3412 (_2!3117 lt!109888)) #b00000000000000000000000000000000) (bvslt (currentBit!3412 (_2!3117 lt!109888)) #b00000000000000000000000000001000) (bvsge (currentByte!3417 (_2!3117 lt!109888)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3417 (_2!3117 lt!109888)) (size!1340 (buf!1721 (_2!3117 lt!109888)))) (and (= (currentBit!3412 (_2!3117 lt!109888)) #b00000000000000000000000000000000) (= (currentByte!3417 (_2!3117 lt!109888)) (size!1340 (buf!1721 (_2!3117 lt!109888))))))))))

(assert (=> b!68658 d!21918))

(declare-fun b!68894 () Bool)

(declare-datatypes ((tuple2!6032 0))(
  ( (tuple2!6033 (_1!3127 List!720) (_2!3127 BitStream!2290)) )
))
(declare-fun e!45035 () tuple2!6032)

(declare-datatypes ((tuple2!6034 0))(
  ( (tuple2!6035 (_1!3128 Bool) (_2!3128 BitStream!2290)) )
))
(declare-fun lt!110217 () tuple2!6034)

(declare-fun lt!110218 () (_ BitVec 64))

(assert (=> b!68894 (= e!45035 (tuple2!6033 (Cons!716 (_1!3128 lt!110217) (bitStreamReadBitsIntoList!0 (_2!3117 lt!109884) (_2!3128 lt!110217) (bvsub lt!109880 lt!110218))) (_2!3128 lt!110217)))))

(declare-fun readBit!0 (BitStream!2290) tuple2!6034)

(assert (=> b!68894 (= lt!110217 (readBit!0 (_1!3118 lt!109877)))))

(assert (=> b!68894 (= lt!110218 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!68895 () Bool)

(declare-fun e!45036 () Bool)

(declare-fun lt!110216 () List!720)

(declare-fun isEmpty!220 (List!720) Bool)

(assert (=> b!68895 (= e!45036 (isEmpty!220 lt!110216))))

(declare-fun b!68896 () Bool)

(assert (=> b!68896 (= e!45036 (> (length!348 lt!110216) 0))))

(declare-fun b!68893 () Bool)

(assert (=> b!68893 (= e!45035 (tuple2!6033 Nil!717 (_1!3118 lt!109877)))))

(declare-fun d!21920 () Bool)

(assert (=> d!21920 e!45036))

(declare-fun c!5081 () Bool)

(assert (=> d!21920 (= c!5081 (= lt!109880 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21920 (= lt!110216 (_1!3127 e!45035))))

(declare-fun c!5082 () Bool)

(assert (=> d!21920 (= c!5082 (= lt!109880 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21920 (bvsge lt!109880 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21920 (= (bitStreamReadBitsIntoList!0 (_2!3117 lt!109884) (_1!3118 lt!109877) lt!109880) lt!110216)))

(assert (= (and d!21920 c!5082) b!68893))

(assert (= (and d!21920 (not c!5082)) b!68894))

(assert (= (and d!21920 c!5081) b!68895))

(assert (= (and d!21920 (not c!5081)) b!68896))

(declare-fun m!110029 () Bool)

(assert (=> b!68894 m!110029))

(declare-fun m!110031 () Bool)

(assert (=> b!68894 m!110031))

(declare-fun m!110033 () Bool)

(assert (=> b!68895 m!110033))

(declare-fun m!110035 () Bool)

(assert (=> b!68896 m!110035))

(assert (=> b!68647 d!21920))

(declare-fun d!21928 () Bool)

(assert (=> d!21928 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109884)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888))) lt!109880)))

(declare-fun lt!110230 () Unit!4613)

(declare-fun choose!9 (BitStream!2290 array!2890 (_ BitVec 64) BitStream!2290) Unit!4613)

(assert (=> d!21928 (= lt!110230 (choose!9 (_2!3117 lt!109888) (buf!1721 (_2!3117 lt!109884)) lt!109880 (BitStream!2291 (buf!1721 (_2!3117 lt!109884)) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888)))))))

(assert (=> d!21928 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3117 lt!109888) (buf!1721 (_2!3117 lt!109884)) lt!109880) lt!110230)))

(declare-fun bs!5289 () Bool)

(assert (= bs!5289 d!21928))

(assert (=> bs!5289 m!109687))

(declare-fun m!110039 () Bool)

(assert (=> bs!5289 m!110039))

(assert (=> b!68647 d!21928))

(declare-fun b!68927 () Bool)

(declare-fun res!56977 () Bool)

(declare-fun e!45055 () Bool)

(assert (=> b!68927 (=> (not res!56977) (not e!45055))))

(declare-fun lt!110307 () tuple2!6014)

(assert (=> b!68927 (= res!56977 (isPrefixOf!0 (_2!3118 lt!110307) (_2!3117 lt!109884)))))

(declare-fun lt!110316 () (_ BitVec 64))

(declare-fun b!68928 () Bool)

(declare-fun lt!110315 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2290 (_ BitVec 64)) BitStream!2290)

(assert (=> b!68928 (= e!45055 (= (_1!3118 lt!110307) (withMovedBitIndex!0 (_2!3118 lt!110307) (bvsub lt!110316 lt!110315))))))

(assert (=> b!68928 (or (= (bvand lt!110316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110315 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110316 lt!110315) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68928 (= lt!110315 (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109884))) (currentByte!3417 (_2!3117 lt!109884)) (currentBit!3412 (_2!3117 lt!109884))))))

(assert (=> b!68928 (= lt!110316 (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)))))

(declare-fun d!21934 () Bool)

(assert (=> d!21934 e!45055))

(declare-fun res!56976 () Bool)

(assert (=> d!21934 (=> (not res!56976) (not e!45055))))

(assert (=> d!21934 (= res!56976 (isPrefixOf!0 (_1!3118 lt!110307) (_2!3118 lt!110307)))))

(declare-fun lt!110314 () BitStream!2290)

(assert (=> d!21934 (= lt!110307 (tuple2!6015 lt!110314 (_2!3117 lt!109884)))))

(declare-fun lt!110299 () Unit!4613)

(declare-fun lt!110317 () Unit!4613)

(assert (=> d!21934 (= lt!110299 lt!110317)))

(assert (=> d!21934 (isPrefixOf!0 lt!110314 (_2!3117 lt!109884))))

(assert (=> d!21934 (= lt!110317 (lemmaIsPrefixTransitive!0 lt!110314 (_2!3117 lt!109884) (_2!3117 lt!109884)))))

(declare-fun lt!110308 () Unit!4613)

(declare-fun lt!110300 () Unit!4613)

(assert (=> d!21934 (= lt!110308 lt!110300)))

(assert (=> d!21934 (isPrefixOf!0 lt!110314 (_2!3117 lt!109884))))

(assert (=> d!21934 (= lt!110300 (lemmaIsPrefixTransitive!0 lt!110314 thiss!1379 (_2!3117 lt!109884)))))

(declare-fun lt!110298 () Unit!4613)

(declare-fun e!45054 () Unit!4613)

(assert (=> d!21934 (= lt!110298 e!45054)))

(declare-fun c!5085 () Bool)

(assert (=> d!21934 (= c!5085 (not (= (size!1340 (buf!1721 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!110312 () Unit!4613)

(declare-fun lt!110311 () Unit!4613)

(assert (=> d!21934 (= lt!110312 lt!110311)))

(assert (=> d!21934 (isPrefixOf!0 (_2!3117 lt!109884) (_2!3117 lt!109884))))

(assert (=> d!21934 (= lt!110311 (lemmaIsPrefixRefl!0 (_2!3117 lt!109884)))))

(declare-fun lt!110313 () Unit!4613)

(declare-fun lt!110309 () Unit!4613)

(assert (=> d!21934 (= lt!110313 lt!110309)))

(assert (=> d!21934 (= lt!110309 (lemmaIsPrefixRefl!0 (_2!3117 lt!109884)))))

(declare-fun lt!110304 () Unit!4613)

(declare-fun lt!110302 () Unit!4613)

(assert (=> d!21934 (= lt!110304 lt!110302)))

(assert (=> d!21934 (isPrefixOf!0 lt!110314 lt!110314)))

(assert (=> d!21934 (= lt!110302 (lemmaIsPrefixRefl!0 lt!110314))))

(declare-fun lt!110301 () Unit!4613)

(declare-fun lt!110306 () Unit!4613)

(assert (=> d!21934 (= lt!110301 lt!110306)))

(assert (=> d!21934 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21934 (= lt!110306 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21934 (= lt!110314 (BitStream!2291 (buf!1721 (_2!3117 lt!109884)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)))))

(assert (=> d!21934 (isPrefixOf!0 thiss!1379 (_2!3117 lt!109884))))

(assert (=> d!21934 (= (reader!0 thiss!1379 (_2!3117 lt!109884)) lt!110307)))

(declare-fun b!68929 () Bool)

(declare-fun Unit!4628 () Unit!4613)

(assert (=> b!68929 (= e!45054 Unit!4628)))

(declare-fun b!68930 () Bool)

(declare-fun res!56975 () Bool)

(assert (=> b!68930 (=> (not res!56975) (not e!45055))))

(assert (=> b!68930 (= res!56975 (isPrefixOf!0 (_1!3118 lt!110307) thiss!1379))))

(declare-fun b!68931 () Bool)

(declare-fun lt!110305 () Unit!4613)

(assert (=> b!68931 (= e!45054 lt!110305)))

(declare-fun lt!110310 () (_ BitVec 64))

(assert (=> b!68931 (= lt!110310 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110303 () (_ BitVec 64))

(assert (=> b!68931 (= lt!110303 (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2890 array!2890 (_ BitVec 64) (_ BitVec 64)) Unit!4613)

(assert (=> b!68931 (= lt!110305 (arrayBitRangesEqSymmetric!0 (buf!1721 thiss!1379) (buf!1721 (_2!3117 lt!109884)) lt!110310 lt!110303))))

(declare-fun arrayBitRangesEq!0 (array!2890 array!2890 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68931 (arrayBitRangesEq!0 (buf!1721 (_2!3117 lt!109884)) (buf!1721 thiss!1379) lt!110310 lt!110303)))

(assert (= (and d!21934 c!5085) b!68931))

(assert (= (and d!21934 (not c!5085)) b!68929))

(assert (= (and d!21934 res!56976) b!68930))

(assert (= (and b!68930 res!56975) b!68927))

(assert (= (and b!68927 res!56977) b!68928))

(declare-fun m!110059 () Bool)

(assert (=> b!68930 m!110059))

(declare-fun m!110061 () Bool)

(assert (=> b!68928 m!110061))

(assert (=> b!68928 m!109619))

(assert (=> b!68928 m!109627))

(declare-fun m!110063 () Bool)

(assert (=> d!21934 m!110063))

(declare-fun m!110065 () Bool)

(assert (=> d!21934 m!110065))

(declare-fun m!110067 () Bool)

(assert (=> d!21934 m!110067))

(assert (=> d!21934 m!109625))

(assert (=> d!21934 m!109641))

(declare-fun m!110069 () Bool)

(assert (=> d!21934 m!110069))

(declare-fun m!110071 () Bool)

(assert (=> d!21934 m!110071))

(assert (=> d!21934 m!109623))

(declare-fun m!110073 () Bool)

(assert (=> d!21934 m!110073))

(declare-fun m!110075 () Bool)

(assert (=> d!21934 m!110075))

(declare-fun m!110077 () Bool)

(assert (=> d!21934 m!110077))

(assert (=> b!68931 m!109627))

(declare-fun m!110079 () Bool)

(assert (=> b!68931 m!110079))

(declare-fun m!110081 () Bool)

(assert (=> b!68931 m!110081))

(declare-fun m!110083 () Bool)

(assert (=> b!68927 m!110083))

(assert (=> b!68647 d!21934))

(declare-fun d!21958 () Bool)

(assert (=> d!21958 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109884)))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!110318 () Unit!4613)

(assert (=> d!21958 (= lt!110318 (choose!9 thiss!1379 (buf!1721 (_2!3117 lt!109884)) (bvsub to!314 i!635) (BitStream!2291 (buf!1721 (_2!3117 lt!109884)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379))))))

(assert (=> d!21958 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1721 (_2!3117 lt!109884)) (bvsub to!314 i!635)) lt!110318)))

(declare-fun bs!5294 () Bool)

(assert (= bs!5294 d!21958))

(assert (=> bs!5294 m!109673))

(declare-fun m!110085 () Bool)

(assert (=> bs!5294 m!110085))

(assert (=> b!68647 d!21958))

(declare-fun d!21960 () Bool)

(assert (=> d!21960 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109884)))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109884)))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5295 () Bool)

(assert (= bs!5295 d!21960))

(declare-fun m!110087 () Bool)

(assert (=> bs!5295 m!110087))

(assert (=> b!68647 d!21960))

(declare-fun d!21962 () Bool)

(assert (=> d!21962 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109884)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888))) lt!109880) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109884)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888)))) lt!109880))))

(declare-fun bs!5296 () Bool)

(assert (= bs!5296 d!21962))

(declare-fun m!110089 () Bool)

(assert (=> bs!5296 m!110089))

(assert (=> b!68647 d!21962))

(declare-fun lt!110321 () (_ BitVec 64))

(declare-fun e!45056 () tuple2!6032)

(declare-fun lt!110320 () tuple2!6034)

(declare-fun b!68933 () Bool)

(assert (=> b!68933 (= e!45056 (tuple2!6033 (Cons!716 (_1!3128 lt!110320) (bitStreamReadBitsIntoList!0 (_2!3117 lt!109884) (_2!3128 lt!110320) (bvsub (bvsub to!314 i!635) lt!110321))) (_2!3128 lt!110320)))))

(assert (=> b!68933 (= lt!110320 (readBit!0 (_1!3118 lt!109881)))))

(assert (=> b!68933 (= lt!110321 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!68934 () Bool)

(declare-fun e!45057 () Bool)

(declare-fun lt!110319 () List!720)

(assert (=> b!68934 (= e!45057 (isEmpty!220 lt!110319))))

(declare-fun b!68935 () Bool)

(assert (=> b!68935 (= e!45057 (> (length!348 lt!110319) 0))))

(declare-fun b!68932 () Bool)

(assert (=> b!68932 (= e!45056 (tuple2!6033 Nil!717 (_1!3118 lt!109881)))))

(declare-fun d!21964 () Bool)

(assert (=> d!21964 e!45057))

(declare-fun c!5086 () Bool)

(assert (=> d!21964 (= c!5086 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21964 (= lt!110319 (_1!3127 e!45056))))

(declare-fun c!5087 () Bool)

(assert (=> d!21964 (= c!5087 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21964 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21964 (= (bitStreamReadBitsIntoList!0 (_2!3117 lt!109884) (_1!3118 lt!109881) (bvsub to!314 i!635)) lt!110319)))

(assert (= (and d!21964 c!5087) b!68932))

(assert (= (and d!21964 (not c!5087)) b!68933))

(assert (= (and d!21964 c!5086) b!68934))

(assert (= (and d!21964 (not c!5086)) b!68935))

(declare-fun m!110091 () Bool)

(assert (=> b!68933 m!110091))

(declare-fun m!110093 () Bool)

(assert (=> b!68933 m!110093))

(declare-fun m!110095 () Bool)

(assert (=> b!68934 m!110095))

(declare-fun m!110097 () Bool)

(assert (=> b!68935 m!110097))

(assert (=> b!68647 d!21964))

(declare-fun b!68938 () Bool)

(declare-fun res!56980 () Bool)

(declare-fun e!45059 () Bool)

(assert (=> b!68938 (=> (not res!56980) (not e!45059))))

(declare-fun lt!110331 () tuple2!6014)

(assert (=> b!68938 (= res!56980 (isPrefixOf!0 (_2!3118 lt!110331) (_2!3117 lt!109884)))))

(declare-fun lt!110339 () (_ BitVec 64))

(declare-fun b!68939 () Bool)

(declare-fun lt!110340 () (_ BitVec 64))

(assert (=> b!68939 (= e!45059 (= (_1!3118 lt!110331) (withMovedBitIndex!0 (_2!3118 lt!110331) (bvsub lt!110340 lt!110339))))))

(assert (=> b!68939 (or (= (bvand lt!110340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110339 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110340 lt!110339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68939 (= lt!110339 (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109884))) (currentByte!3417 (_2!3117 lt!109884)) (currentBit!3412 (_2!3117 lt!109884))))))

(assert (=> b!68939 (= lt!110340 (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109888))) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888))))))

(declare-fun d!21966 () Bool)

(assert (=> d!21966 e!45059))

(declare-fun res!56979 () Bool)

(assert (=> d!21966 (=> (not res!56979) (not e!45059))))

(assert (=> d!21966 (= res!56979 (isPrefixOf!0 (_1!3118 lt!110331) (_2!3118 lt!110331)))))

(declare-fun lt!110338 () BitStream!2290)

(assert (=> d!21966 (= lt!110331 (tuple2!6015 lt!110338 (_2!3117 lt!109884)))))

(declare-fun lt!110323 () Unit!4613)

(declare-fun lt!110341 () Unit!4613)

(assert (=> d!21966 (= lt!110323 lt!110341)))

(assert (=> d!21966 (isPrefixOf!0 lt!110338 (_2!3117 lt!109884))))

(assert (=> d!21966 (= lt!110341 (lemmaIsPrefixTransitive!0 lt!110338 (_2!3117 lt!109884) (_2!3117 lt!109884)))))

(declare-fun lt!110332 () Unit!4613)

(declare-fun lt!110324 () Unit!4613)

(assert (=> d!21966 (= lt!110332 lt!110324)))

(assert (=> d!21966 (isPrefixOf!0 lt!110338 (_2!3117 lt!109884))))

(assert (=> d!21966 (= lt!110324 (lemmaIsPrefixTransitive!0 lt!110338 (_2!3117 lt!109888) (_2!3117 lt!109884)))))

(declare-fun lt!110322 () Unit!4613)

(declare-fun e!45058 () Unit!4613)

(assert (=> d!21966 (= lt!110322 e!45058)))

(declare-fun c!5088 () Bool)

(assert (=> d!21966 (= c!5088 (not (= (size!1340 (buf!1721 (_2!3117 lt!109888))) #b00000000000000000000000000000000)))))

(declare-fun lt!110336 () Unit!4613)

(declare-fun lt!110335 () Unit!4613)

(assert (=> d!21966 (= lt!110336 lt!110335)))

(assert (=> d!21966 (isPrefixOf!0 (_2!3117 lt!109884) (_2!3117 lt!109884))))

(assert (=> d!21966 (= lt!110335 (lemmaIsPrefixRefl!0 (_2!3117 lt!109884)))))

(declare-fun lt!110337 () Unit!4613)

(declare-fun lt!110333 () Unit!4613)

(assert (=> d!21966 (= lt!110337 lt!110333)))

(assert (=> d!21966 (= lt!110333 (lemmaIsPrefixRefl!0 (_2!3117 lt!109884)))))

(declare-fun lt!110328 () Unit!4613)

(declare-fun lt!110326 () Unit!4613)

(assert (=> d!21966 (= lt!110328 lt!110326)))

(assert (=> d!21966 (isPrefixOf!0 lt!110338 lt!110338)))

(assert (=> d!21966 (= lt!110326 (lemmaIsPrefixRefl!0 lt!110338))))

(declare-fun lt!110325 () Unit!4613)

(declare-fun lt!110330 () Unit!4613)

(assert (=> d!21966 (= lt!110325 lt!110330)))

(assert (=> d!21966 (isPrefixOf!0 (_2!3117 lt!109888) (_2!3117 lt!109888))))

(assert (=> d!21966 (= lt!110330 (lemmaIsPrefixRefl!0 (_2!3117 lt!109888)))))

(assert (=> d!21966 (= lt!110338 (BitStream!2291 (buf!1721 (_2!3117 lt!109884)) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888))))))

(assert (=> d!21966 (isPrefixOf!0 (_2!3117 lt!109888) (_2!3117 lt!109884))))

(assert (=> d!21966 (= (reader!0 (_2!3117 lt!109888) (_2!3117 lt!109884)) lt!110331)))

(declare-fun b!68940 () Bool)

(declare-fun Unit!4630 () Unit!4613)

(assert (=> b!68940 (= e!45058 Unit!4630)))

(declare-fun b!68941 () Bool)

(declare-fun res!56978 () Bool)

(assert (=> b!68941 (=> (not res!56978) (not e!45059))))

(assert (=> b!68941 (= res!56978 (isPrefixOf!0 (_1!3118 lt!110331) (_2!3117 lt!109888)))))

(declare-fun b!68942 () Bool)

(declare-fun lt!110329 () Unit!4613)

(assert (=> b!68942 (= e!45058 lt!110329)))

(declare-fun lt!110334 () (_ BitVec 64))

(assert (=> b!68942 (= lt!110334 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110327 () (_ BitVec 64))

(assert (=> b!68942 (= lt!110327 (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109888))) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888))))))

(assert (=> b!68942 (= lt!110329 (arrayBitRangesEqSymmetric!0 (buf!1721 (_2!3117 lt!109888)) (buf!1721 (_2!3117 lt!109884)) lt!110334 lt!110327))))

(assert (=> b!68942 (arrayBitRangesEq!0 (buf!1721 (_2!3117 lt!109884)) (buf!1721 (_2!3117 lt!109888)) lt!110334 lt!110327)))

(assert (= (and d!21966 c!5088) b!68942))

(assert (= (and d!21966 (not c!5088)) b!68940))

(assert (= (and d!21966 res!56979) b!68941))

(assert (= (and b!68941 res!56978) b!68938))

(assert (= (and b!68938 res!56980) b!68939))

(declare-fun m!110099 () Bool)

(assert (=> b!68941 m!110099))

(declare-fun m!110101 () Bool)

(assert (=> b!68939 m!110101))

(assert (=> b!68939 m!109619))

(assert (=> b!68939 m!109661))

(assert (=> d!21966 m!110063))

(declare-fun m!110103 () Bool)

(assert (=> d!21966 m!110103))

(declare-fun m!110105 () Bool)

(assert (=> d!21966 m!110105))

(declare-fun m!110107 () Bool)

(assert (=> d!21966 m!110107))

(assert (=> d!21966 m!109629))

(assert (=> d!21966 m!110069))

(declare-fun m!110109 () Bool)

(assert (=> d!21966 m!110109))

(declare-fun m!110111 () Bool)

(assert (=> d!21966 m!110111))

(declare-fun m!110113 () Bool)

(assert (=> d!21966 m!110113))

(declare-fun m!110115 () Bool)

(assert (=> d!21966 m!110115))

(declare-fun m!110117 () Bool)

(assert (=> d!21966 m!110117))

(assert (=> b!68942 m!109661))

(declare-fun m!110119 () Bool)

(assert (=> b!68942 m!110119))

(declare-fun m!110121 () Bool)

(assert (=> b!68942 m!110121))

(declare-fun m!110123 () Bool)

(assert (=> b!68938 m!110123))

(assert (=> b!68647 d!21966))

(declare-fun b!69015 () Bool)

(declare-fun e!45091 () tuple2!6012)

(declare-fun Unit!4631 () Unit!4613)

(assert (=> b!69015 (= e!45091 (tuple2!6013 Unit!4631 (_2!3117 lt!109888)))))

(assert (=> b!69015 (= (size!1340 (buf!1721 (_2!3117 lt!109888))) (size!1340 (buf!1721 (_2!3117 lt!109888))))))

(declare-fun lt!110662 () Unit!4613)

(declare-fun Unit!4632 () Unit!4613)

(assert (=> b!69015 (= lt!110662 Unit!4632)))

(declare-fun call!888 () tuple2!6014)

(declare-fun checkByteArrayBitContent!0 (BitStream!2290 array!2890 array!2890 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!6038 0))(
  ( (tuple2!6039 (_1!3130 array!2890) (_2!3130 BitStream!2290)) )
))
(declare-fun readBits!0 (BitStream!2290 (_ BitVec 64)) tuple2!6038)

(assert (=> b!69015 (checkByteArrayBitContent!0 (_2!3117 lt!109888) srcBuffer!2 (_1!3130 (readBits!0 (_1!3118 call!888) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!69016 () Bool)

(declare-fun res!57026 () Bool)

(declare-fun e!45092 () Bool)

(assert (=> b!69016 (=> (not res!57026) (not e!45092))))

(declare-fun lt!110704 () tuple2!6012)

(assert (=> b!69016 (= res!57026 (= (size!1340 (buf!1721 (_2!3117 lt!110704))) (size!1340 (buf!1721 (_2!3117 lt!109888)))))))

(declare-fun lt!110669 () tuple2!6012)

(declare-fun c!5105 () Bool)

(declare-fun bm!885 () Bool)

(assert (=> bm!885 (= call!888 (reader!0 (_2!3117 lt!109888) (ite c!5105 (_2!3117 lt!110669) (_2!3117 lt!109888))))))

(declare-fun b!69017 () Bool)

(declare-fun lt!110693 () tuple2!6012)

(declare-fun Unit!4633 () Unit!4613)

(assert (=> b!69017 (= e!45091 (tuple2!6013 Unit!4633 (_2!3117 lt!110693)))))

(assert (=> b!69017 (= lt!110669 (appendBitFromByte!0 (_2!3117 lt!109888) (select (arr!1916 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!110695 () (_ BitVec 64))

(assert (=> b!69017 (= lt!110695 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110671 () (_ BitVec 64))

(assert (=> b!69017 (= lt!110671 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110690 () Unit!4613)

(assert (=> b!69017 (= lt!110690 (validateOffsetBitsIneqLemma!0 (_2!3117 lt!109888) (_2!3117 lt!110669) lt!110695 lt!110671))))

(assert (=> b!69017 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!110669)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!110669))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!110669))) (bvsub lt!110695 lt!110671))))

(declare-fun lt!110674 () Unit!4613)

(assert (=> b!69017 (= lt!110674 lt!110690)))

(declare-fun lt!110668 () tuple2!6014)

(assert (=> b!69017 (= lt!110668 call!888)))

(declare-fun lt!110694 () (_ BitVec 64))

(assert (=> b!69017 (= lt!110694 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110665 () Unit!4613)

(assert (=> b!69017 (= lt!110665 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3117 lt!109888) (buf!1721 (_2!3117 lt!110669)) lt!110694))))

(assert (=> b!69017 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!110669)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888))) lt!110694)))

(declare-fun lt!110686 () Unit!4613)

(assert (=> b!69017 (= lt!110686 lt!110665)))

(assert (=> b!69017 (= (head!539 (byteArrayBitContentToList!0 (_2!3117 lt!110669) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!539 (bitStreamReadBitsIntoList!0 (_2!3117 lt!110669) (_1!3118 lt!110668) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!110688 () Unit!4613)

(declare-fun Unit!4634 () Unit!4613)

(assert (=> b!69017 (= lt!110688 Unit!4634)))

(assert (=> b!69017 (= lt!110693 (appendBitsMSBFirstLoop!0 (_2!3117 lt!110669) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!110664 () Unit!4613)

(assert (=> b!69017 (= lt!110664 (lemmaIsPrefixTransitive!0 (_2!3117 lt!109888) (_2!3117 lt!110669) (_2!3117 lt!110693)))))

(assert (=> b!69017 (isPrefixOf!0 (_2!3117 lt!109888) (_2!3117 lt!110693))))

(declare-fun lt!110678 () Unit!4613)

(assert (=> b!69017 (= lt!110678 lt!110664)))

(assert (=> b!69017 (= (size!1340 (buf!1721 (_2!3117 lt!110693))) (size!1340 (buf!1721 (_2!3117 lt!109888))))))

(declare-fun lt!110666 () Unit!4613)

(declare-fun Unit!4635 () Unit!4613)

(assert (=> b!69017 (= lt!110666 Unit!4635)))

(assert (=> b!69017 (= (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!110693))) (currentByte!3417 (_2!3117 lt!110693)) (currentBit!3412 (_2!3117 lt!110693))) (bvsub (bvadd (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109888))) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110663 () Unit!4613)

(declare-fun Unit!4636 () Unit!4613)

(assert (=> b!69017 (= lt!110663 Unit!4636)))

(assert (=> b!69017 (= (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!110693))) (currentByte!3417 (_2!3117 lt!110693)) (currentBit!3412 (_2!3117 lt!110693))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!110669))) (currentByte!3417 (_2!3117 lt!110669)) (currentBit!3412 (_2!3117 lt!110669))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!110679 () Unit!4613)

(declare-fun Unit!4637 () Unit!4613)

(assert (=> b!69017 (= lt!110679 Unit!4637)))

(declare-fun lt!110692 () tuple2!6014)

(assert (=> b!69017 (= lt!110692 (reader!0 (_2!3117 lt!109888) (_2!3117 lt!110693)))))

(declare-fun lt!110682 () (_ BitVec 64))

(assert (=> b!69017 (= lt!110682 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110677 () Unit!4613)

(assert (=> b!69017 (= lt!110677 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3117 lt!109888) (buf!1721 (_2!3117 lt!110693)) lt!110682))))

(assert (=> b!69017 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!110693)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888))) lt!110682)))

(declare-fun lt!110698 () Unit!4613)

(assert (=> b!69017 (= lt!110698 lt!110677)))

(declare-fun lt!110697 () tuple2!6014)

(assert (=> b!69017 (= lt!110697 (reader!0 (_2!3117 lt!110669) (_2!3117 lt!110693)))))

(declare-fun lt!110680 () (_ BitVec 64))

(assert (=> b!69017 (= lt!110680 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!110684 () Unit!4613)

(assert (=> b!69017 (= lt!110684 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3117 lt!110669) (buf!1721 (_2!3117 lt!110693)) lt!110680))))

(assert (=> b!69017 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!110693)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!110669))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!110669))) lt!110680)))

(declare-fun lt!110672 () Unit!4613)

(assert (=> b!69017 (= lt!110672 lt!110684)))

(declare-fun lt!110691 () List!720)

(assert (=> b!69017 (= lt!110691 (byteArrayBitContentToList!0 (_2!3117 lt!110693) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!110667 () List!720)

(assert (=> b!69017 (= lt!110667 (byteArrayBitContentToList!0 (_2!3117 lt!110693) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!110685 () List!720)

(assert (=> b!69017 (= lt!110685 (bitStreamReadBitsIntoList!0 (_2!3117 lt!110693) (_1!3118 lt!110692) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!110701 () List!720)

(assert (=> b!69017 (= lt!110701 (bitStreamReadBitsIntoList!0 (_2!3117 lt!110693) (_1!3118 lt!110697) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!110687 () (_ BitVec 64))

(assert (=> b!69017 (= lt!110687 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110676 () Unit!4613)

(assert (=> b!69017 (= lt!110676 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3117 lt!110693) (_2!3117 lt!110693) (_1!3118 lt!110692) (_1!3118 lt!110697) lt!110687 lt!110685))))

(assert (=> b!69017 (= (bitStreamReadBitsIntoList!0 (_2!3117 lt!110693) (_1!3118 lt!110697) (bvsub lt!110687 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!324 lt!110685))))

(declare-fun lt!110700 () Unit!4613)

(assert (=> b!69017 (= lt!110700 lt!110676)))

(declare-fun lt!110699 () Unit!4613)

(declare-fun lt!110703 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2890 array!2890 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4613)

(assert (=> b!69017 (= lt!110699 (arrayBitRangesEqImpliesEq!0 (buf!1721 (_2!3117 lt!110669)) (buf!1721 (_2!3117 lt!110693)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!110703 (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!110669))) (currentByte!3417 (_2!3117 lt!110669)) (currentBit!3412 (_2!3117 lt!110669)))))))

(assert (=> b!69017 (= (bitAt!0 (buf!1721 (_2!3117 lt!110669)) lt!110703) (bitAt!0 (buf!1721 (_2!3117 lt!110693)) lt!110703))))

(declare-fun lt!110681 () Unit!4613)

(assert (=> b!69017 (= lt!110681 lt!110699)))

(declare-fun b!69018 () Bool)

(declare-fun res!57027 () Bool)

(assert (=> b!69018 (=> (not res!57027) (not e!45092))))

(assert (=> b!69018 (= res!57027 (isPrefixOf!0 (_2!3117 lt!109888) (_2!3117 lt!110704)))))

(declare-fun b!69019 () Bool)

(declare-fun e!45090 () Bool)

(declare-fun lt!110683 () (_ BitVec 64))

(assert (=> b!69019 (= e!45090 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888))) lt!110683))))

(declare-fun b!69020 () Bool)

(declare-fun res!57024 () Bool)

(assert (=> b!69020 (=> (not res!57024) (not e!45092))))

(assert (=> b!69020 (= res!57024 (= (size!1340 (buf!1721 (_2!3117 lt!109888))) (size!1340 (buf!1721 (_2!3117 lt!110704)))))))

(declare-fun d!21968 () Bool)

(assert (=> d!21968 e!45092))

(declare-fun res!57025 () Bool)

(assert (=> d!21968 (=> (not res!57025) (not e!45092))))

(declare-fun lt!110705 () (_ BitVec 64))

(assert (=> d!21968 (= res!57025 (= (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!110704))) (currentByte!3417 (_2!3117 lt!110704)) (currentBit!3412 (_2!3117 lt!110704))) (bvsub lt!110705 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21968 (or (= (bvand lt!110705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110705 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!110675 () (_ BitVec 64))

(assert (=> d!21968 (= lt!110705 (bvadd lt!110675 to!314))))

(assert (=> d!21968 (or (not (= (bvand lt!110675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!110675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!110675 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21968 (= lt!110675 (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109888))) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888))))))

(assert (=> d!21968 (= lt!110704 e!45091)))

(assert (=> d!21968 (= c!5105 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!110702 () Unit!4613)

(declare-fun lt!110670 () Unit!4613)

(assert (=> d!21968 (= lt!110702 lt!110670)))

(assert (=> d!21968 (isPrefixOf!0 (_2!3117 lt!109888) (_2!3117 lt!109888))))

(assert (=> d!21968 (= lt!110670 (lemmaIsPrefixRefl!0 (_2!3117 lt!109888)))))

(assert (=> d!21968 (= lt!110703 (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109888))) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888))))))

(assert (=> d!21968 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21968 (= (appendBitsMSBFirstLoop!0 (_2!3117 lt!109888) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!110704)))

(declare-fun lt!110673 () tuple2!6014)

(declare-fun b!69021 () Bool)

(assert (=> b!69021 (= e!45092 (= (bitStreamReadBitsIntoList!0 (_2!3117 lt!110704) (_1!3118 lt!110673) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3117 lt!110704) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!69021 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69021 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!110696 () Unit!4613)

(declare-fun lt!110689 () Unit!4613)

(assert (=> b!69021 (= lt!110696 lt!110689)))

(assert (=> b!69021 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!110704)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888))) lt!110683)))

(assert (=> b!69021 (= lt!110689 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3117 lt!109888) (buf!1721 (_2!3117 lt!110704)) lt!110683))))

(assert (=> b!69021 e!45090))

(declare-fun res!57023 () Bool)

(assert (=> b!69021 (=> (not res!57023) (not e!45090))))

(assert (=> b!69021 (= res!57023 (and (= (size!1340 (buf!1721 (_2!3117 lt!109888))) (size!1340 (buf!1721 (_2!3117 lt!110704)))) (bvsge lt!110683 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69021 (= lt!110683 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!69021 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69021 (= lt!110673 (reader!0 (_2!3117 lt!109888) (_2!3117 lt!110704)))))

(declare-fun b!69022 () Bool)

(declare-fun res!57028 () Bool)

(assert (=> b!69022 (=> (not res!57028) (not e!45092))))

(assert (=> b!69022 (= res!57028 (invariant!0 (currentBit!3412 (_2!3117 lt!110704)) (currentByte!3417 (_2!3117 lt!110704)) (size!1340 (buf!1721 (_2!3117 lt!110704)))))))

(assert (= (and d!21968 c!5105) b!69017))

(assert (= (and d!21968 (not c!5105)) b!69015))

(assert (= (or b!69017 b!69015) bm!885))

(assert (= (and d!21968 res!57025) b!69022))

(assert (= (and b!69022 res!57028) b!69020))

(assert (= (and b!69020 res!57024) b!69018))

(assert (= (and b!69018 res!57027) b!69016))

(assert (= (and b!69016 res!57026) b!69021))

(assert (= (and b!69021 res!57023) b!69019))

(declare-fun m!110177 () Bool)

(assert (=> b!69021 m!110177))

(declare-fun m!110181 () Bool)

(assert (=> b!69021 m!110181))

(declare-fun m!110185 () Bool)

(assert (=> b!69021 m!110185))

(declare-fun m!110189 () Bool)

(assert (=> b!69021 m!110189))

(declare-fun m!110193 () Bool)

(assert (=> b!69021 m!110193))

(declare-fun m!110199 () Bool)

(assert (=> b!69022 m!110199))

(declare-fun m!110203 () Bool)

(assert (=> b!69017 m!110203))

(declare-fun m!110205 () Bool)

(assert (=> b!69017 m!110205))

(declare-fun m!110209 () Bool)

(assert (=> b!69017 m!110209))

(declare-fun m!110213 () Bool)

(assert (=> b!69017 m!110213))

(assert (=> b!69017 m!109661))

(declare-fun m!110217 () Bool)

(assert (=> b!69017 m!110217))

(declare-fun m!110221 () Bool)

(assert (=> b!69017 m!110221))

(declare-fun m!110225 () Bool)

(assert (=> b!69017 m!110225))

(declare-fun m!110229 () Bool)

(assert (=> b!69017 m!110229))

(declare-fun m!110233 () Bool)

(assert (=> b!69017 m!110233))

(declare-fun m!110235 () Bool)

(assert (=> b!69017 m!110235))

(declare-fun m!110237 () Bool)

(assert (=> b!69017 m!110237))

(declare-fun m!110241 () Bool)

(assert (=> b!69017 m!110241))

(declare-fun m!110245 () Bool)

(assert (=> b!69017 m!110245))

(declare-fun m!110247 () Bool)

(assert (=> b!69017 m!110247))

(declare-fun m!110249 () Bool)

(assert (=> b!69017 m!110249))

(declare-fun m!110255 () Bool)

(assert (=> b!69017 m!110255))

(declare-fun m!110259 () Bool)

(assert (=> b!69017 m!110259))

(declare-fun m!110263 () Bool)

(assert (=> b!69017 m!110263))

(declare-fun m!110267 () Bool)

(assert (=> b!69017 m!110267))

(declare-fun m!110273 () Bool)

(assert (=> b!69017 m!110273))

(declare-fun m!110275 () Bool)

(assert (=> b!69017 m!110275))

(declare-fun m!110279 () Bool)

(assert (=> b!69017 m!110279))

(declare-fun m!110283 () Bool)

(assert (=> b!69017 m!110283))

(assert (=> b!69017 m!110209))

(declare-fun m!110285 () Bool)

(assert (=> b!69017 m!110285))

(assert (=> b!69017 m!110203))

(declare-fun m!110287 () Bool)

(assert (=> b!69017 m!110287))

(assert (=> b!69017 m!110255))

(declare-fun m!110289 () Bool)

(assert (=> b!69017 m!110289))

(declare-fun m!110291 () Bool)

(assert (=> b!69017 m!110291))

(declare-fun m!110293 () Bool)

(assert (=> b!69017 m!110293))

(declare-fun m!110295 () Bool)

(assert (=> b!69017 m!110295))

(declare-fun m!110297 () Bool)

(assert (=> b!69017 m!110297))

(assert (=> b!69017 m!110249))

(declare-fun m!110299 () Bool)

(assert (=> b!69017 m!110299))

(declare-fun m!110301 () Bool)

(assert (=> b!69015 m!110301))

(declare-fun m!110303 () Bool)

(assert (=> b!69015 m!110303))

(declare-fun m!110305 () Bool)

(assert (=> bm!885 m!110305))

(declare-fun m!110307 () Bool)

(assert (=> d!21968 m!110307))

(assert (=> d!21968 m!109661))

(assert (=> d!21968 m!110111))

(assert (=> d!21968 m!110107))

(declare-fun m!110309 () Bool)

(assert (=> b!69018 m!110309))

(declare-fun m!110311 () Bool)

(assert (=> b!69019 m!110311))

(assert (=> b!68657 d!21968))

(declare-fun d!21982 () Bool)

(assert (=> d!21982 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5299 () Bool)

(assert (= bs!5299 d!21982))

(declare-fun m!110313 () Bool)

(assert (=> bs!5299 m!110313))

(assert (=> b!68657 d!21982))

(declare-fun d!21984 () Bool)

(assert (=> d!21984 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110706 () Unit!4613)

(assert (=> d!21984 (= lt!110706 (choose!9 thiss!1379 (buf!1721 (_2!3117 lt!109888)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2291 (buf!1721 (_2!3117 lt!109888)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379))))))

(assert (=> d!21984 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1721 (_2!3117 lt!109888)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!110706)))

(declare-fun bs!5300 () Bool)

(assert (= bs!5300 d!21984))

(assert (=> bs!5300 m!109631))

(declare-fun m!110315 () Bool)

(assert (=> bs!5300 m!110315))

(assert (=> b!68657 d!21984))

(declare-fun b!69023 () Bool)

(declare-fun res!57031 () Bool)

(declare-fun e!45094 () Bool)

(assert (=> b!69023 (=> (not res!57031) (not e!45094))))

(declare-fun lt!110716 () tuple2!6014)

(assert (=> b!69023 (= res!57031 (isPrefixOf!0 (_2!3118 lt!110716) (_2!3117 lt!109888)))))

(declare-fun lt!110724 () (_ BitVec 64))

(declare-fun lt!110725 () (_ BitVec 64))

(declare-fun b!69024 () Bool)

(assert (=> b!69024 (= e!45094 (= (_1!3118 lt!110716) (withMovedBitIndex!0 (_2!3118 lt!110716) (bvsub lt!110725 lt!110724))))))

(assert (=> b!69024 (or (= (bvand lt!110725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110724 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110725 lt!110724) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69024 (= lt!110724 (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109888))) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888))))))

(assert (=> b!69024 (= lt!110725 (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)))))

(declare-fun d!21986 () Bool)

(assert (=> d!21986 e!45094))

(declare-fun res!57030 () Bool)

(assert (=> d!21986 (=> (not res!57030) (not e!45094))))

(assert (=> d!21986 (= res!57030 (isPrefixOf!0 (_1!3118 lt!110716) (_2!3118 lt!110716)))))

(declare-fun lt!110723 () BitStream!2290)

(assert (=> d!21986 (= lt!110716 (tuple2!6015 lt!110723 (_2!3117 lt!109888)))))

(declare-fun lt!110708 () Unit!4613)

(declare-fun lt!110726 () Unit!4613)

(assert (=> d!21986 (= lt!110708 lt!110726)))

(assert (=> d!21986 (isPrefixOf!0 lt!110723 (_2!3117 lt!109888))))

(assert (=> d!21986 (= lt!110726 (lemmaIsPrefixTransitive!0 lt!110723 (_2!3117 lt!109888) (_2!3117 lt!109888)))))

(declare-fun lt!110717 () Unit!4613)

(declare-fun lt!110709 () Unit!4613)

(assert (=> d!21986 (= lt!110717 lt!110709)))

(assert (=> d!21986 (isPrefixOf!0 lt!110723 (_2!3117 lt!109888))))

(assert (=> d!21986 (= lt!110709 (lemmaIsPrefixTransitive!0 lt!110723 thiss!1379 (_2!3117 lt!109888)))))

(declare-fun lt!110707 () Unit!4613)

(declare-fun e!45093 () Unit!4613)

(assert (=> d!21986 (= lt!110707 e!45093)))

(declare-fun c!5106 () Bool)

(assert (=> d!21986 (= c!5106 (not (= (size!1340 (buf!1721 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!110721 () Unit!4613)

(declare-fun lt!110720 () Unit!4613)

(assert (=> d!21986 (= lt!110721 lt!110720)))

(assert (=> d!21986 (isPrefixOf!0 (_2!3117 lt!109888) (_2!3117 lt!109888))))

(assert (=> d!21986 (= lt!110720 (lemmaIsPrefixRefl!0 (_2!3117 lt!109888)))))

(declare-fun lt!110722 () Unit!4613)

(declare-fun lt!110718 () Unit!4613)

(assert (=> d!21986 (= lt!110722 lt!110718)))

(assert (=> d!21986 (= lt!110718 (lemmaIsPrefixRefl!0 (_2!3117 lt!109888)))))

(declare-fun lt!110713 () Unit!4613)

(declare-fun lt!110711 () Unit!4613)

(assert (=> d!21986 (= lt!110713 lt!110711)))

(assert (=> d!21986 (isPrefixOf!0 lt!110723 lt!110723)))

(assert (=> d!21986 (= lt!110711 (lemmaIsPrefixRefl!0 lt!110723))))

(declare-fun lt!110710 () Unit!4613)

(declare-fun lt!110715 () Unit!4613)

(assert (=> d!21986 (= lt!110710 lt!110715)))

(assert (=> d!21986 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21986 (= lt!110715 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21986 (= lt!110723 (BitStream!2291 (buf!1721 (_2!3117 lt!109888)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)))))

(assert (=> d!21986 (isPrefixOf!0 thiss!1379 (_2!3117 lt!109888))))

(assert (=> d!21986 (= (reader!0 thiss!1379 (_2!3117 lt!109888)) lt!110716)))

(declare-fun b!69025 () Bool)

(declare-fun Unit!4645 () Unit!4613)

(assert (=> b!69025 (= e!45093 Unit!4645)))

(declare-fun b!69026 () Bool)

(declare-fun res!57029 () Bool)

(assert (=> b!69026 (=> (not res!57029) (not e!45094))))

(assert (=> b!69026 (= res!57029 (isPrefixOf!0 (_1!3118 lt!110716) thiss!1379))))

(declare-fun b!69027 () Bool)

(declare-fun lt!110714 () Unit!4613)

(assert (=> b!69027 (= e!45093 lt!110714)))

(declare-fun lt!110719 () (_ BitVec 64))

(assert (=> b!69027 (= lt!110719 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110712 () (_ BitVec 64))

(assert (=> b!69027 (= lt!110712 (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)))))

(assert (=> b!69027 (= lt!110714 (arrayBitRangesEqSymmetric!0 (buf!1721 thiss!1379) (buf!1721 (_2!3117 lt!109888)) lt!110719 lt!110712))))

(assert (=> b!69027 (arrayBitRangesEq!0 (buf!1721 (_2!3117 lt!109888)) (buf!1721 thiss!1379) lt!110719 lt!110712)))

(assert (= (and d!21986 c!5106) b!69027))

(assert (= (and d!21986 (not c!5106)) b!69025))

(assert (= (and d!21986 res!57030) b!69026))

(assert (= (and b!69026 res!57029) b!69023))

(assert (= (and b!69023 res!57031) b!69024))

(declare-fun m!110317 () Bool)

(assert (=> b!69026 m!110317))

(declare-fun m!110319 () Bool)

(assert (=> b!69024 m!110319))

(assert (=> b!69024 m!109661))

(assert (=> b!69024 m!109627))

(assert (=> d!21986 m!110107))

(declare-fun m!110321 () Bool)

(assert (=> d!21986 m!110321))

(declare-fun m!110323 () Bool)

(assert (=> d!21986 m!110323))

(assert (=> d!21986 m!109625))

(assert (=> d!21986 m!109651))

(assert (=> d!21986 m!110111))

(declare-fun m!110325 () Bool)

(assert (=> d!21986 m!110325))

(assert (=> d!21986 m!109623))

(declare-fun m!110327 () Bool)

(assert (=> d!21986 m!110327))

(declare-fun m!110329 () Bool)

(assert (=> d!21986 m!110329))

(declare-fun m!110331 () Bool)

(assert (=> d!21986 m!110331))

(assert (=> b!69027 m!109627))

(declare-fun m!110333 () Bool)

(assert (=> b!69027 m!110333))

(declare-fun m!110335 () Bool)

(assert (=> b!69027 m!110335))

(declare-fun m!110337 () Bool)

(assert (=> b!69023 m!110337))

(assert (=> b!68657 d!21986))

(declare-fun d!21988 () Bool)

(assert (=> d!21988 (isPrefixOf!0 thiss!1379 (_2!3117 lt!109884))))

(declare-fun lt!110796 () Unit!4613)

(declare-fun choose!30 (BitStream!2290 BitStream!2290 BitStream!2290) Unit!4613)

(assert (=> d!21988 (= lt!110796 (choose!30 thiss!1379 (_2!3117 lt!109888) (_2!3117 lt!109884)))))

(assert (=> d!21988 (isPrefixOf!0 thiss!1379 (_2!3117 lt!109888))))

(assert (=> d!21988 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3117 lt!109888) (_2!3117 lt!109884)) lt!110796)))

(declare-fun bs!5302 () Bool)

(assert (= bs!5302 d!21988))

(assert (=> bs!5302 m!109641))

(declare-fun m!110365 () Bool)

(assert (=> bs!5302 m!110365))

(assert (=> bs!5302 m!109651))

(assert (=> b!68657 d!21988))

(declare-fun d!21996 () Bool)

(declare-fun res!57055 () Bool)

(declare-fun e!45108 () Bool)

(assert (=> d!21996 (=> (not res!57055) (not e!45108))))

(assert (=> d!21996 (= res!57055 (= (size!1340 (buf!1721 (_2!3117 lt!109888))) (size!1340 (buf!1721 (_2!3117 lt!109884)))))))

(assert (=> d!21996 (= (isPrefixOf!0 (_2!3117 lt!109888) (_2!3117 lt!109884)) e!45108)))

(declare-fun b!69053 () Bool)

(declare-fun res!57053 () Bool)

(assert (=> b!69053 (=> (not res!57053) (not e!45108))))

(assert (=> b!69053 (= res!57053 (bvsle (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109888))) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888))) (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109884))) (currentByte!3417 (_2!3117 lt!109884)) (currentBit!3412 (_2!3117 lt!109884)))))))

(declare-fun b!69054 () Bool)

(declare-fun e!45109 () Bool)

(assert (=> b!69054 (= e!45108 e!45109)))

(declare-fun res!57054 () Bool)

(assert (=> b!69054 (=> res!57054 e!45109)))

(assert (=> b!69054 (= res!57054 (= (size!1340 (buf!1721 (_2!3117 lt!109888))) #b00000000000000000000000000000000))))

(declare-fun b!69055 () Bool)

(assert (=> b!69055 (= e!45109 (arrayBitRangesEq!0 (buf!1721 (_2!3117 lt!109888)) (buf!1721 (_2!3117 lt!109884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109888))) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888)))))))

(assert (= (and d!21996 res!57055) b!69053))

(assert (= (and b!69053 res!57053) b!69054))

(assert (= (and b!69054 (not res!57054)) b!69055))

(assert (=> b!69053 m!109661))

(assert (=> b!69053 m!109619))

(assert (=> b!69055 m!109661))

(assert (=> b!69055 m!109661))

(declare-fun m!110463 () Bool)

(assert (=> b!69055 m!110463))

(assert (=> b!68657 d!21996))

(declare-fun d!22004 () Bool)

(declare-fun res!57058 () Bool)

(declare-fun e!45110 () Bool)

(assert (=> d!22004 (=> (not res!57058) (not e!45110))))

(assert (=> d!22004 (= res!57058 (= (size!1340 (buf!1721 thiss!1379)) (size!1340 (buf!1721 (_2!3117 lt!109884)))))))

(assert (=> d!22004 (= (isPrefixOf!0 thiss!1379 (_2!3117 lt!109884)) e!45110)))

(declare-fun b!69056 () Bool)

(declare-fun res!57056 () Bool)

(assert (=> b!69056 (=> (not res!57056) (not e!45110))))

(assert (=> b!69056 (= res!57056 (bvsle (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)) (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109884))) (currentByte!3417 (_2!3117 lt!109884)) (currentBit!3412 (_2!3117 lt!109884)))))))

(declare-fun b!69057 () Bool)

(declare-fun e!45111 () Bool)

(assert (=> b!69057 (= e!45110 e!45111)))

(declare-fun res!57057 () Bool)

(assert (=> b!69057 (=> res!57057 e!45111)))

(assert (=> b!69057 (= res!57057 (= (size!1340 (buf!1721 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69058 () Bool)

(assert (=> b!69058 (= e!45111 (arrayBitRangesEq!0 (buf!1721 thiss!1379) (buf!1721 (_2!3117 lt!109884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379))))))

(assert (= (and d!22004 res!57058) b!69056))

(assert (= (and b!69056 res!57056) b!69057))

(assert (= (and b!69057 (not res!57057)) b!69058))

(assert (=> b!69056 m!109627))

(assert (=> b!69056 m!109619))

(assert (=> b!69058 m!109627))

(assert (=> b!69058 m!109627))

(declare-fun m!110465 () Bool)

(assert (=> b!69058 m!110465))

(assert (=> b!68657 d!22004))

(declare-fun d!22006 () Bool)

(declare-fun res!57061 () Bool)

(declare-fun e!45112 () Bool)

(assert (=> d!22006 (=> (not res!57061) (not e!45112))))

(assert (=> d!22006 (= res!57061 (= (size!1340 (buf!1721 thiss!1379)) (size!1340 (buf!1721 (_2!3117 lt!109888)))))))

(assert (=> d!22006 (= (isPrefixOf!0 thiss!1379 (_2!3117 lt!109888)) e!45112)))

(declare-fun b!69059 () Bool)

(declare-fun res!57059 () Bool)

(assert (=> b!69059 (=> (not res!57059) (not e!45112))))

(assert (=> b!69059 (= res!57059 (bvsle (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)) (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109888))) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888)))))))

(declare-fun b!69060 () Bool)

(declare-fun e!45113 () Bool)

(assert (=> b!69060 (= e!45112 e!45113)))

(declare-fun res!57060 () Bool)

(assert (=> b!69060 (=> res!57060 e!45113)))

(assert (=> b!69060 (= res!57060 (= (size!1340 (buf!1721 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69061 () Bool)

(assert (=> b!69061 (= e!45113 (arrayBitRangesEq!0 (buf!1721 thiss!1379) (buf!1721 (_2!3117 lt!109888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379))))))

(assert (= (and d!22006 res!57061) b!69059))

(assert (= (and b!69059 res!57059) b!69060))

(assert (= (and b!69060 (not res!57060)) b!69061))

(assert (=> b!69059 m!109627))

(assert (=> b!69059 m!109661))

(assert (=> b!69061 m!109627))

(assert (=> b!69061 m!109627))

(declare-fun m!110467 () Bool)

(assert (=> b!69061 m!110467))

(assert (=> b!68646 d!22006))

(declare-fun d!22008 () Bool)

(assert (=> d!22008 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888))) lt!109880) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888)))) lt!109880))))

(declare-fun bs!5306 () Bool)

(assert (= bs!5306 d!22008))

(declare-fun m!110471 () Bool)

(assert (=> bs!5306 m!110471))

(assert (=> b!68646 d!22008))

(declare-fun d!22012 () Bool)

(declare-fun e!45118 () Bool)

(assert (=> d!22012 e!45118))

(declare-fun res!57067 () Bool)

(assert (=> d!22012 (=> (not res!57067) (not e!45118))))

(assert (=> d!22012 (= res!57067 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!110803 () Unit!4613)

(declare-fun choose!27 (BitStream!2290 BitStream!2290 (_ BitVec 64) (_ BitVec 64)) Unit!4613)

(assert (=> d!22012 (= lt!110803 (choose!27 thiss!1379 (_2!3117 lt!109888) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!22012 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!22012 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3117 lt!109888) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!110803)))

(declare-fun b!69067 () Bool)

(assert (=> b!69067 (= e!45118 (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22012 res!57067) b!69067))

(declare-fun m!110475 () Bool)

(assert (=> d!22012 m!110475))

(declare-fun m!110477 () Bool)

(assert (=> b!69067 m!110477))

(assert (=> b!68646 d!22012))

(declare-fun b!69131 () Bool)

(declare-fun res!57116 () Bool)

(declare-fun e!45153 () Bool)

(assert (=> b!69131 (=> (not res!57116) (not e!45153))))

(declare-fun lt!110952 () tuple2!6012)

(assert (=> b!69131 (= res!57116 (isPrefixOf!0 thiss!1379 (_2!3117 lt!110952)))))

(declare-fun b!69132 () Bool)

(declare-fun e!45150 () Bool)

(declare-datatypes ((tuple2!6044 0))(
  ( (tuple2!6045 (_1!3133 BitStream!2290) (_2!3133 Bool)) )
))
(declare-fun lt!110956 () tuple2!6044)

(assert (=> b!69132 (= e!45150 (= (bitIndex!0 (size!1340 (buf!1721 (_1!3133 lt!110956))) (currentByte!3417 (_1!3133 lt!110956)) (currentBit!3412 (_1!3133 lt!110956))) (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!110952))) (currentByte!3417 (_2!3117 lt!110952)) (currentBit!3412 (_2!3117 lt!110952)))))))

(declare-fun b!69133 () Bool)

(declare-fun e!45151 () Bool)

(declare-fun lt!110953 () tuple2!6044)

(declare-fun lt!110955 () tuple2!6012)

(assert (=> b!69133 (= e!45151 (= (bitIndex!0 (size!1340 (buf!1721 (_1!3133 lt!110953))) (currentByte!3417 (_1!3133 lt!110953)) (currentBit!3412 (_1!3133 lt!110953))) (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!110955))) (currentByte!3417 (_2!3117 lt!110955)) (currentBit!3412 (_2!3117 lt!110955)))))))

(declare-fun b!69134 () Bool)

(declare-fun res!57112 () Bool)

(assert (=> b!69134 (=> (not res!57112) (not e!45153))))

(declare-fun lt!110950 () (_ BitVec 64))

(declare-fun lt!110954 () (_ BitVec 64))

(assert (=> b!69134 (= res!57112 (= (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!110952))) (currentByte!3417 (_2!3117 lt!110952)) (currentBit!3412 (_2!3117 lt!110952))) (bvadd lt!110954 lt!110950)))))

(assert (=> b!69134 (or (not (= (bvand lt!110954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110950 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!110954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!110954 lt!110950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69134 (= lt!110950 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!69134 (= lt!110954 (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)))))

(declare-fun b!69135 () Bool)

(declare-fun res!57114 () Bool)

(declare-fun e!45152 () Bool)

(assert (=> b!69135 (=> (not res!57114) (not e!45152))))

(assert (=> b!69135 (= res!57114 (isPrefixOf!0 thiss!1379 (_2!3117 lt!110955)))))

(declare-fun b!69136 () Bool)

(declare-fun res!57113 () Bool)

(assert (=> b!69136 (=> (not res!57113) (not e!45152))))

(assert (=> b!69136 (= res!57113 (= (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!110955))) (currentByte!3417 (_2!3117 lt!110955)) (currentBit!3412 (_2!3117 lt!110955))) (bvadd (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!69137 () Bool)

(assert (=> b!69137 (= e!45153 e!45150)))

(declare-fun res!57110 () Bool)

(assert (=> b!69137 (=> (not res!57110) (not e!45150))))

(declare-fun lt!110949 () (_ BitVec 8))

(assert (=> b!69137 (= res!57110 (and (= (_2!3133 lt!110956) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1916 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!110949)) #b00000000000000000000000000000000))) (= (_1!3133 lt!110956) (_2!3117 lt!110952))))))

(declare-fun lt!110948 () tuple2!6038)

(declare-fun lt!110947 () BitStream!2290)

(assert (=> b!69137 (= lt!110948 (readBits!0 lt!110947 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2290) tuple2!6044)

(assert (=> b!69137 (= lt!110956 (readBitPure!0 lt!110947))))

(declare-fun readerFrom!0 (BitStream!2290 (_ BitVec 32) (_ BitVec 32)) BitStream!2290)

(assert (=> b!69137 (= lt!110947 (readerFrom!0 (_2!3117 lt!110952) (currentBit!3412 thiss!1379) (currentByte!3417 thiss!1379)))))

(declare-fun b!69138 () Bool)

(assert (=> b!69138 (= e!45152 e!45151)))

(declare-fun res!57115 () Bool)

(assert (=> b!69138 (=> (not res!57115) (not e!45151))))

(declare-fun lt!110951 () Bool)

(assert (=> b!69138 (= res!57115 (and (= (_2!3133 lt!110953) lt!110951) (= (_1!3133 lt!110953) (_2!3117 lt!110955))))))

(assert (=> b!69138 (= lt!110953 (readBitPure!0 (readerFrom!0 (_2!3117 lt!110955) (currentBit!3412 thiss!1379) (currentByte!3417 thiss!1379))))))

(declare-fun d!22016 () Bool)

(assert (=> d!22016 e!45153))

(declare-fun res!57111 () Bool)

(assert (=> d!22016 (=> (not res!57111) (not e!45153))))

(assert (=> d!22016 (= res!57111 (= (size!1340 (buf!1721 (_2!3117 lt!110952))) (size!1340 (buf!1721 thiss!1379))))))

(declare-fun lt!110946 () array!2890)

(assert (=> d!22016 (= lt!110949 (select (arr!1916 lt!110946) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!22016 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1340 lt!110946)))))

(assert (=> d!22016 (= lt!110946 (array!2891 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!110945 () tuple2!6012)

(assert (=> d!22016 (= lt!110952 (tuple2!6013 (_1!3117 lt!110945) (_2!3117 lt!110945)))))

(assert (=> d!22016 (= lt!110945 lt!110955)))

(assert (=> d!22016 e!45152))

(declare-fun res!57117 () Bool)

(assert (=> d!22016 (=> (not res!57117) (not e!45152))))

(assert (=> d!22016 (= res!57117 (= (size!1340 (buf!1721 thiss!1379)) (size!1340 (buf!1721 (_2!3117 lt!110955)))))))

(declare-fun appendBit!0 (BitStream!2290 Bool) tuple2!6012)

(assert (=> d!22016 (= lt!110955 (appendBit!0 thiss!1379 lt!110951))))

(assert (=> d!22016 (= lt!110951 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1916 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!22016 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!22016 (= (appendBitFromByte!0 thiss!1379 (select (arr!1916 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!110952)))

(assert (= (and d!22016 res!57117) b!69136))

(assert (= (and b!69136 res!57113) b!69135))

(assert (= (and b!69135 res!57114) b!69138))

(assert (= (and b!69138 res!57115) b!69133))

(assert (= (and d!22016 res!57111) b!69134))

(assert (= (and b!69134 res!57112) b!69131))

(assert (= (and b!69131 res!57116) b!69137))

(assert (= (and b!69137 res!57110) b!69132))

(declare-fun m!110591 () Bool)

(assert (=> b!69131 m!110591))

(declare-fun m!110593 () Bool)

(assert (=> b!69133 m!110593))

(declare-fun m!110595 () Bool)

(assert (=> b!69133 m!110595))

(declare-fun m!110597 () Bool)

(assert (=> b!69134 m!110597))

(assert (=> b!69134 m!109627))

(declare-fun m!110599 () Bool)

(assert (=> d!22016 m!110599))

(declare-fun m!110601 () Bool)

(assert (=> d!22016 m!110601))

(declare-fun m!110603 () Bool)

(assert (=> d!22016 m!110603))

(assert (=> b!69136 m!110595))

(assert (=> b!69136 m!109627))

(declare-fun m!110605 () Bool)

(assert (=> b!69138 m!110605))

(assert (=> b!69138 m!110605))

(declare-fun m!110607 () Bool)

(assert (=> b!69138 m!110607))

(declare-fun m!110609 () Bool)

(assert (=> b!69135 m!110609))

(declare-fun m!110611 () Bool)

(assert (=> b!69137 m!110611))

(declare-fun m!110613 () Bool)

(assert (=> b!69137 m!110613))

(declare-fun m!110615 () Bool)

(assert (=> b!69137 m!110615))

(declare-fun m!110617 () Bool)

(assert (=> b!69132 m!110617))

(assert (=> b!69132 m!110597))

(assert (=> b!68646 d!22016))

(declare-fun d!22066 () Bool)

(assert (=> d!22066 (= (bitAt!0 (buf!1721 (_1!3118 lt!109877)) lt!109892) (not (= (bvand ((_ sign_extend 24) (select (arr!1916 (buf!1721 (_1!3118 lt!109877))) ((_ extract 31 0) (bvsdiv lt!109892 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!109892 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5317 () Bool)

(assert (= bs!5317 d!22066))

(declare-fun m!110619 () Bool)

(assert (=> bs!5317 m!110619))

(declare-fun m!110621 () Bool)

(assert (=> bs!5317 m!110621))

(assert (=> b!68656 d!22066))

(declare-fun d!22068 () Bool)

(assert (=> d!22068 (= (bitAt!0 (buf!1721 (_1!3118 lt!109881)) lt!109892) (not (= (bvand ((_ sign_extend 24) (select (arr!1916 (buf!1721 (_1!3118 lt!109881))) ((_ extract 31 0) (bvsdiv lt!109892 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!109892 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5318 () Bool)

(assert (= bs!5318 d!22068))

(declare-fun m!110623 () Bool)

(assert (=> bs!5318 m!110623))

(assert (=> bs!5318 m!110621))

(assert (=> b!68656 d!22068))

(declare-fun d!22070 () Bool)

(assert (=> d!22070 (= (head!539 (byteArrayBitContentToList!0 (_2!3117 lt!109888) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!835 (byteArrayBitContentToList!0 (_2!3117 lt!109888) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!68655 d!22070))

(declare-fun d!22072 () Bool)

(declare-fun c!5121 () Bool)

(assert (=> d!22072 (= c!5121 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45156 () List!720)

(assert (=> d!22072 (= (byteArrayBitContentToList!0 (_2!3117 lt!109888) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!45156)))

(declare-fun b!69143 () Bool)

(assert (=> b!69143 (= e!45156 Nil!717)))

(declare-fun b!69144 () Bool)

(assert (=> b!69144 (= e!45156 (Cons!716 (not (= (bvand ((_ sign_extend 24) (select (arr!1916 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3117 lt!109888) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22072 c!5121) b!69143))

(assert (= (and d!22072 (not c!5121)) b!69144))

(assert (=> b!69144 m!109653))

(assert (=> b!69144 m!110603))

(declare-fun m!110625 () Bool)

(assert (=> b!69144 m!110625))

(assert (=> b!68655 d!22072))

(declare-fun d!22074 () Bool)

(assert (=> d!22074 (= (head!539 (bitStreamReadBitsIntoList!0 (_2!3117 lt!109888) (_1!3118 lt!109893) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!835 (bitStreamReadBitsIntoList!0 (_2!3117 lt!109888) (_1!3118 lt!109893) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!68655 d!22074))

(declare-fun lt!110959 () (_ BitVec 64))

(declare-fun e!45157 () tuple2!6032)

(declare-fun lt!110958 () tuple2!6034)

(declare-fun b!69146 () Bool)

(assert (=> b!69146 (= e!45157 (tuple2!6033 (Cons!716 (_1!3128 lt!110958) (bitStreamReadBitsIntoList!0 (_2!3117 lt!109888) (_2!3128 lt!110958) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!110959))) (_2!3128 lt!110958)))))

(assert (=> b!69146 (= lt!110958 (readBit!0 (_1!3118 lt!109893)))))

(assert (=> b!69146 (= lt!110959 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!69147 () Bool)

(declare-fun e!45158 () Bool)

(declare-fun lt!110957 () List!720)

(assert (=> b!69147 (= e!45158 (isEmpty!220 lt!110957))))

(declare-fun b!69148 () Bool)

(assert (=> b!69148 (= e!45158 (> (length!348 lt!110957) 0))))

(declare-fun b!69145 () Bool)

(assert (=> b!69145 (= e!45157 (tuple2!6033 Nil!717 (_1!3118 lt!109893)))))

(declare-fun d!22076 () Bool)

(assert (=> d!22076 e!45158))

(declare-fun c!5122 () Bool)

(assert (=> d!22076 (= c!5122 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22076 (= lt!110957 (_1!3127 e!45157))))

(declare-fun c!5123 () Bool)

(assert (=> d!22076 (= c!5123 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22076 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22076 (= (bitStreamReadBitsIntoList!0 (_2!3117 lt!109888) (_1!3118 lt!109893) #b0000000000000000000000000000000000000000000000000000000000000001) lt!110957)))

(assert (= (and d!22076 c!5123) b!69145))

(assert (= (and d!22076 (not c!5123)) b!69146))

(assert (= (and d!22076 c!5122) b!69147))

(assert (= (and d!22076 (not c!5122)) b!69148))

(declare-fun m!110627 () Bool)

(assert (=> b!69146 m!110627))

(declare-fun m!110629 () Bool)

(assert (=> b!69146 m!110629))

(declare-fun m!110631 () Bool)

(assert (=> b!69147 m!110631))

(declare-fun m!110633 () Bool)

(assert (=> b!69148 m!110633))

(assert (=> b!68655 d!22076))

(declare-fun d!22078 () Bool)

(assert (=> d!22078 (= (tail!324 lt!109879) (t!1470 lt!109879))))

(assert (=> b!68644 d!22078))

(declare-fun d!22080 () Bool)

(declare-fun e!45161 () Bool)

(assert (=> d!22080 e!45161))

(declare-fun res!57120 () Bool)

(assert (=> d!22080 (=> (not res!57120) (not e!45161))))

(declare-fun lt!110965 () (_ BitVec 64))

(assert (=> d!22080 (= res!57120 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110965 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!110965) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!22080 (= lt!110965 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110964 () Unit!4613)

(declare-fun choose!42 (BitStream!2290 BitStream!2290 BitStream!2290 BitStream!2290 (_ BitVec 64) List!720) Unit!4613)

(assert (=> d!22080 (= lt!110964 (choose!42 (_2!3117 lt!109884) (_2!3117 lt!109884) (_1!3118 lt!109881) (_1!3118 lt!109877) (bvsub to!314 i!635) lt!109879))))

(assert (=> d!22080 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22080 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3117 lt!109884) (_2!3117 lt!109884) (_1!3118 lt!109881) (_1!3118 lt!109877) (bvsub to!314 i!635) lt!109879) lt!110964)))

(declare-fun b!69151 () Bool)

(assert (=> b!69151 (= e!45161 (= (bitStreamReadBitsIntoList!0 (_2!3117 lt!109884) (_1!3118 lt!109877) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!324 lt!109879)))))

(assert (= (and d!22080 res!57120) b!69151))

(declare-fun m!110635 () Bool)

(assert (=> d!22080 m!110635))

(declare-fun m!110637 () Bool)

(assert (=> b!69151 m!110637))

(assert (=> b!69151 m!109669))

(assert (=> b!68644 d!22080))

(declare-fun d!22082 () Bool)

(assert (=> d!22082 (= (array_inv!1204 (buf!1721 thiss!1379)) (bvsge (size!1340 (buf!1721 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!68654 d!22082))

(declare-fun d!22084 () Bool)

(assert (=> d!22084 (= (invariant!0 (currentBit!3412 (_2!3117 lt!109888)) (currentByte!3417 (_2!3117 lt!109888)) (size!1340 (buf!1721 (_2!3117 lt!109884)))) (and (bvsge (currentBit!3412 (_2!3117 lt!109888)) #b00000000000000000000000000000000) (bvslt (currentBit!3412 (_2!3117 lt!109888)) #b00000000000000000000000000001000) (bvsge (currentByte!3417 (_2!3117 lt!109888)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3417 (_2!3117 lt!109888)) (size!1340 (buf!1721 (_2!3117 lt!109884)))) (and (= (currentBit!3412 (_2!3117 lt!109888)) #b00000000000000000000000000000000) (= (currentByte!3417 (_2!3117 lt!109888)) (size!1340 (buf!1721 (_2!3117 lt!109884))))))))))

(assert (=> b!68643 d!22084))

(declare-fun d!22086 () Bool)

(declare-fun res!57123 () Bool)

(declare-fun e!45162 () Bool)

(assert (=> d!22086 (=> (not res!57123) (not e!45162))))

(assert (=> d!22086 (= res!57123 (= (size!1340 (buf!1721 thiss!1379)) (size!1340 (buf!1721 thiss!1379))))))

(assert (=> d!22086 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!45162)))

(declare-fun b!69152 () Bool)

(declare-fun res!57121 () Bool)

(assert (=> b!69152 (=> (not res!57121) (not e!45162))))

(assert (=> b!69152 (= res!57121 (bvsle (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)) (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379))))))

(declare-fun b!69153 () Bool)

(declare-fun e!45163 () Bool)

(assert (=> b!69153 (= e!45162 e!45163)))

(declare-fun res!57122 () Bool)

(assert (=> b!69153 (=> res!57122 e!45163)))

(assert (=> b!69153 (= res!57122 (= (size!1340 (buf!1721 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69154 () Bool)

(assert (=> b!69154 (= e!45163 (arrayBitRangesEq!0 (buf!1721 thiss!1379) (buf!1721 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379))))))

(assert (= (and d!22086 res!57123) b!69152))

(assert (= (and b!69152 res!57121) b!69153))

(assert (= (and b!69153 (not res!57122)) b!69154))

(assert (=> b!69152 m!109627))

(assert (=> b!69152 m!109627))

(assert (=> b!69154 m!109627))

(assert (=> b!69154 m!109627))

(declare-fun m!110639 () Bool)

(assert (=> b!69154 m!110639))

(assert (=> b!68653 d!22086))

(declare-fun d!22088 () Bool)

(assert (=> d!22088 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!110968 () Unit!4613)

(declare-fun choose!11 (BitStream!2290) Unit!4613)

(assert (=> d!22088 (= lt!110968 (choose!11 thiss!1379))))

(assert (=> d!22088 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!110968)))

(declare-fun bs!5320 () Bool)

(assert (= bs!5320 d!22088))

(assert (=> bs!5320 m!109623))

(declare-fun m!110641 () Bool)

(assert (=> bs!5320 m!110641))

(assert (=> b!68653 d!22088))

(declare-fun d!22090 () Bool)

(declare-fun e!45164 () Bool)

(assert (=> d!22090 e!45164))

(declare-fun res!57125 () Bool)

(assert (=> d!22090 (=> (not res!57125) (not e!45164))))

(declare-fun lt!110973 () (_ BitVec 64))

(declare-fun lt!110974 () (_ BitVec 64))

(declare-fun lt!110972 () (_ BitVec 64))

(assert (=> d!22090 (= res!57125 (= lt!110973 (bvsub lt!110972 lt!110974)))))

(assert (=> d!22090 (or (= (bvand lt!110972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110974 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110972 lt!110974) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22090 (= lt!110974 (remainingBits!0 ((_ sign_extend 32) (size!1340 (buf!1721 thiss!1379))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379))))))

(declare-fun lt!110969 () (_ BitVec 64))

(declare-fun lt!110971 () (_ BitVec 64))

(assert (=> d!22090 (= lt!110972 (bvmul lt!110969 lt!110971))))

(assert (=> d!22090 (or (= lt!110969 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!110971 (bvsdiv (bvmul lt!110969 lt!110971) lt!110969)))))

(assert (=> d!22090 (= lt!110971 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22090 (= lt!110969 ((_ sign_extend 32) (size!1340 (buf!1721 thiss!1379))))))

(assert (=> d!22090 (= lt!110973 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3417 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3412 thiss!1379))))))

(assert (=> d!22090 (invariant!0 (currentBit!3412 thiss!1379) (currentByte!3417 thiss!1379) (size!1340 (buf!1721 thiss!1379)))))

(assert (=> d!22090 (= (bitIndex!0 (size!1340 (buf!1721 thiss!1379)) (currentByte!3417 thiss!1379) (currentBit!3412 thiss!1379)) lt!110973)))

(declare-fun b!69155 () Bool)

(declare-fun res!57124 () Bool)

(assert (=> b!69155 (=> (not res!57124) (not e!45164))))

(assert (=> b!69155 (= res!57124 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!110973))))

(declare-fun b!69156 () Bool)

(declare-fun lt!110970 () (_ BitVec 64))

(assert (=> b!69156 (= e!45164 (bvsle lt!110973 (bvmul lt!110970 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69156 (or (= lt!110970 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!110970 #b0000000000000000000000000000000000000000000000000000000000001000) lt!110970)))))

(assert (=> b!69156 (= lt!110970 ((_ sign_extend 32) (size!1340 (buf!1721 thiss!1379))))))

(assert (= (and d!22090 res!57125) b!69155))

(assert (= (and b!69155 res!57124) b!69156))

(declare-fun m!110643 () Bool)

(assert (=> d!22090 m!110643))

(declare-fun m!110645 () Bool)

(assert (=> d!22090 m!110645))

(assert (=> b!68653 d!22090))

(declare-fun d!22092 () Bool)

(assert (=> d!22092 (= (bitAt!0 (buf!1721 (_2!3117 lt!109888)) lt!109892) (not (= (bvand ((_ sign_extend 24) (select (arr!1916 (buf!1721 (_2!3117 lt!109888))) ((_ extract 31 0) (bvsdiv lt!109892 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!109892 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5321 () Bool)

(assert (= bs!5321 d!22092))

(declare-fun m!110647 () Bool)

(assert (=> bs!5321 m!110647))

(assert (=> bs!5321 m!110621))

(assert (=> b!68642 d!22092))

(declare-fun d!22094 () Bool)

(assert (=> d!22094 (= (head!539 lt!109879) (h!835 lt!109879))))

(assert (=> b!68652 d!22094))

(declare-fun d!22096 () Bool)

(assert (=> d!22096 (= (head!539 (byteArrayBitContentToList!0 (_2!3117 lt!109884) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!835 (byteArrayBitContentToList!0 (_2!3117 lt!109884) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!68651 d!22096))

(declare-fun d!22098 () Bool)

(declare-fun c!5124 () Bool)

(assert (=> d!22098 (= c!5124 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45165 () List!720)

(assert (=> d!22098 (= (byteArrayBitContentToList!0 (_2!3117 lt!109884) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!45165)))

(declare-fun b!69157 () Bool)

(assert (=> b!69157 (= e!45165 Nil!717)))

(declare-fun b!69158 () Bool)

(assert (=> b!69158 (= e!45165 (Cons!716 (not (= (bvand ((_ sign_extend 24) (select (arr!1916 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3117 lt!109884) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22098 c!5124) b!69157))

(assert (= (and d!22098 (not c!5124)) b!69158))

(assert (=> b!69158 m!109653))

(assert (=> b!69158 m!110603))

(declare-fun m!110649 () Bool)

(assert (=> b!69158 m!110649))

(assert (=> b!68651 d!22098))

(declare-fun d!22100 () Bool)

(assert (=> d!22100 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1916 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5322 () Bool)

(assert (= bs!5322 d!22100))

(assert (=> bs!5322 m!109653))

(assert (=> bs!5322 m!110603))

(assert (=> b!68651 d!22100))

(declare-fun d!22102 () Bool)

(declare-fun e!45166 () Bool)

(assert (=> d!22102 e!45166))

(declare-fun res!57127 () Bool)

(assert (=> d!22102 (=> (not res!57127) (not e!45166))))

(declare-fun lt!110980 () (_ BitVec 64))

(declare-fun lt!110979 () (_ BitVec 64))

(declare-fun lt!110978 () (_ BitVec 64))

(assert (=> d!22102 (= res!57127 (= lt!110979 (bvsub lt!110978 lt!110980)))))

(assert (=> d!22102 (or (= (bvand lt!110978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110978 lt!110980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22102 (= lt!110980 (remainingBits!0 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))) ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888)))))))

(declare-fun lt!110975 () (_ BitVec 64))

(declare-fun lt!110977 () (_ BitVec 64))

(assert (=> d!22102 (= lt!110978 (bvmul lt!110975 lt!110977))))

(assert (=> d!22102 (or (= lt!110975 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!110977 (bvsdiv (bvmul lt!110975 lt!110977) lt!110975)))))

(assert (=> d!22102 (= lt!110977 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22102 (= lt!110975 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))))))

(assert (=> d!22102 (= lt!110979 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3417 (_2!3117 lt!109888))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3412 (_2!3117 lt!109888)))))))

(assert (=> d!22102 (invariant!0 (currentBit!3412 (_2!3117 lt!109888)) (currentByte!3417 (_2!3117 lt!109888)) (size!1340 (buf!1721 (_2!3117 lt!109888))))))

(assert (=> d!22102 (= (bitIndex!0 (size!1340 (buf!1721 (_2!3117 lt!109888))) (currentByte!3417 (_2!3117 lt!109888)) (currentBit!3412 (_2!3117 lt!109888))) lt!110979)))

(declare-fun b!69159 () Bool)

(declare-fun res!57126 () Bool)

(assert (=> b!69159 (=> (not res!57126) (not e!45166))))

(assert (=> b!69159 (= res!57126 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!110979))))

(declare-fun b!69160 () Bool)

(declare-fun lt!110976 () (_ BitVec 64))

(assert (=> b!69160 (= e!45166 (bvsle lt!110979 (bvmul lt!110976 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69160 (or (= lt!110976 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!110976 #b0000000000000000000000000000000000000000000000000000000000001000) lt!110976)))))

(assert (=> b!69160 (= lt!110976 ((_ sign_extend 32) (size!1340 (buf!1721 (_2!3117 lt!109888)))))))

(assert (= (and d!22102 res!57127) b!69159))

(assert (= (and b!69159 res!57126) b!69160))

(assert (=> d!22102 m!110471))

(assert (=> d!22102 m!109665))

(assert (=> b!68640 d!22102))

(declare-fun d!22104 () Bool)

(assert (=> d!22104 (= (array_inv!1204 srcBuffer!2) (bvsge (size!1340 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13392 d!22104))

(declare-fun d!22106 () Bool)

(assert (=> d!22106 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3412 thiss!1379) (currentByte!3417 thiss!1379) (size!1340 (buf!1721 thiss!1379))))))

(declare-fun bs!5323 () Bool)

(assert (= bs!5323 d!22106))

(assert (=> bs!5323 m!110645))

(assert (=> start!13392 d!22106))

(declare-fun d!22108 () Bool)

(assert (=> d!22108 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1340 (buf!1721 thiss!1379))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1340 (buf!1721 thiss!1379))) ((_ sign_extend 32) (currentByte!3417 thiss!1379)) ((_ sign_extend 32) (currentBit!3412 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5324 () Bool)

(assert (= bs!5324 d!22108))

(assert (=> bs!5324 m!110643))

(assert (=> b!68650 d!22108))

(push 1)

(assert (not d!22008))

(assert (not d!22108))

(assert (not d!21890))

(assert (not d!21984))

(assert (not b!69132))

(assert (not d!21928))

(assert (not d!22012))

(assert (not b!69018))

(assert (not b!68933))

(assert (not d!22088))

(assert (not b!68935))

(assert (not b!69131))

(assert (not b!69137))

(assert (not d!21934))

(assert (not b!69152))

(assert (not b!69154))

(assert (not b!69017))

(assert (not b!69136))

(assert (not d!21988))

(assert (not b!68939))

(assert (not b!68896))

(assert (not b!68934))

(assert (not d!22090))

(assert (not b!69144))

(assert (not d!21986))

(assert (not b!69133))

(assert (not b!69151))

(assert (not d!21968))

(assert (not b!69056))

(assert (not b!69055))

(assert (not b!69053))

(assert (not b!68894))

(assert (not d!22080))

(assert (not b!68942))

(assert (not b!69147))

(assert (not b!69058))

(assert (not b!68895))

(assert (not d!21966))

(assert (not b!69023))

(assert (not d!22106))

(assert (not b!69024))

(assert (not bm!885))

(assert (not b!68927))

(assert (not b!69134))

(assert (not b!69067))

(assert (not b!68930))

(assert (not b!68938))

(assert (not d!21982))

(assert (not b!69148))

(assert (not b!68928))

(assert (not b!69158))

(assert (not d!22016))

(assert (not b!69022))

(assert (not b!68931))

(assert (not b!69019))

(assert (not b!68941))

(assert (not b!69135))

(assert (not d!21962))

(assert (not d!21894))

(assert (not b!69021))

(assert (not b!69138))

(assert (not b!69015))

(assert (not b!69146))

(assert (not d!21960))

(assert (not d!22102))

(assert (not b!69059))

(assert (not b!69027))

(assert (not d!21958))

(assert (not b!69026))

(assert (not b!69061))

(check-sat)

(pop 1)

(push 1)

(check-sat)

