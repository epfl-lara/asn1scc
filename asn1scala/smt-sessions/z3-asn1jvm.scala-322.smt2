; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6928 () Bool)

(assert start!6928)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!49238 () (_ BitVec 64))

(declare-fun b!33514 () Bool)

(declare-datatypes ((array!1864 0))(
  ( (array!1865 (arr!1299 (Array (_ BitVec 32) (_ BitVec 8))) (size!824 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1440 0))(
  ( (BitStream!1441 (buf!1152 array!1864) (currentByte!2519 (_ BitVec 32)) (currentBit!2514 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2503 0))(
  ( (Unit!2504) )
))
(declare-datatypes ((tuple2!3410 0))(
  ( (tuple2!3411 (_1!1792 Unit!2503) (_2!1792 BitStream!1440)) )
))
(declare-fun lt!49244 () tuple2!3410)

(declare-fun e!22240 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33514 (= e!22240 (= lt!49238 (bvsub (bvsub (bvadd (bitIndex!0 (size!824 (buf!1152 (_2!1792 lt!49244))) (currentByte!2519 (_2!1792 lt!49244)) (currentBit!2514 (_2!1792 lt!49244))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33515 () Bool)

(declare-fun e!22247 () Bool)

(declare-fun e!22245 () Bool)

(assert (=> b!33515 (= e!22247 (not e!22245))))

(declare-fun res!28726 () Bool)

(assert (=> b!33515 (=> res!28726 e!22245)))

(assert (=> b!33515 (= res!28726 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1440)

(declare-fun isPrefixOf!0 (BitStream!1440 BitStream!1440) Bool)

(assert (=> b!33515 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49241 () Unit!2503)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1440) Unit!2503)

(assert (=> b!33515 (= lt!49241 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!49237 () (_ BitVec 64))

(assert (=> b!33515 (= lt!49237 (bitIndex!0 (size!824 (buf!1152 thiss!1379)) (currentByte!2519 thiss!1379) (currentBit!2514 thiss!1379)))))

(declare-fun srcBuffer!2 () array!1864)

(declare-datatypes ((tuple2!3412 0))(
  ( (tuple2!3413 (_1!1793 BitStream!1440) (_2!1793 BitStream!1440)) )
))
(declare-fun lt!49242 () tuple2!3412)

(declare-fun b!33516 () Bool)

(declare-fun e!22249 () Bool)

(declare-datatypes ((List!421 0))(
  ( (Nil!418) (Cons!417 (h!536 Bool) (t!1171 List!421)) )
))
(declare-fun head!258 (List!421) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1440 array!1864 (_ BitVec 64) (_ BitVec 64)) List!421)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1440 BitStream!1440 (_ BitVec 64)) List!421)

(assert (=> b!33516 (= e!22249 (= (head!258 (byteArrayBitContentToList!0 (_2!1792 lt!49244) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!258 (bitStreamReadBitsIntoList!0 (_2!1792 lt!49244) (_1!1793 lt!49242) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33517 () Bool)

(declare-fun e!22244 () Bool)

(declare-fun e!22246 () Bool)

(assert (=> b!33517 (= e!22244 e!22246)))

(declare-fun res!28724 () Bool)

(assert (=> b!33517 (=> res!28724 e!22246)))

(declare-fun lt!49231 () tuple2!3410)

(assert (=> b!33517 (= res!28724 (not (= (size!824 (buf!1152 (_2!1792 lt!49244))) (size!824 (buf!1152 (_2!1792 lt!49231))))))))

(assert (=> b!33517 e!22240))

(declare-fun res!28714 () Bool)

(assert (=> b!33517 (=> (not res!28714) (not e!22240))))

(assert (=> b!33517 (= res!28714 (= (size!824 (buf!1152 (_2!1792 lt!49231))) (size!824 (buf!1152 thiss!1379))))))

(declare-fun res!28716 () Bool)

(assert (=> start!6928 (=> (not res!28716) (not e!22247))))

(assert (=> start!6928 (= res!28716 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!824 srcBuffer!2))))))))

(assert (=> start!6928 e!22247))

(assert (=> start!6928 true))

(declare-fun array_inv!773 (array!1864) Bool)

(assert (=> start!6928 (array_inv!773 srcBuffer!2)))

(declare-fun e!22242 () Bool)

(declare-fun inv!12 (BitStream!1440) Bool)

(assert (=> start!6928 (and (inv!12 thiss!1379) e!22242)))

(declare-fun b!33518 () Bool)

(assert (=> b!33518 (= e!22242 (array_inv!773 (buf!1152 thiss!1379)))))

(declare-fun b!33519 () Bool)

(declare-fun e!22239 () Bool)

(assert (=> b!33519 (= e!22245 e!22239)))

(declare-fun res!28728 () Bool)

(assert (=> b!33519 (=> res!28728 e!22239)))

(assert (=> b!33519 (= res!28728 (not (isPrefixOf!0 thiss!1379 (_2!1792 lt!49244))))))

(declare-fun lt!49240 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33519 (validate_offset_bits!1 ((_ sign_extend 32) (size!824 (buf!1152 (_2!1792 lt!49244)))) ((_ sign_extend 32) (currentByte!2519 (_2!1792 lt!49244))) ((_ sign_extend 32) (currentBit!2514 (_2!1792 lt!49244))) lt!49240)))

(assert (=> b!33519 (= lt!49240 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49232 () Unit!2503)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1440 BitStream!1440 (_ BitVec 64) (_ BitVec 64)) Unit!2503)

(assert (=> b!33519 (= lt!49232 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1792 lt!49244) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1440 (_ BitVec 8) (_ BitVec 32)) tuple2!3410)

(assert (=> b!33519 (= lt!49244 (appendBitFromByte!0 thiss!1379 (select (arr!1299 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33520 () Bool)

(declare-fun res!28725 () Bool)

(assert (=> b!33520 (=> res!28725 e!22244)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33520 (= res!28725 (not (invariant!0 (currentBit!2514 (_2!1792 lt!49231)) (currentByte!2519 (_2!1792 lt!49231)) (size!824 (buf!1152 (_2!1792 lt!49231))))))))

(declare-fun b!33521 () Bool)

(declare-fun res!28723 () Bool)

(assert (=> b!33521 (=> res!28723 e!22244)))

(assert (=> b!33521 (= res!28723 (not (= (size!824 (buf!1152 thiss!1379)) (size!824 (buf!1152 (_2!1792 lt!49231))))))))

(declare-fun b!33522 () Bool)

(declare-fun res!28717 () Bool)

(declare-fun e!22243 () Bool)

(assert (=> b!33522 (=> res!28717 e!22243)))

(declare-fun lt!49239 () List!421)

(declare-fun length!147 (List!421) Int)

(assert (=> b!33522 (= res!28717 (<= (length!147 lt!49239) 0))))

(declare-fun b!33523 () Bool)

(declare-fun e!22241 () Bool)

(assert (=> b!33523 (= e!22239 e!22241)))

(declare-fun res!28719 () Bool)

(assert (=> b!33523 (=> res!28719 e!22241)))

(assert (=> b!33523 (= res!28719 (not (isPrefixOf!0 (_2!1792 lt!49244) (_2!1792 lt!49231))))))

(assert (=> b!33523 (isPrefixOf!0 thiss!1379 (_2!1792 lt!49231))))

(declare-fun lt!49235 () Unit!2503)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1440 BitStream!1440 BitStream!1440) Unit!2503)

(assert (=> b!33523 (= lt!49235 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1792 lt!49244) (_2!1792 lt!49231)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1440 array!1864 (_ BitVec 64) (_ BitVec 64)) tuple2!3410)

(assert (=> b!33523 (= lt!49231 (appendBitsMSBFirstLoop!0 (_2!1792 lt!49244) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!33523 e!22249))

(declare-fun res!28721 () Bool)

(assert (=> b!33523 (=> (not res!28721) (not e!22249))))

(assert (=> b!33523 (= res!28721 (validate_offset_bits!1 ((_ sign_extend 32) (size!824 (buf!1152 (_2!1792 lt!49244)))) ((_ sign_extend 32) (currentByte!2519 thiss!1379)) ((_ sign_extend 32) (currentBit!2514 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49234 () Unit!2503)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1440 array!1864 (_ BitVec 64)) Unit!2503)

(assert (=> b!33523 (= lt!49234 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1152 (_2!1792 lt!49244)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1440 BitStream!1440) tuple2!3412)

(assert (=> b!33523 (= lt!49242 (reader!0 thiss!1379 (_2!1792 lt!49244)))))

(declare-fun b!33524 () Bool)

(assert (=> b!33524 (= e!22243 true)))

(declare-fun lt!49243 () List!421)

(declare-fun tail!138 (List!421) List!421)

(assert (=> b!33524 (= lt!49243 (tail!138 lt!49239))))

(declare-fun lt!49245 () tuple2!3412)

(declare-fun lt!49230 () Unit!2503)

(declare-fun lt!49233 () tuple2!3412)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1440 BitStream!1440 BitStream!1440 BitStream!1440 (_ BitVec 64) List!421) Unit!2503)

(assert (=> b!33524 (= lt!49230 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1792 lt!49231) (_2!1792 lt!49231) (_1!1793 lt!49233) (_1!1793 lt!49245) (bvsub to!314 i!635) lt!49239))))

(declare-fun b!33525 () Bool)

(assert (=> b!33525 (= e!22246 e!22243)))

(declare-fun res!28727 () Bool)

(assert (=> b!33525 (=> res!28727 e!22243)))

(assert (=> b!33525 (= res!28727 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!33525 (= lt!49243 (bitStreamReadBitsIntoList!0 (_2!1792 lt!49231) (_1!1793 lt!49245) lt!49240))))

(assert (=> b!33525 (= lt!49239 (bitStreamReadBitsIntoList!0 (_2!1792 lt!49231) (_1!1793 lt!49233) (bvsub to!314 i!635)))))

(assert (=> b!33525 (validate_offset_bits!1 ((_ sign_extend 32) (size!824 (buf!1152 (_2!1792 lt!49231)))) ((_ sign_extend 32) (currentByte!2519 (_2!1792 lt!49244))) ((_ sign_extend 32) (currentBit!2514 (_2!1792 lt!49244))) lt!49240)))

(declare-fun lt!49236 () Unit!2503)

(assert (=> b!33525 (= lt!49236 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1792 lt!49244) (buf!1152 (_2!1792 lt!49231)) lt!49240))))

(assert (=> b!33525 (= lt!49245 (reader!0 (_2!1792 lt!49244) (_2!1792 lt!49231)))))

(assert (=> b!33525 (validate_offset_bits!1 ((_ sign_extend 32) (size!824 (buf!1152 (_2!1792 lt!49231)))) ((_ sign_extend 32) (currentByte!2519 thiss!1379)) ((_ sign_extend 32) (currentBit!2514 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49246 () Unit!2503)

(assert (=> b!33525 (= lt!49246 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1152 (_2!1792 lt!49231)) (bvsub to!314 i!635)))))

(assert (=> b!33525 (= lt!49233 (reader!0 thiss!1379 (_2!1792 lt!49231)))))

(declare-fun b!33526 () Bool)

(declare-fun res!28715 () Bool)

(assert (=> b!33526 (=> res!28715 e!22246)))

(assert (=> b!33526 (= res!28715 (not (invariant!0 (currentBit!2514 (_2!1792 lt!49244)) (currentByte!2519 (_2!1792 lt!49244)) (size!824 (buf!1152 (_2!1792 lt!49231))))))))

(declare-fun b!33527 () Bool)

(declare-fun res!28720 () Bool)

(assert (=> b!33527 (=> (not res!28720) (not e!22247))))

(assert (=> b!33527 (= res!28720 (validate_offset_bits!1 ((_ sign_extend 32) (size!824 (buf!1152 thiss!1379))) ((_ sign_extend 32) (currentByte!2519 thiss!1379)) ((_ sign_extend 32) (currentBit!2514 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33528 () Bool)

(declare-fun res!28718 () Bool)

(assert (=> b!33528 (=> res!28718 e!22246)))

(assert (=> b!33528 (= res!28718 (not (invariant!0 (currentBit!2514 (_2!1792 lt!49244)) (currentByte!2519 (_2!1792 lt!49244)) (size!824 (buf!1152 (_2!1792 lt!49244))))))))

(declare-fun b!33529 () Bool)

(assert (=> b!33529 (= e!22241 e!22244)))

(declare-fun res!28722 () Bool)

(assert (=> b!33529 (=> res!28722 e!22244)))

(assert (=> b!33529 (= res!28722 (not (= lt!49238 (bvsub (bvadd lt!49237 to!314) i!635))))))

(assert (=> b!33529 (= lt!49238 (bitIndex!0 (size!824 (buf!1152 (_2!1792 lt!49231))) (currentByte!2519 (_2!1792 lt!49231)) (currentBit!2514 (_2!1792 lt!49231))))))

(assert (= (and start!6928 res!28716) b!33527))

(assert (= (and b!33527 res!28720) b!33515))

(assert (= (and b!33515 (not res!28726)) b!33519))

(assert (= (and b!33519 (not res!28728)) b!33523))

(assert (= (and b!33523 res!28721) b!33516))

(assert (= (and b!33523 (not res!28719)) b!33529))

(assert (= (and b!33529 (not res!28722)) b!33520))

(assert (= (and b!33520 (not res!28725)) b!33521))

(assert (= (and b!33521 (not res!28723)) b!33517))

(assert (= (and b!33517 res!28714) b!33514))

(assert (= (and b!33517 (not res!28724)) b!33528))

(assert (= (and b!33528 (not res!28718)) b!33526))

(assert (= (and b!33526 (not res!28715)) b!33525))

(assert (= (and b!33525 (not res!28727)) b!33522))

(assert (= (and b!33522 (not res!28717)) b!33524))

(assert (= start!6928 b!33518))

(declare-fun m!49719 () Bool)

(assert (=> b!33520 m!49719))

(declare-fun m!49721 () Bool)

(assert (=> b!33523 m!49721))

(declare-fun m!49723 () Bool)

(assert (=> b!33523 m!49723))

(declare-fun m!49725 () Bool)

(assert (=> b!33523 m!49725))

(declare-fun m!49727 () Bool)

(assert (=> b!33523 m!49727))

(declare-fun m!49729 () Bool)

(assert (=> b!33523 m!49729))

(declare-fun m!49731 () Bool)

(assert (=> b!33523 m!49731))

(declare-fun m!49733 () Bool)

(assert (=> b!33523 m!49733))

(declare-fun m!49735 () Bool)

(assert (=> b!33518 m!49735))

(declare-fun m!49737 () Bool)

(assert (=> b!33515 m!49737))

(declare-fun m!49739 () Bool)

(assert (=> b!33515 m!49739))

(declare-fun m!49741 () Bool)

(assert (=> b!33515 m!49741))

(declare-fun m!49743 () Bool)

(assert (=> b!33529 m!49743))

(declare-fun m!49745 () Bool)

(assert (=> b!33525 m!49745))

(declare-fun m!49747 () Bool)

(assert (=> b!33525 m!49747))

(declare-fun m!49749 () Bool)

(assert (=> b!33525 m!49749))

(declare-fun m!49751 () Bool)

(assert (=> b!33525 m!49751))

(declare-fun m!49753 () Bool)

(assert (=> b!33525 m!49753))

(declare-fun m!49755 () Bool)

(assert (=> b!33525 m!49755))

(declare-fun m!49757 () Bool)

(assert (=> b!33525 m!49757))

(declare-fun m!49759 () Bool)

(assert (=> b!33525 m!49759))

(declare-fun m!49761 () Bool)

(assert (=> b!33524 m!49761))

(declare-fun m!49763 () Bool)

(assert (=> b!33524 m!49763))

(declare-fun m!49765 () Bool)

(assert (=> b!33519 m!49765))

(declare-fun m!49767 () Bool)

(assert (=> b!33519 m!49767))

(declare-fun m!49769 () Bool)

(assert (=> b!33519 m!49769))

(assert (=> b!33519 m!49767))

(declare-fun m!49771 () Bool)

(assert (=> b!33519 m!49771))

(declare-fun m!49773 () Bool)

(assert (=> b!33519 m!49773))

(declare-fun m!49775 () Bool)

(assert (=> start!6928 m!49775))

(declare-fun m!49777 () Bool)

(assert (=> start!6928 m!49777))

(declare-fun m!49779 () Bool)

(assert (=> b!33522 m!49779))

(declare-fun m!49781 () Bool)

(assert (=> b!33526 m!49781))

(declare-fun m!49783 () Bool)

(assert (=> b!33527 m!49783))

(declare-fun m!49785 () Bool)

(assert (=> b!33528 m!49785))

(declare-fun m!49787 () Bool)

(assert (=> b!33514 m!49787))

(declare-fun m!49789 () Bool)

(assert (=> b!33516 m!49789))

(assert (=> b!33516 m!49789))

(declare-fun m!49791 () Bool)

(assert (=> b!33516 m!49791))

(declare-fun m!49793 () Bool)

(assert (=> b!33516 m!49793))

(assert (=> b!33516 m!49793))

(declare-fun m!49795 () Bool)

(assert (=> b!33516 m!49795))

(check-sat (not b!33520) (not b!33526) (not b!33516) (not b!33522) (not b!33519) (not b!33518) (not b!33525) (not b!33529) (not b!33527) (not b!33514) (not b!33528) (not start!6928) (not b!33523) (not b!33515) (not b!33524))
