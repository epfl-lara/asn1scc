; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5708 () Bool)

(assert start!5708)

(declare-fun b!24504 () Bool)

(declare-fun e!16711 () Bool)

(assert (=> b!24504 (= e!16711 true)))

(declare-datatypes ((array!1631 0))(
  ( (array!1632 (arr!1157 (Array (_ BitVec 32) (_ BitVec 8))) (size!701 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1234 0))(
  ( (BitStream!1235 (buf!1022 array!1631) (currentByte!2335 (_ BitVec 32)) (currentBit!2330 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2045 0))(
  ( (Unit!2046) )
))
(declare-datatypes ((tuple2!2786 0))(
  ( (tuple2!2787 (_1!1480 Unit!2045) (_2!1480 BitStream!1234)) )
))
(declare-fun lt!34982 () tuple2!2786)

(declare-fun lt!34992 () tuple2!2786)

(declare-fun lt!34991 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24504 (validate_offset_bits!1 ((_ sign_extend 32) (size!701 (buf!1022 (_2!1480 lt!34982)))) ((_ sign_extend 32) (currentByte!2335 (_2!1480 lt!34992))) ((_ sign_extend 32) (currentBit!2330 (_2!1480 lt!34992))) lt!34991)))

(declare-fun lt!34988 () Unit!2045)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1234 array!1631 (_ BitVec 64)) Unit!2045)

(assert (=> b!24504 (= lt!34988 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1480 lt!34992) (buf!1022 (_2!1480 lt!34982)) lt!34991))))

(declare-datatypes ((tuple2!2788 0))(
  ( (tuple2!2789 (_1!1481 BitStream!1234) (_2!1481 BitStream!1234)) )
))
(declare-fun lt!34985 () tuple2!2788)

(declare-fun reader!0 (BitStream!1234 BitStream!1234) tuple2!2788)

(assert (=> b!24504 (= lt!34985 (reader!0 (_2!1480 lt!34992) (_2!1480 lt!34982)))))

(declare-fun thiss!1379 () BitStream!1234)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!24504 (validate_offset_bits!1 ((_ sign_extend 32) (size!701 (buf!1022 (_2!1480 lt!34982)))) ((_ sign_extend 32) (currentByte!2335 thiss!1379)) ((_ sign_extend 32) (currentBit!2330 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34980 () Unit!2045)

(assert (=> b!24504 (= lt!34980 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1022 (_2!1480 lt!34982)) (bvsub to!314 i!635)))))

(declare-fun lt!34987 () tuple2!2788)

(assert (=> b!24504 (= lt!34987 (reader!0 thiss!1379 (_2!1480 lt!34982)))))

(declare-fun b!24505 () Bool)

(declare-fun res!21159 () Bool)

(assert (=> b!24505 (=> res!21159 e!16711)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24505 (= res!21159 (not (invariant!0 (currentBit!2330 (_2!1480 lt!34992)) (currentByte!2335 (_2!1480 lt!34992)) (size!701 (buf!1022 (_2!1480 lt!34992))))))))

(declare-fun b!24506 () Bool)

(declare-fun e!16710 () Bool)

(declare-fun e!16707 () Bool)

(assert (=> b!24506 (= e!16710 e!16707)))

(declare-fun res!21156 () Bool)

(assert (=> b!24506 (=> res!21156 e!16707)))

(declare-fun lt!34981 () (_ BitVec 64))

(declare-fun lt!34990 () (_ BitVec 64))

