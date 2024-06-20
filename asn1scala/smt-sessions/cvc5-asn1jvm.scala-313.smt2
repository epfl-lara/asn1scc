; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6752 () Bool)

(assert start!6752)

(declare-fun b!31653 () Bool)

(declare-fun e!20968 () Bool)

(declare-fun e!20970 () Bool)

(assert (=> b!31653 (= e!20968 e!20970)))

(declare-fun res!27076 () Bool)

(assert (=> b!31653 (=> res!27076 e!20970)))

(declare-datatypes ((array!1805 0))(
  ( (array!1806 (arr!1265 (Array (_ BitVec 32) (_ BitVec 8))) (size!793 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1384 0))(
  ( (BitStream!1385 (buf!1121 array!1805) (currentByte!2482 (_ BitVec 32)) (currentBit!2477 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2417 0))(
  ( (Unit!2418) )
))
(declare-datatypes ((tuple2!3274 0))(
  ( (tuple2!3275 (_1!1724 Unit!2417) (_2!1724 BitStream!1384)) )
))
(declare-fun lt!46755 () tuple2!3274)

(declare-fun lt!46748 () tuple2!3274)

(declare-fun isPrefixOf!0 (BitStream!1384 BitStream!1384) Bool)

(assert (=> b!31653 (= res!27076 (not (isPrefixOf!0 (_2!1724 lt!46755) (_2!1724 lt!46748))))))

(declare-fun thiss!1379 () BitStream!1384)

(assert (=> b!31653 (isPrefixOf!0 thiss!1379 (_2!1724 lt!46748))))

(declare-fun lt!46747 () Unit!2417)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1384 BitStream!1384 BitStream!1384) Unit!2417)

(assert (=> b!31653 (= lt!46747 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1724 lt!46755) (_2!1724 lt!46748)))))

(declare-fun srcBuffer!2 () array!1805)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1384 array!1805 (_ BitVec 64) (_ BitVec 64)) tuple2!3274)

(assert (=> b!31653 (= lt!46748 (appendBitsMSBFirstLoop!0 (_2!1724 lt!46755) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!20963 () Bool)

(assert (=> b!31653 e!20963))

(declare-fun res!27075 () Bool)

(assert (=> b!31653 (=> (not res!27075) (not e!20963))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31653 (= res!27075 (validate_offset_bits!1 ((_ sign_extend 32) (size!793 (buf!1121 (_2!1724 lt!46755)))) ((_ sign_extend 32) (currentByte!2482 thiss!1379)) ((_ sign_extend 32) (currentBit!2477 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46740 () Unit!2417)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1384 array!1805 (_ BitVec 64)) Unit!2417)

(assert (=> b!31653 (= lt!46740 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1121 (_2!1724 lt!46755)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3276 0))(
  ( (tuple2!3277 (_1!1725 BitStream!1384) (_2!1725 BitStream!1384)) )
))
(declare-fun lt!46750 () tuple2!3276)

(declare-fun reader!0 (BitStream!1384 BitStream!1384) tuple2!3276)

(assert (=> b!31653 (= lt!46750 (reader!0 thiss!1379 (_2!1724 lt!46755)))))

(declare-fun b!31654 () Bool)

(declare-fun e!20973 () Bool)

(declare-fun e!20971 () Bool)

(assert (=> b!31654 (= e!20973 e!20971)))

(declare-fun res!27080 () Bool)

(assert (=> b!31654 (=> res!27080 e!20971)))

(declare-datatypes ((List!393 0))(
  ( (Nil!390) (Cons!389 (h!508 Bool) (t!1143 List!393)) )
))
(declare-fun lt!46744 () List!393)

(declare-fun lt!46752 () List!393)

(assert (=> b!31654 (= res!27080 (not (= lt!46744 lt!46752)))))

(assert (=> b!31654 (= lt!46752 lt!46744)))

(declare-fun lt!46749 () List!393)

(declare-fun tail!110 (List!393) List!393)

(assert (=> b!31654 (= lt!46744 (tail!110 lt!46749))))

(declare-fun lt!46753 () Unit!2417)

(declare-fun lt!46743 () tuple2!3276)

(declare-fun lt!46741 () tuple2!3276)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1384 BitStream!1384 BitStream!1384 BitStream!1384 (_ BitVec 64) List!393) Unit!2417)

(assert (=> b!31654 (= lt!46753 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1724 lt!46748) (_2!1724 lt!46748) (_1!1725 lt!46743) (_1!1725 lt!46741) (bvsub to!314 i!635) lt!46749))))

(declare-fun b!31655 () Bool)

(declare-fun e!20962 () Bool)

(declare-fun e!20974 () Bool)

(assert (=> b!31655 (= e!20962 e!20974)))

(declare-fun res!27088 () Bool)

(assert (=> b!31655 (=> (not res!27088) (not e!20974))))

(declare-fun lt!46738 () (_ BitVec 64))

(assert (=> b!31655 (= res!27088 (bvsle to!314 lt!46738))))

(assert (=> b!31655 (= lt!46738 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!793 srcBuffer!2))))))

