; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13390 () Bool)

(assert start!13390)

(declare-fun e!44845 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!109831 () (_ BitVec 64))

(declare-fun b!68584 () Bool)

(declare-datatypes ((array!2888 0))(
  ( (array!2889 (arr!1915 (Array (_ BitVec 32) (_ BitVec 8))) (size!1339 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2288 0))(
  ( (BitStream!2289 (buf!1720 array!2888) (currentByte!3416 (_ BitVec 32)) (currentBit!3411 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4611 0))(
  ( (Unit!4612) )
))
(declare-datatypes ((tuple2!6008 0))(
  ( (tuple2!6009 (_1!3115 Unit!4611) (_2!3115 BitStream!2288)) )
))
(declare-fun lt!109822 () tuple2!6008)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!68584 (= e!44845 (= lt!109831 (bvsub (bvsub (bvadd (bitIndex!0 (size!1339 (buf!1720 (_2!3115 lt!109822))) (currentByte!3416 (_2!3115 lt!109822)) (currentBit!3411 (_2!3115 lt!109822))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!68585 () Bool)

(declare-fun res!56707 () Bool)

(declare-fun e!44849 () Bool)

(assert (=> b!68585 (=> res!56707 e!44849)))

(declare-fun lt!109823 () tuple2!6008)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!68585 (= res!56707 (not (invariant!0 (currentBit!3411 (_2!3115 lt!109822)) (currentByte!3416 (_2!3115 lt!109822)) (size!1339 (buf!1720 (_2!3115 lt!109823))))))))

(declare-fun b!68586 () Bool)

(declare-fun res!56708 () Bool)

(declare-fun e!44841 () Bool)

(assert (=> b!68586 (=> res!56708 e!44841)))

(declare-fun thiss!1379 () BitStream!2288)

(assert (=> b!68586 (= res!56708 (not (= (size!1339 (buf!1720 thiss!1379)) (size!1339 (buf!1720 (_2!3115 lt!109823))))))))

(declare-fun b!68587 () Bool)

(declare-fun e!44846 () Bool)

(declare-fun e!44843 () Bool)

(assert (=> b!68587 (= e!44846 (not e!44843))))

(declare-fun res!56696 () Bool)

(assert (=> b!68587 (=> res!56696 e!44843)))

(assert (=> b!68587 (= res!56696 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2288 BitStream!2288) Bool)

(assert (=> b!68587 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!109826 () Unit!4611)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2288) Unit!4611)

(assert (=> b!68587 (= lt!109826 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!109818 () (_ BitVec 64))

(assert (=> b!68587 (= lt!109818 (bitIndex!0 (size!1339 (buf!1720 thiss!1379)) (currentByte!3416 thiss!1379) (currentBit!3411 thiss!1379)))))

(declare-fun b!68588 () Bool)

(declare-fun res!56706 () Bool)

(declare-fun e!44847 () Bool)

(assert (=> b!68588 (=> res!56706 e!44847)))

(declare-datatypes ((List!719 0))(
  ( (Nil!716) (Cons!715 (h!834 Bool) (t!1469 List!719)) )
))
(declare-fun lt!109824 () List!719)

(declare-fun length!347 (List!719) Int)

(assert (=> b!68588 (= res!56706 (<= (length!347 lt!109824) 0))))

(declare-fun b!68589 () Bool)

(declare-fun e!44844 () Bool)

(declare-fun e!44839 () Bool)

(assert (=> b!68589 (= e!44844 e!44839)))

(declare-fun res!56699 () Bool)

(assert (=> b!68589 (=> res!56699 e!44839)))

(assert (=> b!68589 (= res!56699 (not (isPrefixOf!0 (_2!3115 lt!109822) (_2!3115 lt!109823))))))

(assert (=> b!68589 (isPrefixOf!0 thiss!1379 (_2!3115 lt!109823))))

(declare-fun lt!109829 () Unit!4611)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2288 BitStream!2288 BitStream!2288) Unit!4611)

(assert (=> b!68589 (= lt!109829 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3115 lt!109822) (_2!3115 lt!109823)))))

(declare-fun srcBuffer!2 () array!2888)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2288 array!2888 (_ BitVec 64) (_ BitVec 64)) tuple2!6008)

(assert (=> b!68589 (= lt!109823 (appendBitsMSBFirstLoop!0 (_2!3115 lt!109822) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!44848 () Bool)

(assert (=> b!68589 e!44848))

(declare-fun res!56709 () Bool)

(assert (=> b!68589 (=> (not res!56709) (not e!44848))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68589 (= res!56709 (validate_offset_bits!1 ((_ sign_extend 32) (size!1339 (buf!1720 (_2!3115 lt!109822)))) ((_ sign_extend 32) (currentByte!3416 thiss!1379)) ((_ sign_extend 32) (currentBit!3411 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109832 () Unit!4611)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2288 array!2888 (_ BitVec 64)) Unit!4611)

(assert (=> b!68589 (= lt!109832 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1720 (_2!3115 lt!109822)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!6010 0))(
  ( (tuple2!6011 (_1!3116 BitStream!2288) (_2!3116 BitStream!2288)) )
))
(declare-fun lt!109825 () tuple2!6010)

(declare-fun reader!0 (BitStream!2288 BitStream!2288) tuple2!6010)

(assert (=> b!68589 (= lt!109825 (reader!0 thiss!1379 (_2!3115 lt!109822)))))

(declare-fun b!68590 () Bool)

(declare-fun e!44840 () Bool)

(declare-fun array_inv!1203 (array!2888) Bool)

(assert (=> b!68590 (= e!44840 (array_inv!1203 (buf!1720 thiss!1379)))))

(declare-fun b!68591 () Bool)

(assert (=> b!68591 (= e!44839 e!44841)))

(declare-fun res!56702 () Bool)

(assert (=> b!68591 (=> res!56702 e!44841)))

(assert (=> b!68591 (= res!56702 (not (= lt!109831 (bvsub (bvadd lt!109818 to!314) i!635))))))

(assert (=> b!68591 (= lt!109831 (bitIndex!0 (size!1339 (buf!1720 (_2!3115 lt!109823))) (currentByte!3416 (_2!3115 lt!109823)) (currentBit!3411 (_2!3115 lt!109823))))))

(declare-fun b!68592 () Bool)

(declare-fun head!538 (List!719) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2288 array!2888 (_ BitVec 64) (_ BitVec 64)) List!719)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2288 BitStream!2288 (_ BitVec 64)) List!719)

(assert (=> b!68592 (= e!44848 (= (head!538 (byteArrayBitContentToList!0 (_2!3115 lt!109822) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!538 (bitStreamReadBitsIntoList!0 (_2!3115 lt!109822) (_1!3116 lt!109825) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!68593 () Bool)

(declare-fun res!56700 () Bool)

(assert (=> b!68593 (=> (not res!56700) (not e!44846))))

(assert (=> b!68593 (= res!56700 (validate_offset_bits!1 ((_ sign_extend 32) (size!1339 (buf!1720 thiss!1379))) ((_ sign_extend 32) (currentByte!3416 thiss!1379)) ((_ sign_extend 32) (currentBit!3411 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!56703 () Bool)

(assert (=> start!13390 (=> (not res!56703) (not e!44846))))

(assert (=> start!13390 (= res!56703 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1339 srcBuffer!2))))))))

(assert (=> start!13390 e!44846))

(assert (=> start!13390 true))

(assert (=> start!13390 (array_inv!1203 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2288) Bool)

(assert (=> start!13390 (and (inv!12 thiss!1379) e!44840)))

(declare-fun b!68594 () Bool)

(declare-fun res!56698 () Bool)

(assert (=> b!68594 (=> res!56698 e!44849)))

(assert (=> b!68594 (= res!56698 (not (invariant!0 (currentBit!3411 (_2!3115 lt!109822)) (currentByte!3416 (_2!3115 lt!109822)) (size!1339 (buf!1720 (_2!3115 lt!109822))))))))

(declare-fun b!68595 () Bool)

(assert (=> b!68595 (= e!44843 e!44844)))

(declare-fun res!56705 () Bool)

(assert (=> b!68595 (=> res!56705 e!44844)))

(assert (=> b!68595 (= res!56705 (not (isPrefixOf!0 thiss!1379 (_2!3115 lt!109822))))))

(declare-fun lt!109830 () (_ BitVec 64))

(assert (=> b!68595 (validate_offset_bits!1 ((_ sign_extend 32) (size!1339 (buf!1720 (_2!3115 lt!109822)))) ((_ sign_extend 32) (currentByte!3416 (_2!3115 lt!109822))) ((_ sign_extend 32) (currentBit!3411 (_2!3115 lt!109822))) lt!109830)))

(assert (=> b!68595 (= lt!109830 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109821 () Unit!4611)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2288 BitStream!2288 (_ BitVec 64) (_ BitVec 64)) Unit!4611)

(assert (=> b!68595 (= lt!109821 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3115 lt!109822) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2288 (_ BitVec 8) (_ BitVec 32)) tuple2!6008)

(assert (=> b!68595 (= lt!109822 (appendBitFromByte!0 thiss!1379 (select (arr!1915 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!68596 () Bool)

(assert (=> b!68596 (= e!44847 true)))

(declare-fun lt!109819 () List!719)

(declare-fun tail!323 (List!719) List!719)

(assert (=> b!68596 (= lt!109819 (tail!323 lt!109824))))

(declare-fun lt!109834 () tuple2!6010)

(declare-fun lt!109828 () tuple2!6010)

(declare-fun lt!109820 () Unit!4611)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2288 BitStream!2288 BitStream!2288 BitStream!2288 (_ BitVec 64) List!719) Unit!4611)

(assert (=> b!68596 (= lt!109820 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3115 lt!109823) (_2!3115 lt!109823) (_1!3116 lt!109828) (_1!3116 lt!109834) (bvsub to!314 i!635) lt!109824))))

(declare-fun b!68597 () Bool)

(assert (=> b!68597 (= e!44849 e!44847)))

(declare-fun res!56697 () Bool)

(assert (=> b!68597 (=> res!56697 e!44847)))

(assert (=> b!68597 (= res!56697 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!68597 (= lt!109819 (bitStreamReadBitsIntoList!0 (_2!3115 lt!109823) (_1!3116 lt!109834) lt!109830))))

(assert (=> b!68597 (= lt!109824 (bitStreamReadBitsIntoList!0 (_2!3115 lt!109823) (_1!3116 lt!109828) (bvsub to!314 i!635)))))

(assert (=> b!68597 (validate_offset_bits!1 ((_ sign_extend 32) (size!1339 (buf!1720 (_2!3115 lt!109823)))) ((_ sign_extend 32) (currentByte!3416 (_2!3115 lt!109822))) ((_ sign_extend 32) (currentBit!3411 (_2!3115 lt!109822))) lt!109830)))

(declare-fun lt!109827 () Unit!4611)

(assert (=> b!68597 (= lt!109827 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3115 lt!109822) (buf!1720 (_2!3115 lt!109823)) lt!109830))))

(assert (=> b!68597 (= lt!109834 (reader!0 (_2!3115 lt!109822) (_2!3115 lt!109823)))))

(assert (=> b!68597 (validate_offset_bits!1 ((_ sign_extend 32) (size!1339 (buf!1720 (_2!3115 lt!109823)))) ((_ sign_extend 32) (currentByte!3416 thiss!1379)) ((_ sign_extend 32) (currentBit!3411 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!109833 () Unit!4611)

(assert (=> b!68597 (= lt!109833 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1720 (_2!3115 lt!109823)) (bvsub to!314 i!635)))))

(assert (=> b!68597 (= lt!109828 (reader!0 thiss!1379 (_2!3115 lt!109823)))))

(declare-fun b!68598 () Bool)

(assert (=> b!68598 (= e!44841 e!44849)))

(declare-fun res!56695 () Bool)

(assert (=> b!68598 (=> res!56695 e!44849)))

(assert (=> b!68598 (= res!56695 (not (= (size!1339 (buf!1720 (_2!3115 lt!109822))) (size!1339 (buf!1720 (_2!3115 lt!109823))))))))

(assert (=> b!68598 e!44845))

(declare-fun res!56701 () Bool)

(assert (=> b!68598 (=> (not res!56701) (not e!44845))))

(assert (=> b!68598 (= res!56701 (= (size!1339 (buf!1720 (_2!3115 lt!109823))) (size!1339 (buf!1720 thiss!1379))))))

(declare-fun b!68599 () Bool)

(declare-fun res!56704 () Bool)

(assert (=> b!68599 (=> res!56704 e!44841)))

(assert (=> b!68599 (= res!56704 (not (invariant!0 (currentBit!3411 (_2!3115 lt!109823)) (currentByte!3416 (_2!3115 lt!109823)) (size!1339 (buf!1720 (_2!3115 lt!109823))))))))

(assert (= (and start!13390 res!56703) b!68593))

(assert (= (and b!68593 res!56700) b!68587))

(assert (= (and b!68587 (not res!56696)) b!68595))

(assert (= (and b!68595 (not res!56705)) b!68589))

(assert (= (and b!68589 res!56709) b!68592))

(assert (= (and b!68589 (not res!56699)) b!68591))

(assert (= (and b!68591 (not res!56702)) b!68599))

(assert (= (and b!68599 (not res!56704)) b!68586))

(assert (= (and b!68586 (not res!56708)) b!68598))

(assert (= (and b!68598 res!56701) b!68584))

(assert (= (and b!68598 (not res!56695)) b!68594))

(assert (= (and b!68594 (not res!56698)) b!68585))

(assert (= (and b!68585 (not res!56707)) b!68597))

(assert (= (and b!68597 (not res!56697)) b!68588))

(assert (= (and b!68588 (not res!56706)) b!68596))

(assert (= start!13390 b!68590))

(declare-fun m!109525 () Bool)

(assert (=> b!68595 m!109525))

(declare-fun m!109527 () Bool)

(assert (=> b!68595 m!109527))

(declare-fun m!109529 () Bool)

(assert (=> b!68595 m!109529))

(declare-fun m!109531 () Bool)

(assert (=> b!68595 m!109531))

(assert (=> b!68595 m!109525))

(declare-fun m!109533 () Bool)

(assert (=> b!68595 m!109533))

(declare-fun m!109535 () Bool)

(assert (=> b!68589 m!109535))

(declare-fun m!109537 () Bool)

(assert (=> b!68589 m!109537))

(declare-fun m!109539 () Bool)

(assert (=> b!68589 m!109539))

(declare-fun m!109541 () Bool)

(assert (=> b!68589 m!109541))

(declare-fun m!109543 () Bool)

(assert (=> b!68589 m!109543))

(declare-fun m!109545 () Bool)

(assert (=> b!68589 m!109545))

(declare-fun m!109547 () Bool)

(assert (=> b!68589 m!109547))

(declare-fun m!109549 () Bool)

(assert (=> b!68590 m!109549))

(declare-fun m!109551 () Bool)

(assert (=> b!68588 m!109551))

(declare-fun m!109553 () Bool)

(assert (=> b!68599 m!109553))

(declare-fun m!109555 () Bool)

(assert (=> b!68593 m!109555))

(declare-fun m!109557 () Bool)

(assert (=> b!68587 m!109557))

(declare-fun m!109559 () Bool)

(assert (=> b!68587 m!109559))

(declare-fun m!109561 () Bool)

(assert (=> b!68587 m!109561))

(declare-fun m!109563 () Bool)

(assert (=> b!68594 m!109563))

(declare-fun m!109565 () Bool)

(assert (=> b!68591 m!109565))

(declare-fun m!109567 () Bool)

(assert (=> b!68584 m!109567))

(declare-fun m!109569 () Bool)

(assert (=> start!13390 m!109569))

(declare-fun m!109571 () Bool)

(assert (=> start!13390 m!109571))

(declare-fun m!109573 () Bool)

(assert (=> b!68592 m!109573))

(assert (=> b!68592 m!109573))

(declare-fun m!109575 () Bool)

(assert (=> b!68592 m!109575))

(declare-fun m!109577 () Bool)

(assert (=> b!68592 m!109577))

(assert (=> b!68592 m!109577))

(declare-fun m!109579 () Bool)

(assert (=> b!68592 m!109579))

(declare-fun m!109581 () Bool)

(assert (=> b!68585 m!109581))

(declare-fun m!109583 () Bool)

(assert (=> b!68596 m!109583))

(declare-fun m!109585 () Bool)

(assert (=> b!68596 m!109585))

(declare-fun m!109587 () Bool)

(assert (=> b!68597 m!109587))

(declare-fun m!109589 () Bool)

(assert (=> b!68597 m!109589))

(declare-fun m!109591 () Bool)

(assert (=> b!68597 m!109591))

(declare-fun m!109593 () Bool)

(assert (=> b!68597 m!109593))

(declare-fun m!109595 () Bool)

(assert (=> b!68597 m!109595))

(declare-fun m!109597 () Bool)

(assert (=> b!68597 m!109597))

(declare-fun m!109599 () Bool)

(assert (=> b!68597 m!109599))

(declare-fun m!109601 () Bool)

(assert (=> b!68597 m!109601))

(push 1)

(assert (not b!68599))

(assert (not b!68595))

(assert (not b!68588))

(assert (not b!68587))

(assert (not b!68593))

(assert (not b!68597))

(assert (not b!68585))

(assert (not b!68596))

(assert (not b!68590))

(assert (not b!68594))

(assert (not b!68589))

(assert (not b!68591))

(assert (not start!13390))

(assert (not b!68584))

(assert (not b!68592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