(assert (=> b!24506 (= res!21156 (not (= lt!34990 (bvsub (bvadd lt!34981 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24506 (= lt!34990 (bitIndex!0 (size!701 (buf!1022 (_2!1480 lt!34982))) (currentByte!2335 (_2!1480 lt!34982)) (currentBit!2330 (_2!1480 lt!34982))))))

(declare-fun b!24507 () Bool)

(declare-fun e!16709 () Bool)

(declare-fun e!16713 () Bool)

(assert (=> b!24507 (= e!16709 e!16713)))

(declare-fun res!21152 () Bool)

(assert (=> b!24507 (=> res!21152 e!16713)))

(declare-fun isPrefixOf!0 (BitStream!1234 BitStream!1234) Bool)

(assert (=> b!24507 (= res!21152 (not (isPrefixOf!0 thiss!1379 (_2!1480 lt!34992))))))

(assert (=> b!24507 (validate_offset_bits!1 ((_ sign_extend 32) (size!701 (buf!1022 (_2!1480 lt!34992)))) ((_ sign_extend 32) (currentByte!2335 (_2!1480 lt!34992))) ((_ sign_extend 32) (currentBit!2330 (_2!1480 lt!34992))) lt!34991)))

(assert (=> b!24507 (= lt!34991 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34986 () Unit!2045)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1234 BitStream!1234 (_ BitVec 64) (_ BitVec 64)) Unit!2045)

(assert (=> b!24507 (= lt!34986 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1480 lt!34992) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1631)

(declare-fun appendBitFromByte!0 (BitStream!1234 (_ BitVec 8) (_ BitVec 32)) tuple2!2786)

(assert (=> b!24507 (= lt!34992 (appendBitFromByte!0 thiss!1379 (select (arr!1157 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!16706 () Bool)

(declare-fun b!24508 () Bool)

(assert (=> b!24508 (= e!16706 (= lt!34990 (bvsub (bvsub (bvadd (bitIndex!0 (size!701 (buf!1022 (_2!1480 lt!34992))) (currentByte!2335 (_2!1480 lt!34992)) (currentBit!2330 (_2!1480 lt!34992))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!21157 () Bool)

(declare-fun e!16704 () Bool)

(assert (=> start!5708 (=> (not res!21157) (not e!16704))))

(assert (=> start!5708 (= res!21157 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!701 srcBuffer!2))))))))

(assert (=> start!5708 e!16704))

(assert (=> start!5708 true))

(declare-fun array_inv!670 (array!1631) Bool)

(assert (=> start!5708 (array_inv!670 srcBuffer!2)))

(declare-fun e!16712 () Bool)

(declare-fun inv!12 (BitStream!1234) Bool)

(assert (=> start!5708 (and (inv!12 thiss!1379) e!16712)))

(declare-fun b!24509 () Bool)

(declare-fun res!21155 () Bool)

(assert (=> b!24509 (=> (not res!21155) (not e!16704))))

(assert (=> b!24509 (= res!21155 (validate_offset_bits!1 ((_ sign_extend 32) (size!701 (buf!1022 thiss!1379))) ((_ sign_extend 32) (currentByte!2335 thiss!1379)) ((_ sign_extend 32) (currentBit!2330 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24510 () Bool)

(declare-fun res!21153 () Bool)

(assert (=> b!24510 (=> res!21153 e!16707)))

(assert (=> b!24510 (= res!21153 (not (invariant!0 (currentBit!2330 (_2!1480 lt!34982)) (currentByte!2335 (_2!1480 lt!34982)) (size!701 (buf!1022 (_2!1480 lt!34982))))))))

(declare-fun lt!34983 () tuple2!2788)

(declare-fun b!24511 () Bool)

(declare-fun e!16705 () Bool)

(declare-datatypes ((List!318 0))(
  ( (Nil!315) (Cons!314 (h!433 Bool) (t!1068 List!318)) )
))
(declare-fun head!155 (List!318) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1234 array!1631 (_ BitVec 64) (_ BitVec 64)) List!318)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1234 BitStream!1234 (_ BitVec 64)) List!318)

(assert (=> b!24511 (= e!16705 (= (head!155 (byteArrayBitContentToList!0 (_2!1480 lt!34992) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!155 (bitStreamReadBitsIntoList!0 (_2!1480 lt!34992) (_1!1481 lt!34983) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24512 () Bool)

(assert (=> b!24512 (= e!16712 (array_inv!670 (buf!1022 thiss!1379)))))

(declare-fun b!24513 () Bool)

(declare-fun res!21151 () Bool)

(assert (=> b!24513 (=> res!21151 e!16711)))

(assert (=> b!24513 (= res!21151 (not (invariant!0 (currentBit!2330 (_2!1480 lt!34992)) (currentByte!2335 (_2!1480 lt!34992)) (size!701 (buf!1022 (_2!1480 lt!34982))))))))

(declare-fun b!24514 () Bool)

(assert (=> b!24514 (= e!16704 (not e!16709))))

(declare-fun res!21150 () Bool)

(assert (=> b!24514 (=> res!21150 e!16709)))

(assert (=> b!24514 (= res!21150 (bvsge i!635 to!314))))

(assert (=> b!24514 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34993 () Unit!2045)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1234) Unit!2045)

(assert (=> b!24514 (= lt!34993 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24514 (= lt!34981 (bitIndex!0 (size!701 (buf!1022 thiss!1379)) (currentByte!2335 thiss!1379) (currentBit!2330 thiss!1379)))))

(declare-fun b!24515 () Bool)

(assert (=> b!24515 (= e!16707 e!16711)))

(declare-fun res!21162 () Bool)

(assert (=> b!24515 (=> res!21162 e!16711)))

(assert (=> b!24515 (= res!21162 (not (= (size!701 (buf!1022 (_2!1480 lt!34992))) (size!701 (buf!1022 (_2!1480 lt!34982))))))))

(assert (=> b!24515 e!16706))

(declare-fun res!21154 () Bool)

(assert (=> b!24515 (=> (not res!21154) (not e!16706))))

(assert (=> b!24515 (= res!21154 (= (size!701 (buf!1022 (_2!1480 lt!34982))) (size!701 (buf!1022 thiss!1379))))))

(declare-fun b!24516 () Bool)

(assert (=> b!24516 (= e!16713 e!16710)))

(declare-fun res!21158 () Bool)

(assert (=> b!24516 (=> res!21158 e!16710)))

(assert (=> b!24516 (= res!21158 (not (isPrefixOf!0 (_2!1480 lt!34992) (_2!1480 lt!34982))))))

(assert (=> b!24516 (isPrefixOf!0 thiss!1379 (_2!1480 lt!34982))))

(declare-fun lt!34989 () Unit!2045)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1234 BitStream!1234 BitStream!1234) Unit!2045)

(assert (=> b!24516 (= lt!34989 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1480 lt!34992) (_2!1480 lt!34982)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1234 array!1631 (_ BitVec 64) (_ BitVec 64)) tuple2!2786)

(assert (=> b!24516 (= lt!34982 (appendBitsMSBFirstLoop!0 (_2!1480 lt!34992) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24516 e!16705))

(declare-fun res!21160 () Bool)

(assert (=> b!24516 (=> (not res!21160) (not e!16705))))

(assert (=> b!24516 (= res!21160 (validate_offset_bits!1 ((_ sign_extend 32) (size!701 (buf!1022 (_2!1480 lt!34992)))) ((_ sign_extend 32) (currentByte!2335 thiss!1379)) ((_ sign_extend 32) (currentBit!2330 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34984 () Unit!2045)

(assert (=> b!24516 (= lt!34984 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1022 (_2!1480 lt!34992)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24516 (= lt!34983 (reader!0 thiss!1379 (_2!1480 lt!34992)))))

(declare-fun b!24517 () Bool)

(declare-fun res!21161 () Bool)

(assert (=> b!24517 (=> res!21161 e!16707)))

(assert (=> b!24517 (= res!21161 (not (= (size!701 (buf!1022 thiss!1379)) (size!701 (buf!1022 (_2!1480 lt!34982))))))))

(assert (= (and start!5708 res!21157) b!24509))

(assert (= (and b!24509 res!21155) b!24514))

(assert (= (and b!24514 (not res!21150)) b!24507))

(assert (= (and b!24507 (not res!21152)) b!24516))

(assert (= (and b!24516 res!21160) b!24511))

(assert (= (and b!24516 (not res!21158)) b!24506))

(assert (= (and b!24506 (not res!21156)) b!24510))

(assert (= (and b!24510 (not res!21153)) b!24517))

(assert (= (and b!24517 (not res!21161)) b!24515))

(assert (= (and b!24515 res!21154) b!24508))

(assert (= (and b!24515 (not res!21162)) b!24505))

(assert (= (and b!24505 (not res!21159)) b!24513))

(assert (= (and b!24513 (not res!21151)) b!24504))

(assert (= start!5708 b!24512))

(declare-fun m!34617 () Bool)

(assert (=> b!24516 m!34617))

(declare-fun m!34619 () Bool)

(assert (=> b!24516 m!34619))

(declare-fun m!34621 () Bool)

(assert (=> b!24516 m!34621))

(declare-fun m!34623 () Bool)

(assert (=> b!24516 m!34623))

(declare-fun m!34625 () Bool)

(assert (=> b!24516 m!34625))

(declare-fun m!34627 () Bool)

(assert (=> b!24516 m!34627))

(declare-fun m!34629 () Bool)

(assert (=> b!24516 m!34629))

(declare-fun m!34631 () Bool)

(assert (=> b!24514 m!34631))

(declare-fun m!34633 () Bool)

(assert (=> b!24514 m!34633))

(declare-fun m!34635 () Bool)

(assert (=> b!24514 m!34635))

(declare-fun m!34637 () Bool)

(assert (=> b!24505 m!34637))

(declare-fun m!34639 () Bool)

(assert (=> start!5708 m!34639))

(declare-fun m!34641 () Bool)

(assert (=> start!5708 m!34641))

(declare-fun m!34643 () Bool)

(assert (=> b!24512 m!34643))

(declare-fun m!34645 () Bool)

(assert (=> b!24510 m!34645))

(declare-fun m!34647 () Bool)

(assert (=> b!24513 m!34647))

(declare-fun m!34649 () Bool)

(assert (=> b!24508 m!34649))

(declare-fun m!34651 () Bool)

(assert (=> b!24504 m!34651))

(declare-fun m!34653 () Bool)

(assert (=> b!24504 m!34653))

(declare-fun m!34655 () Bool)

(assert (=> b!24504 m!34655))

(declare-fun m!34657 () Bool)

(assert (=> b!24504 m!34657))

(declare-fun m!34659 () Bool)

(assert (=> b!24504 m!34659))

(declare-fun m!34661 () Bool)

(assert (=> b!24504 m!34661))

(declare-fun m!34663 () Bool)

(assert (=> b!24506 m!34663))

(declare-fun m!34665 () Bool)

(assert (=> b!24507 m!34665))

(declare-fun m!34667 () Bool)

(assert (=> b!24507 m!34667))

(declare-fun m!34669 () Bool)

(assert (=> b!24507 m!34669))

(assert (=> b!24507 m!34667))

(declare-fun m!34671 () Bool)

(assert (=> b!24507 m!34671))

(declare-fun m!34673 () Bool)

(assert (=> b!24507 m!34673))

(declare-fun m!34675 () Bool)

(assert (=> b!24511 m!34675))

(assert (=> b!24511 m!34675))

(declare-fun m!34677 () Bool)

(assert (=> b!24511 m!34677))

(declare-fun m!34679 () Bool)

(assert (=> b!24511 m!34679))

(assert (=> b!24511 m!34679))

(declare-fun m!34681 () Bool)

(assert (=> b!24511 m!34681))

(declare-fun m!34683 () Bool)

(assert (=> b!24509 m!34683))

(push 1)