(declare-fun e!20960 () Bool)

(declare-fun b!31656 () Bool)

(declare-fun lt!46754 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!31656 (= e!20960 (= lt!46754 (bvsub (bvsub (bvadd (bitIndex!0 (size!793 (buf!1121 (_2!1724 lt!46755))) (currentByte!2482 (_2!1724 lt!46755)) (currentBit!2477 (_2!1724 lt!46755))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!31657 () Bool)

(declare-fun head!230 (List!393) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1384 array!1805 (_ BitVec 64) (_ BitVec 64)) List!393)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1384 BitStream!1384 (_ BitVec 64)) List!393)

(assert (=> b!31657 (= e!20963 (= (head!230 (byteArrayBitContentToList!0 (_2!1724 lt!46755) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!230 (bitStreamReadBitsIntoList!0 (_2!1724 lt!46755) (_1!1725 lt!46750) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!31658 () Bool)

(declare-fun e!20966 () Bool)

(declare-fun array_inv!745 (array!1805) Bool)

(assert (=> b!31658 (= e!20966 (array_inv!745 (buf!1121 thiss!1379)))))

(declare-fun b!31659 () Bool)

(declare-fun e!20964 () Bool)

(assert (=> b!31659 (= e!20971 e!20964)))

(declare-fun res!27085 () Bool)

(assert (=> b!31659 (=> res!27085 e!20964)))

(declare-fun lt!46745 () (_ BitVec 64))

(declare-fun lt!46751 () Bool)

(declare-fun bitAt!0 (array!1805 (_ BitVec 64)) Bool)

(assert (=> b!31659 (= res!27085 (not (= lt!46751 (bitAt!0 (buf!1121 (_1!1725 lt!46741)) lt!46745))))))

(assert (=> b!31659 (= lt!46751 (bitAt!0 (buf!1121 (_1!1725 lt!46743)) lt!46745))))

(declare-fun b!31660 () Bool)

(declare-fun e!20969 () Bool)

(assert (=> b!31660 (= e!20969 e!20968)))

(declare-fun res!27077 () Bool)

(assert (=> b!31660 (=> res!27077 e!20968)))

(assert (=> b!31660 (= res!27077 (not (isPrefixOf!0 thiss!1379 (_2!1724 lt!46755))))))

(declare-fun lt!46742 () (_ BitVec 64))

(assert (=> b!31660 (validate_offset_bits!1 ((_ sign_extend 32) (size!793 (buf!1121 (_2!1724 lt!46755)))) ((_ sign_extend 32) (currentByte!2482 (_2!1724 lt!46755))) ((_ sign_extend 32) (currentBit!2477 (_2!1724 lt!46755))) lt!46742)))

(assert (=> b!31660 (= lt!46742 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46737 () Unit!2417)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1384 BitStream!1384 (_ BitVec 64) (_ BitVec 64)) Unit!2417)

(assert (=> b!31660 (= lt!46737 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1724 lt!46755) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1384 (_ BitVec 8) (_ BitVec 32)) tuple2!3274)

(assert (=> b!31660 (= lt!46755 (appendBitFromByte!0 thiss!1379 (select (arr!1265 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!31661 () Bool)

(declare-fun res!27074 () Bool)

(declare-fun e!20965 () Bool)

(assert (=> b!31661 (=> res!27074 e!20965)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!31661 (= res!27074 (not (invariant!0 (currentBit!2477 (_2!1724 lt!46748)) (currentByte!2482 (_2!1724 lt!46748)) (size!793 (buf!1121 (_2!1724 lt!46748))))))))

(declare-fun res!27086 () Bool)

(assert (=> start!6752 (=> (not res!27086) (not e!20962))))

(assert (=> start!6752 (= res!27086 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!6752 e!20962))

(assert (=> start!6752 true))

(declare-fun inv!12 (BitStream!1384) Bool)

(assert (=> start!6752 (and (inv!12 thiss!1379) e!20966)))

(assert (=> start!6752 (array_inv!745 srcBuffer!2)))

(declare-fun b!31662 () Bool)

(assert (=> b!31662 (= e!20970 e!20965)))

(declare-fun res!27072 () Bool)

(assert (=> b!31662 (=> res!27072 e!20965)))

(assert (=> b!31662 (= res!27072 (not (= lt!46754 (bvsub (bvadd lt!46745 to!314) i!635))))))

(assert (=> b!31662 (= lt!46754 (bitIndex!0 (size!793 (buf!1121 (_2!1724 lt!46748))) (currentByte!2482 (_2!1724 lt!46748)) (currentBit!2477 (_2!1724 lt!46748))))))

(declare-fun b!31663 () Bool)

(declare-fun res!27082 () Bool)

(assert (=> b!31663 (=> res!27082 e!20964)))

(assert (=> b!31663 (= res!27082 (not (= (head!230 lt!46749) lt!46751)))))

(declare-fun b!31664 () Bool)

(assert (=> b!31664 (= e!20974 (not e!20969))))

(declare-fun res!27078 () Bool)

(assert (=> b!31664 (=> res!27078 e!20969)))

(assert (=> b!31664 (= res!27078 (bvsge i!635 to!314))))

(assert (=> b!31664 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!46739 () Unit!2417)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1384) Unit!2417)

(assert (=> b!31664 (= lt!46739 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!31664 (= lt!46745 (bitIndex!0 (size!793 (buf!1121 thiss!1379)) (currentByte!2482 thiss!1379) (currentBit!2477 thiss!1379)))))

(declare-fun b!31665 () Bool)

(declare-fun res!27090 () Bool)

(assert (=> b!31665 (=> res!27090 e!20973)))

(declare-fun length!119 (List!393) Int)

(assert (=> b!31665 (= res!27090 (<= (length!119 lt!46749) 0))))

(declare-fun b!31666 () Bool)

(declare-fun res!27081 () Bool)

(declare-fun e!20972 () Bool)

(assert (=> b!31666 (=> res!27081 e!20972)))

(assert (=> b!31666 (= res!27081 (not (invariant!0 (currentBit!2477 (_2!1724 lt!46755)) (currentByte!2482 (_2!1724 lt!46755)) (size!793 (buf!1121 (_2!1724 lt!46755))))))))

(declare-fun b!31667 () Bool)

(assert (=> b!31667 (= e!20972 e!20973)))

(declare-fun res!27089 () Bool)

(assert (=> b!31667 (=> res!27089 e!20973)))

(assert (=> b!31667 (= res!27089 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!31667 (= lt!46752 (bitStreamReadBitsIntoList!0 (_2!1724 lt!46748) (_1!1725 lt!46741) lt!46742))))

(assert (=> b!31667 (= lt!46749 (bitStreamReadBitsIntoList!0 (_2!1724 lt!46748) (_1!1725 lt!46743) (bvsub to!314 i!635)))))

(assert (=> b!31667 (validate_offset_bits!1 ((_ sign_extend 32) (size!793 (buf!1121 (_2!1724 lt!46748)))) ((_ sign_extend 32) (currentByte!2482 (_2!1724 lt!46755))) ((_ sign_extend 32) (currentBit!2477 (_2!1724 lt!46755))) lt!46742)))

(declare-fun lt!46746 () Unit!2417)

(assert (=> b!31667 (= lt!46746 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1724 lt!46755) (buf!1121 (_2!1724 lt!46748)) lt!46742))))

(assert (=> b!31667 (= lt!46741 (reader!0 (_2!1724 lt!46755) (_2!1724 lt!46748)))))

(assert (=> b!31667 (validate_offset_bits!1 ((_ sign_extend 32) (size!793 (buf!1121 (_2!1724 lt!46748)))) ((_ sign_extend 32) (currentByte!2482 thiss!1379)) ((_ sign_extend 32) (currentBit!2477 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!46756 () Unit!2417)

(assert (=> b!31667 (= lt!46756 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1121 (_2!1724 lt!46748)) (bvsub to!314 i!635)))))

(assert (=> b!31667 (= lt!46743 (reader!0 thiss!1379 (_2!1724 lt!46748)))))

(declare-fun b!31668 () Bool)

(assert (=> b!31668 (= e!20964 (bvslt i!635 lt!46738))))

(declare-fun b!31669 () Bool)

(declare-fun res!27084 () Bool)

(assert (=> b!31669 (=> res!27084 e!20965)))

(assert (=> b!31669 (= res!27084 (not (= (size!793 (buf!1121 thiss!1379)) (size!793 (buf!1121 (_2!1724 lt!46748))))))))

(declare-fun b!31670 () Bool)

(declare-fun res!27083 () Bool)

(assert (=> b!31670 (=> res!27083 e!20972)))

(assert (=> b!31670 (= res!27083 (not (invariant!0 (currentBit!2477 (_2!1724 lt!46755)) (currentByte!2482 (_2!1724 lt!46755)) (size!793 (buf!1121 (_2!1724 lt!46748))))))))

(declare-fun b!31671 () Bool)

(assert (=> b!31671 (= e!20965 e!20972)))

(declare-fun res!27079 () Bool)

(assert (=> b!31671 (=> res!27079 e!20972)))

(assert (=> b!31671 (= res!27079 (not (= (size!793 (buf!1121 (_2!1724 lt!46755))) (size!793 (buf!1121 (_2!1724 lt!46748))))))))

(assert (=> b!31671 e!20960))

(declare-fun res!27087 () Bool)

(assert (=> b!31671 (=> (not res!27087) (not e!20960))))

(assert (=> b!31671 (= res!27087 (= (size!793 (buf!1121 (_2!1724 lt!46748))) (size!793 (buf!1121 thiss!1379))))))

(declare-fun b!31672 () Bool)

(declare-fun res!27073 () Bool)

(assert (=> b!31672 (=> (not res!27073) (not e!20974))))

(assert (=> b!31672 (= res!27073 (validate_offset_bits!1 ((_ sign_extend 32) (size!793 (buf!1121 thiss!1379))) ((_ sign_extend 32) (currentByte!2482 thiss!1379)) ((_ sign_extend 32) (currentBit!2477 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!6752 res!27086) b!31655))

(assert (= (and b!31655 res!27088) b!31672))

(assert (= (and b!31672 res!27073) b!31664))

(assert (= (and b!31664 (not res!27078)) b!31660))

(assert (= (and b!31660 (not res!27077)) b!31653))

(assert (= (and b!31653 res!27075) b!31657))

(assert (= (and b!31653 (not res!27076)) b!31662))

(assert (= (and b!31662 (not res!27072)) b!31661))

(assert (= (and b!31661 (not res!27074)) b!31669))

(assert (= (and b!31669 (not res!27084)) b!31671))

(assert (= (and b!31671 res!27087) b!31656))

(assert (= (and b!31671 (not res!27079)) b!31666))

(assert (= (and b!31666 (not res!27081)) b!31670))

(assert (= (and b!31670 (not res!27083)) b!31667))

(assert (= (and b!31667 (not res!27089)) b!31665))

(assert (= (and b!31665 (not res!27090)) b!31654))

(assert (= (and b!31654 (not res!27080)) b!31659))

(assert (= (and b!31659 (not res!27085)) b!31663))

(assert (= (and b!31663 (not res!27082)) b!31668))

(assert (= start!6752 b!31658))

(declare-fun m!46653 () Bool)

(assert (=> b!31663 m!46653))

(declare-fun m!46655 () Bool)

(assert (=> b!31665 m!46655))

(declare-fun m!46657 () Bool)

(assert (=> b!31658 m!46657))

(declare-fun m!46659 () Bool)

(assert (=> b!31666 m!46659))

(declare-fun m!46661 () Bool)

(assert (=> b!31670 m!46661))

(declare-fun m!46663 () Bool)

(assert (=> b!31659 m!46663))

(declare-fun m!46665 () Bool)

(assert (=> b!31659 m!46665))

(declare-fun m!46667 () Bool)

(assert (=> b!31660 m!46667))

(declare-fun m!46669 () Bool)

(assert (=> b!31660 m!46669))

(declare-fun m!46671 () Bool)

(assert (=> b!31660 m!46671))

(declare-fun m!46673 () Bool)

(assert (=> b!31660 m!46673))

(assert (=> b!31660 m!46667))

(declare-fun m!46675 () Bool)

(assert (=> b!31660 m!46675))

(declare-fun m!46677 () Bool)

(assert (=> b!31653 m!46677))

(declare-fun m!46679 () Bool)

(assert (=> b!31653 m!46679))

(declare-fun m!46681 () Bool)

(assert (=> b!31653 m!46681))

(declare-fun m!46683 () Bool)

(assert (=> b!31653 m!46683))

(declare-fun m!46685 () Bool)

(assert (=> b!31653 m!46685))

(declare-fun m!46687 () Bool)

(assert (=> b!31653 m!46687))

(declare-fun m!46689 () Bool)

(assert (=> b!31653 m!46689))

(declare-fun m!46691 () Bool)

(assert (=> b!31664 m!46691))

(declare-fun m!46693 () Bool)

(assert (=> b!31664 m!46693))

(declare-fun m!46695 () Bool)

(assert (=> b!31664 m!46695))

(declare-fun m!46697 () Bool)

(assert (=> b!31672 m!46697))

(declare-fun m!46699 () Bool)

(assert (=> b!31662 m!46699))

(declare-fun m!46701 () Bool)

(assert (=> b!31661 m!46701))

(declare-fun m!46703 () Bool)

(assert (=> b!31657 m!46703))

(assert (=> b!31657 m!46703))

(declare-fun m!46705 () Bool)

(assert (=> b!31657 m!46705))

(declare-fun m!46707 () Bool)

(assert (=> b!31657 m!46707))

(assert (=> b!31657 m!46707))

(declare-fun m!46709 () Bool)

(assert (=> b!31657 m!46709))

(declare-fun m!46711 () Bool)

(assert (=> b!31656 m!46711))

(declare-fun m!46713 () Bool)

(assert (=> start!6752 m!46713))

(declare-fun m!46715 () Bool)

(assert (=> start!6752 m!46715))

(declare-fun m!46717 () Bool)

(assert (=> b!31667 m!46717))

(declare-fun m!46719 () Bool)

(assert (=> b!31667 m!46719))

(declare-fun m!46721 () Bool)

(assert (=> b!31667 m!46721))

(declare-fun m!46723 () Bool)

(assert (=> b!31667 m!46723))

(declare-fun m!46725 () Bool)

(assert (=> b!31667 m!46725))

(declare-fun m!46727 () Bool)

(assert (=> b!31667 m!46727))

(declare-fun m!46729 () Bool)

(assert (=> b!31667 m!46729))

(declare-fun m!46731 () Bool)

(assert (=> b!31667 m!46731))

(declare-fun m!46733 () Bool)

(assert (=> b!31654 m!46733))

(declare-fun m!46735 () Bool)

(assert (=> b!31654 m!46735))

(push 1)

(assert (not b!31662))

(assert (not b!31663))

(assert (not b!31664))

(assert (not b!31667))

(assert (not b!31656))

(assert (not b!31666))

(assert (not b!31660))

(assert (not b!31665))

(assert (not b!31672))

(assert (not start!6752))

(assert (not b!31670))

(assert (not b!31661))

(assert (not b!31654))

(assert (not b!31657))

(assert (not b!31658))

(assert (not b!31659))

(assert (not b!31653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

