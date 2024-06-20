; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13644 () Bool)

(assert start!13644)

(declare-fun b!69818 () Bool)

(declare-fun res!57643 () Bool)

(declare-fun e!45546 () Bool)

(assert (=> b!69818 (=> res!57643 e!45546)))

(declare-datatypes ((List!726 0))(
  ( (Nil!723) (Cons!722 (h!841 Bool) (t!1476 List!726)) )
))
(declare-fun lt!112254 () List!726)

(declare-fun length!354 (List!726) Int)

(assert (=> b!69818 (= res!57643 (<= (length!354 lt!112254) 0))))

(declare-fun b!69819 () Bool)

(declare-fun res!57657 () Bool)

(declare-fun e!45543 () Bool)

(assert (=> b!69819 (=> res!57657 e!45543)))

(declare-datatypes ((array!2908 0))(
  ( (array!2909 (arr!1934 (Array (_ BitVec 32) (_ BitVec 8))) (size!1352 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2302 0))(
  ( (BitStream!2303 (buf!1733 array!2908) (currentByte!3441 (_ BitVec 32)) (currentBit!3436 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4685 0))(
  ( (Unit!4686) )
))
(declare-datatypes ((tuple2!6084 0))(
  ( (tuple2!6085 (_1!3153 Unit!4685) (_2!3153 BitStream!2302)) )
))
(declare-fun lt!112253 () tuple2!6084)

(declare-fun lt!112258 () (_ BitVec 64))

(declare-fun lt!112256 () (_ BitVec 64))

(assert (=> b!69819 (= res!57657 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!112256) (bvsgt lt!112256 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!112258) (bvsge lt!112258 lt!112256)))))

(declare-fun b!69820 () Bool)

(declare-fun e!45547 () Bool)

(declare-fun e!45545 () Bool)

(assert (=> b!69820 (= e!45547 e!45545)))

(declare-fun res!57653 () Bool)

(assert (=> b!69820 (=> res!57653 e!45545)))

(declare-datatypes ((tuple2!6086 0))(
  ( (tuple2!6087 (_1!3154 BitStream!2302) (_2!3154 BitStream!2302)) )
))
(declare-fun lt!112261 () tuple2!6086)

(declare-fun lt!112272 () Bool)

(declare-fun bitAt!0 (array!2908 (_ BitVec 64)) Bool)

(assert (=> b!69820 (= res!57653 (not (= lt!112272 (bitAt!0 (buf!1733 (_1!3154 lt!112261)) lt!112258))))))

(declare-fun lt!112262 () tuple2!6086)

(assert (=> b!69820 (= lt!112272 (bitAt!0 (buf!1733 (_1!3154 lt!112262)) lt!112258))))

(declare-fun srcBuffer!2 () array!2908)

(declare-fun b!69821 () Bool)

(declare-fun lt!112266 () tuple2!6086)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!45541 () Bool)

(declare-fun head!545 (List!726) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2302 array!2908 (_ BitVec 64) (_ BitVec 64)) List!726)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2302 BitStream!2302 (_ BitVec 64)) List!726)

(assert (=> b!69821 (= e!45541 (= (head!545 (byteArrayBitContentToList!0 (_2!3153 lt!112253) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!545 (bitStreamReadBitsIntoList!0 (_2!3153 lt!112253) (_1!3154 lt!112266) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!69822 () Bool)

(declare-fun e!45540 () Bool)

(declare-fun e!45544 () Bool)

(assert (=> b!69822 (= e!45540 (not e!45544))))

(declare-fun res!57651 () Bool)

(assert (=> b!69822 (=> res!57651 e!45544)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!69822 (= res!57651 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!2302)

(declare-fun isPrefixOf!0 (BitStream!2302 BitStream!2302) Bool)

(assert (=> b!69822 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!112255 () Unit!4685)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2302) Unit!4685)

(assert (=> b!69822 (= lt!112255 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!69822 (= lt!112258 (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)))))

(declare-fun res!57641 () Bool)

(assert (=> start!13644 (=> (not res!57641) (not e!45540))))

(assert (=> start!13644 (= res!57641 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1352 srcBuffer!2))))))))

(assert (=> start!13644 e!45540))

(assert (=> start!13644 true))

(declare-fun array_inv!1210 (array!2908) Bool)

(assert (=> start!13644 (array_inv!1210 srcBuffer!2)))

(declare-fun e!45539 () Bool)

(declare-fun inv!12 (BitStream!2302) Bool)

(assert (=> start!13644 (and (inv!12 thiss!1379) e!45539)))

(declare-fun b!69823 () Bool)

(declare-fun e!45542 () Bool)

(declare-fun e!45550 () Bool)

(assert (=> b!69823 (= e!45542 e!45550)))

(declare-fun res!57652 () Bool)

(assert (=> b!69823 (=> res!57652 e!45550)))

(declare-fun lt!112264 () (_ BitVec 64))

(assert (=> b!69823 (= res!57652 (not (= lt!112264 (bvsub (bvadd lt!112258 to!314) i!635))))))

(declare-fun lt!112271 () tuple2!6084)

(assert (=> b!69823 (= lt!112264 (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112271))) (currentByte!3441 (_2!3153 lt!112271)) (currentBit!3436 (_2!3153 lt!112271))))))

(declare-fun b!69824 () Bool)

(assert (=> b!69824 (= e!45546 e!45547)))

(declare-fun res!57638 () Bool)

(assert (=> b!69824 (=> res!57638 e!45547)))

(declare-fun lt!112270 () List!726)

(declare-fun lt!112267 () List!726)

(assert (=> b!69824 (= res!57638 (not (= lt!112270 lt!112267)))))

(assert (=> b!69824 (= lt!112267 lt!112270)))

(declare-fun tail!330 (List!726) List!726)

(assert (=> b!69824 (= lt!112270 (tail!330 lt!112254))))

(declare-fun lt!112257 () Unit!4685)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2302 BitStream!2302 BitStream!2302 BitStream!2302 (_ BitVec 64) List!726) Unit!4685)

(assert (=> b!69824 (= lt!112257 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3153 lt!112271) (_2!3153 lt!112271) (_1!3154 lt!112262) (_1!3154 lt!112261) (bvsub to!314 i!635) lt!112254))))

(declare-fun b!69825 () Bool)

(declare-fun res!57644 () Bool)

(declare-fun e!45549 () Bool)

(assert (=> b!69825 (=> res!57644 e!45549)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!69825 (= res!57644 (not (invariant!0 (currentBit!3436 (_2!3153 lt!112253)) (currentByte!3441 (_2!3153 lt!112253)) (size!1352 (buf!1733 (_2!3153 lt!112271))))))))

(declare-fun b!69826 () Bool)

(declare-fun res!57640 () Bool)

(assert (=> b!69826 (=> res!57640 e!45550)))

(assert (=> b!69826 (= res!57640 (not (invariant!0 (currentBit!3436 (_2!3153 lt!112271)) (currentByte!3441 (_2!3153 lt!112271)) (size!1352 (buf!1733 (_2!3153 lt!112271))))))))

(declare-fun b!69827 () Bool)

(declare-fun res!57655 () Bool)

(assert (=> b!69827 (=> res!57655 e!45543)))

(declare-fun lt!112265 () Bool)

(assert (=> b!69827 (= res!57655 (not (= (bitAt!0 (buf!1733 (_2!3153 lt!112253)) lt!112258) lt!112265)))))

(declare-fun b!69828 () Bool)

(assert (=> b!69828 (= e!45550 e!45549)))

(declare-fun res!57645 () Bool)

(assert (=> b!69828 (=> res!57645 e!45549)))

(assert (=> b!69828 (= res!57645 (not (= (size!1352 (buf!1733 (_2!3153 lt!112253))) (size!1352 (buf!1733 (_2!3153 lt!112271))))))))

(assert (=> b!69828 (= lt!112264 (bvsub (bvsub (bvadd lt!112256 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!69828 (= lt!112256 (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112253))) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253))))))

(assert (=> b!69828 (= (size!1352 (buf!1733 (_2!3153 lt!112271))) (size!1352 (buf!1733 thiss!1379)))))

(declare-fun b!69829 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2908 array!2908 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69829 (= e!45543 (arrayBitRangesEq!0 (buf!1733 (_2!3153 lt!112253)) (buf!1733 (_2!3153 lt!112271)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!112256))))

(declare-fun b!69830 () Bool)

(declare-fun e!45548 () Bool)

(assert (=> b!69830 (= e!45544 e!45548)))

(declare-fun res!57648 () Bool)

(assert (=> b!69830 (=> res!57648 e!45548)))

(assert (=> b!69830 (= res!57648 (not (isPrefixOf!0 thiss!1379 (_2!3153 lt!112253))))))

(declare-fun lt!112260 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69830 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253))) lt!112260)))

(assert (=> b!69830 (= lt!112260 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!112268 () Unit!4685)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2302 BitStream!2302 (_ BitVec 64) (_ BitVec 64)) Unit!4685)

(assert (=> b!69830 (= lt!112268 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3153 lt!112253) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2302 (_ BitVec 8) (_ BitVec 32)) tuple2!6084)

(assert (=> b!69830 (= lt!112253 (appendBitFromByte!0 thiss!1379 (select (arr!1934 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!69831 () Bool)

(assert (=> b!69831 (= e!45539 (array_inv!1210 (buf!1733 thiss!1379)))))

(declare-fun b!69832 () Bool)

(assert (=> b!69832 (= e!45549 e!45546)))

(declare-fun res!57654 () Bool)

(assert (=> b!69832 (=> res!57654 e!45546)))

(assert (=> b!69832 (= res!57654 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!69832 (= lt!112267 (bitStreamReadBitsIntoList!0 (_2!3153 lt!112271) (_1!3154 lt!112261) lt!112260))))

(assert (=> b!69832 (= lt!112254 (bitStreamReadBitsIntoList!0 (_2!3153 lt!112271) (_1!3154 lt!112262) (bvsub to!314 i!635)))))

(assert (=> b!69832 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112271)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253))) lt!112260)))

(declare-fun lt!112263 () Unit!4685)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2302 array!2908 (_ BitVec 64)) Unit!4685)

(assert (=> b!69832 (= lt!112263 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3153 lt!112253) (buf!1733 (_2!3153 lt!112271)) lt!112260))))

(declare-fun reader!0 (BitStream!2302 BitStream!2302) tuple2!6086)

(assert (=> b!69832 (= lt!112261 (reader!0 (_2!3153 lt!112253) (_2!3153 lt!112271)))))

(assert (=> b!69832 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112271)))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!112269 () Unit!4685)

(assert (=> b!69832 (= lt!112269 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1733 (_2!3153 lt!112271)) (bvsub to!314 i!635)))))

(assert (=> b!69832 (= lt!112262 (reader!0 thiss!1379 (_2!3153 lt!112271)))))

(declare-fun b!69833 () Bool)

(declare-fun res!57642 () Bool)

(assert (=> b!69833 (=> res!57642 e!45545)))

(assert (=> b!69833 (= res!57642 (not (= (head!545 lt!112254) lt!112272)))))

(declare-fun b!69834 () Bool)

(assert (=> b!69834 (= e!45545 e!45543)))

(declare-fun res!57647 () Bool)

(assert (=> b!69834 (=> res!57647 e!45543)))

(assert (=> b!69834 (= res!57647 (not (= (head!545 (byteArrayBitContentToList!0 (_2!3153 lt!112271) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!112265)))))

(assert (=> b!69834 (= lt!112265 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!69835 () Bool)

(assert (=> b!69835 (= e!45548 e!45542)))

(declare-fun res!57646 () Bool)

(assert (=> b!69835 (=> res!57646 e!45542)))

(assert (=> b!69835 (= res!57646 (not (isPrefixOf!0 (_2!3153 lt!112253) (_2!3153 lt!112271))))))

(assert (=> b!69835 (isPrefixOf!0 thiss!1379 (_2!3153 lt!112271))))

(declare-fun lt!112259 () Unit!4685)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2302 BitStream!2302 BitStream!2302) Unit!4685)

(assert (=> b!69835 (= lt!112259 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3153 lt!112253) (_2!3153 lt!112271)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2302 array!2908 (_ BitVec 64) (_ BitVec 64)) tuple2!6084)

(assert (=> b!69835 (= lt!112271 (appendBitsMSBFirstLoop!0 (_2!3153 lt!112253) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!69835 e!45541))

(declare-fun res!57650 () Bool)

(assert (=> b!69835 (=> (not res!57650) (not e!45541))))

(assert (=> b!69835 (= res!57650 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!112273 () Unit!4685)

(assert (=> b!69835 (= lt!112273 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1733 (_2!3153 lt!112253)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!69835 (= lt!112266 (reader!0 thiss!1379 (_2!3153 lt!112253)))))

(declare-fun b!69836 () Bool)

(declare-fun res!57649 () Bool)

(assert (=> b!69836 (=> (not res!57649) (not e!45540))))

(assert (=> b!69836 (= res!57649 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 thiss!1379))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!69837 () Bool)

(declare-fun res!57639 () Bool)

(assert (=> b!69837 (=> res!57639 e!45549)))

(assert (=> b!69837 (= res!57639 (not (invariant!0 (currentBit!3436 (_2!3153 lt!112253)) (currentByte!3441 (_2!3153 lt!112253)) (size!1352 (buf!1733 (_2!3153 lt!112253))))))))

(declare-fun b!69838 () Bool)

(declare-fun res!57656 () Bool)

(assert (=> b!69838 (=> res!57656 e!45550)))

(assert (=> b!69838 (= res!57656 (not (= (size!1352 (buf!1733 thiss!1379)) (size!1352 (buf!1733 (_2!3153 lt!112271))))))))

(assert (= (and start!13644 res!57641) b!69836))

(assert (= (and b!69836 res!57649) b!69822))

(assert (= (and b!69822 (not res!57651)) b!69830))

(assert (= (and b!69830 (not res!57648)) b!69835))

(assert (= (and b!69835 res!57650) b!69821))

(assert (= (and b!69835 (not res!57646)) b!69823))

(assert (= (and b!69823 (not res!57652)) b!69826))

(assert (= (and b!69826 (not res!57640)) b!69838))

(assert (= (and b!69838 (not res!57656)) b!69828))

(assert (= (and b!69828 (not res!57645)) b!69837))

(assert (= (and b!69837 (not res!57639)) b!69825))

(assert (= (and b!69825 (not res!57644)) b!69832))

(assert (= (and b!69832 (not res!57654)) b!69818))

(assert (= (and b!69818 (not res!57643)) b!69824))

(assert (= (and b!69824 (not res!57638)) b!69820))

(assert (= (and b!69820 (not res!57653)) b!69833))

(assert (= (and b!69833 (not res!57642)) b!69834))

(assert (= (and b!69834 (not res!57647)) b!69827))

(assert (= (and b!69827 (not res!57655)) b!69819))

(assert (= (and b!69819 (not res!57657)) b!69829))

(assert (= start!13644 b!69831))

(declare-fun m!111751 () Bool)

(assert (=> b!69825 m!111751))

(declare-fun m!111753 () Bool)

(assert (=> b!69822 m!111753))

(declare-fun m!111755 () Bool)

(assert (=> b!69822 m!111755))

(declare-fun m!111757 () Bool)

(assert (=> b!69822 m!111757))

(declare-fun m!111759 () Bool)

(assert (=> b!69828 m!111759))

(declare-fun m!111761 () Bool)

(assert (=> b!69820 m!111761))

(declare-fun m!111763 () Bool)

(assert (=> b!69820 m!111763))

(declare-fun m!111765 () Bool)

(assert (=> b!69834 m!111765))

(assert (=> b!69834 m!111765))

(declare-fun m!111767 () Bool)

(assert (=> b!69834 m!111767))

(declare-fun m!111769 () Bool)

(assert (=> b!69834 m!111769))

(declare-fun m!111771 () Bool)

(assert (=> b!69832 m!111771))

(declare-fun m!111773 () Bool)

(assert (=> b!69832 m!111773))

(declare-fun m!111775 () Bool)

(assert (=> b!69832 m!111775))

(declare-fun m!111777 () Bool)

(assert (=> b!69832 m!111777))

(declare-fun m!111779 () Bool)

(assert (=> b!69832 m!111779))

(declare-fun m!111781 () Bool)

(assert (=> b!69832 m!111781))

(declare-fun m!111783 () Bool)

(assert (=> b!69832 m!111783))

(declare-fun m!111785 () Bool)

(assert (=> b!69832 m!111785))

(declare-fun m!111787 () Bool)

(assert (=> b!69833 m!111787))

(declare-fun m!111789 () Bool)

(assert (=> b!69818 m!111789))

(declare-fun m!111791 () Bool)

(assert (=> b!69837 m!111791))

(declare-fun m!111793 () Bool)

(assert (=> b!69829 m!111793))

(declare-fun m!111795 () Bool)

(assert (=> b!69826 m!111795))

(declare-fun m!111797 () Bool)

(assert (=> b!69824 m!111797))

(declare-fun m!111799 () Bool)

(assert (=> b!69824 m!111799))

(declare-fun m!111801 () Bool)

(assert (=> b!69830 m!111801))

(declare-fun m!111803 () Bool)

(assert (=> b!69830 m!111803))

(declare-fun m!111805 () Bool)

(assert (=> b!69830 m!111805))

(assert (=> b!69830 m!111801))

(declare-fun m!111807 () Bool)

(assert (=> b!69830 m!111807))

(declare-fun m!111809 () Bool)

(assert (=> b!69830 m!111809))

(declare-fun m!111811 () Bool)

(assert (=> b!69821 m!111811))

(assert (=> b!69821 m!111811))

(declare-fun m!111813 () Bool)

(assert (=> b!69821 m!111813))

(declare-fun m!111815 () Bool)

(assert (=> b!69821 m!111815))

(assert (=> b!69821 m!111815))

(declare-fun m!111817 () Bool)

(assert (=> b!69821 m!111817))

(declare-fun m!111819 () Bool)

(assert (=> b!69836 m!111819))

(declare-fun m!111821 () Bool)

(assert (=> b!69823 m!111821))

(declare-fun m!111823 () Bool)

(assert (=> b!69827 m!111823))

(declare-fun m!111825 () Bool)

(assert (=> b!69831 m!111825))

(declare-fun m!111827 () Bool)

(assert (=> b!69835 m!111827))

(declare-fun m!111829 () Bool)

(assert (=> b!69835 m!111829))

(declare-fun m!111831 () Bool)

(assert (=> b!69835 m!111831))

(declare-fun m!111833 () Bool)

(assert (=> b!69835 m!111833))

(declare-fun m!111835 () Bool)

(assert (=> b!69835 m!111835))

(declare-fun m!111837 () Bool)

(assert (=> b!69835 m!111837))

(declare-fun m!111839 () Bool)

(assert (=> b!69835 m!111839))

(declare-fun m!111841 () Bool)

(assert (=> start!13644 m!111841))

(declare-fun m!111843 () Bool)

(assert (=> start!13644 m!111843))

(push 1)

(assert (not b!69818))

(assert (not b!69826))

(assert (not b!69827))

(assert (not b!69829))

(assert (not b!69820))

(assert (not start!13644))

(assert (not b!69833))

(assert (not b!69835))

(assert (not b!69822))

(assert (not b!69830))

(assert (not b!69837))

(assert (not b!69836))

(assert (not b!69821))

(assert (not b!69824))

(assert (not b!69823))

(assert (not b!69831))

(assert (not b!69834))

(assert (not b!69832))

(assert (not b!69825))

(assert (not b!69828))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!22402 () Bool)

(assert (=> d!22402 (= (bitAt!0 (buf!1733 (_2!3153 lt!112253)) lt!112258) (not (= (bvand ((_ sign_extend 24) (select (arr!1934 (buf!1733 (_2!3153 lt!112253))) ((_ extract 31 0) (bvsdiv lt!112258 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!112258 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5384 () Bool)

(assert (= bs!5384 d!22402))

(declare-fun m!112067 () Bool)

(assert (=> bs!5384 m!112067))

(declare-fun m!112069 () Bool)

(assert (=> bs!5384 m!112069))

(assert (=> b!69827 d!22402))

(declare-fun d!22404 () Bool)

(assert (=> d!22404 (= (invariant!0 (currentBit!3436 (_2!3153 lt!112271)) (currentByte!3441 (_2!3153 lt!112271)) (size!1352 (buf!1733 (_2!3153 lt!112271)))) (and (bvsge (currentBit!3436 (_2!3153 lt!112271)) #b00000000000000000000000000000000) (bvslt (currentBit!3436 (_2!3153 lt!112271)) #b00000000000000000000000000001000) (bvsge (currentByte!3441 (_2!3153 lt!112271)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3441 (_2!3153 lt!112271)) (size!1352 (buf!1733 (_2!3153 lt!112271)))) (and (= (currentBit!3436 (_2!3153 lt!112271)) #b00000000000000000000000000000000) (= (currentByte!3441 (_2!3153 lt!112271)) (size!1352 (buf!1733 (_2!3153 lt!112271))))))))))

(assert (=> b!69826 d!22404))

(declare-fun d!22406 () Bool)

(assert (=> d!22406 (= (invariant!0 (currentBit!3436 (_2!3153 lt!112253)) (currentByte!3441 (_2!3153 lt!112253)) (size!1352 (buf!1733 (_2!3153 lt!112253)))) (and (bvsge (currentBit!3436 (_2!3153 lt!112253)) #b00000000000000000000000000000000) (bvslt (currentBit!3436 (_2!3153 lt!112253)) #b00000000000000000000000000001000) (bvsge (currentByte!3441 (_2!3153 lt!112253)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3441 (_2!3153 lt!112253)) (size!1352 (buf!1733 (_2!3153 lt!112253)))) (and (= (currentBit!3436 (_2!3153 lt!112253)) #b00000000000000000000000000000000) (= (currentByte!3441 (_2!3153 lt!112253)) (size!1352 (buf!1733 (_2!3153 lt!112253))))))))))

(assert (=> b!69837 d!22406))

(declare-fun d!22408 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!22408 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 thiss!1379))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1352 (buf!1733 thiss!1379))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5385 () Bool)

(assert (= bs!5385 d!22408))

(declare-fun m!112071 () Bool)

(assert (=> bs!5385 m!112071))

(assert (=> b!69836 d!22408))

(declare-fun d!22410 () Bool)

(assert (=> d!22410 (= (invariant!0 (currentBit!3436 (_2!3153 lt!112253)) (currentByte!3441 (_2!3153 lt!112253)) (size!1352 (buf!1733 (_2!3153 lt!112271)))) (and (bvsge (currentBit!3436 (_2!3153 lt!112253)) #b00000000000000000000000000000000) (bvslt (currentBit!3436 (_2!3153 lt!112253)) #b00000000000000000000000000001000) (bvsge (currentByte!3441 (_2!3153 lt!112253)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3441 (_2!3153 lt!112253)) (size!1352 (buf!1733 (_2!3153 lt!112271)))) (and (= (currentBit!3436 (_2!3153 lt!112253)) #b00000000000000000000000000000000) (= (currentByte!3441 (_2!3153 lt!112253)) (size!1352 (buf!1733 (_2!3153 lt!112271))))))))))

(assert (=> b!69825 d!22410))

(declare-fun d!22412 () Bool)

(declare-fun size!1355 (List!726) Int)

(assert (=> d!22412 (= (length!354 lt!112254) (size!1355 lt!112254))))

(declare-fun bs!5386 () Bool)

(assert (= bs!5386 d!22412))

(declare-fun m!112073 () Bool)

(assert (=> bs!5386 m!112073))

(assert (=> b!69818 d!22412))

(declare-fun b!70003 () Bool)

(declare-fun e!45663 () Bool)

(declare-fun call!901 () Bool)

(assert (=> b!70003 (= e!45663 call!901)))

(declare-fun b!70004 () Bool)

(declare-fun res!57807 () Bool)

(declare-fun lt!112470 () (_ BitVec 32))

(assert (=> b!70004 (= res!57807 (= lt!112470 #b00000000000000000000000000000000))))

(assert (=> b!70004 (=> res!57807 e!45663)))

(declare-fun e!45664 () Bool)

(assert (=> b!70004 (= e!45664 e!45663)))

(declare-fun e!45662 () Bool)

(declare-fun b!70005 () Bool)

(declare-datatypes ((tuple4!34 0))(
  ( (tuple4!35 (_1!3163 (_ BitVec 32)) (_2!3163 (_ BitVec 32)) (_3!112 (_ BitVec 32)) (_4!17 (_ BitVec 32))) )
))
(declare-fun lt!112471 () tuple4!34)

(declare-fun arrayRangesEq!18 (array!2908 array!2908 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!70005 (= e!45662 (arrayRangesEq!18 (buf!1733 (_2!3153 lt!112253)) (buf!1733 (_2!3153 lt!112271)) (_1!3163 lt!112471) (_2!3163 lt!112471)))))

(declare-fun b!70006 () Bool)

(declare-fun e!45665 () Bool)

(assert (=> b!70006 (= e!45665 call!901)))

(declare-fun b!70007 () Bool)

(declare-fun e!45661 () Bool)

(declare-fun e!45660 () Bool)

(assert (=> b!70007 (= e!45661 e!45660)))

(declare-fun res!57806 () Bool)

(assert (=> b!70007 (=> (not res!57806) (not e!45660))))

(assert (=> b!70007 (= res!57806 e!45662)))

(declare-fun res!57809 () Bool)

(assert (=> b!70007 (=> res!57809 e!45662)))

(assert (=> b!70007 (= res!57809 (bvsge (_1!3163 lt!112471) (_2!3163 lt!112471)))))

(assert (=> b!70007 (= lt!112470 ((_ extract 31 0) (bvsrem lt!112256 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!112469 () (_ BitVec 32))

(assert (=> b!70007 (= lt!112469 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!34)

(assert (=> b!70007 (= lt!112471 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!112256))))

(declare-fun b!70008 () Bool)

(assert (=> b!70008 (= e!45660 e!45665)))

(declare-fun c!5196 () Bool)

(assert (=> b!70008 (= c!5196 (= (_3!112 lt!112471) (_4!17 lt!112471)))))

(declare-fun d!22414 () Bool)

(declare-fun res!57810 () Bool)

(assert (=> d!22414 (=> res!57810 e!45661)))

(assert (=> d!22414 (= res!57810 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!112256))))

(assert (=> d!22414 (= (arrayBitRangesEq!0 (buf!1733 (_2!3153 lt!112253)) (buf!1733 (_2!3153 lt!112271)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!112256) e!45661)))

(declare-fun b!70009 () Bool)

(assert (=> b!70009 (= e!45665 e!45664)))

(declare-fun res!57808 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!70009 (= res!57808 (byteRangesEq!0 (select (arr!1934 (buf!1733 (_2!3153 lt!112253))) (_3!112 lt!112471)) (select (arr!1934 (buf!1733 (_2!3153 lt!112271))) (_3!112 lt!112471)) lt!112469 #b00000000000000000000000000001000))))

(assert (=> b!70009 (=> (not res!57808) (not e!45664))))

(declare-fun bm!898 () Bool)

(assert (=> bm!898 (= call!901 (byteRangesEq!0 (ite c!5196 (select (arr!1934 (buf!1733 (_2!3153 lt!112253))) (_3!112 lt!112471)) (select (arr!1934 (buf!1733 (_2!3153 lt!112253))) (_4!17 lt!112471))) (ite c!5196 (select (arr!1934 (buf!1733 (_2!3153 lt!112271))) (_3!112 lt!112471)) (select (arr!1934 (buf!1733 (_2!3153 lt!112271))) (_4!17 lt!112471))) (ite c!5196 lt!112469 #b00000000000000000000000000000000) lt!112470))))

(assert (= (and d!22414 (not res!57810)) b!70007))

(assert (= (and b!70007 (not res!57809)) b!70005))

(assert (= (and b!70007 res!57806) b!70008))

(assert (= (and b!70008 c!5196) b!70006))

(assert (= (and b!70008 (not c!5196)) b!70009))

(assert (= (and b!70009 res!57808) b!70004))

(assert (= (and b!70004 (not res!57807)) b!70003))

(assert (= (or b!70006 b!70003) bm!898))

(declare-fun m!112075 () Bool)

(assert (=> b!70005 m!112075))

(declare-fun m!112077 () Bool)

(assert (=> b!70007 m!112077))

(declare-fun m!112079 () Bool)

(assert (=> b!70009 m!112079))

(declare-fun m!112081 () Bool)

(assert (=> b!70009 m!112081))

(assert (=> b!70009 m!112079))

(assert (=> b!70009 m!112081))

(declare-fun m!112083 () Bool)

(assert (=> b!70009 m!112083))

(declare-fun m!112085 () Bool)

(assert (=> bm!898 m!112085))

(assert (=> bm!898 m!112081))

(declare-fun m!112087 () Bool)

(assert (=> bm!898 m!112087))

(declare-fun m!112089 () Bool)

(assert (=> bm!898 m!112089))

(assert (=> bm!898 m!112079))

(assert (=> b!69829 d!22414))

(declare-fun d!22416 () Bool)

(declare-fun e!45668 () Bool)

(assert (=> d!22416 e!45668))

(declare-fun res!57816 () Bool)

(assert (=> d!22416 (=> (not res!57816) (not e!45668))))

(declare-fun lt!112484 () (_ BitVec 64))

(declare-fun lt!112485 () (_ BitVec 64))

(declare-fun lt!112489 () (_ BitVec 64))

(assert (=> d!22416 (= res!57816 (= lt!112489 (bvsub lt!112485 lt!112484)))))

(assert (=> d!22416 (or (= (bvand lt!112485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112484 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112485 lt!112484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22416 (= lt!112484 (remainingBits!0 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253)))))))

(declare-fun lt!112486 () (_ BitVec 64))

(declare-fun lt!112488 () (_ BitVec 64))

(assert (=> d!22416 (= lt!112485 (bvmul lt!112486 lt!112488))))

(assert (=> d!22416 (or (= lt!112486 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!112488 (bvsdiv (bvmul lt!112486 lt!112488) lt!112486)))))

(assert (=> d!22416 (= lt!112488 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22416 (= lt!112486 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))))))

(assert (=> d!22416 (= lt!112489 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253)))))))

(assert (=> d!22416 (invariant!0 (currentBit!3436 (_2!3153 lt!112253)) (currentByte!3441 (_2!3153 lt!112253)) (size!1352 (buf!1733 (_2!3153 lt!112253))))))

(assert (=> d!22416 (= (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112253))) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253))) lt!112489)))

(declare-fun b!70014 () Bool)

(declare-fun res!57815 () Bool)

(assert (=> b!70014 (=> (not res!57815) (not e!45668))))

(assert (=> b!70014 (= res!57815 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!112489))))

(declare-fun b!70015 () Bool)

(declare-fun lt!112487 () (_ BitVec 64))

(assert (=> b!70015 (= e!45668 (bvsle lt!112489 (bvmul lt!112487 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70015 (or (= lt!112487 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!112487 #b0000000000000000000000000000000000000000000000000000000000001000) lt!112487)))))

(assert (=> b!70015 (= lt!112487 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))))))

(assert (= (and d!22416 res!57816) b!70014))

(assert (= (and b!70014 res!57815) b!70015))

(declare-fun m!112091 () Bool)

(assert (=> d!22416 m!112091))

(assert (=> d!22416 m!111791))

(assert (=> b!69828 d!22416))

(declare-fun d!22418 () Bool)

(assert (=> d!22418 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112271)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253))) lt!112260) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112271)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253)))) lt!112260))))

(declare-fun bs!5387 () Bool)

(assert (= bs!5387 d!22418))

(declare-fun m!112093 () Bool)

(assert (=> bs!5387 m!112093))

(assert (=> b!69832 d!22418))

(declare-fun d!22420 () Bool)

(assert (=> d!22420 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112271)))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112271)))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5388 () Bool)

(assert (= bs!5388 d!22420))

(declare-fun m!112095 () Bool)

(assert (=> bs!5388 m!112095))

(assert (=> b!69832 d!22420))

(declare-fun d!22422 () Bool)

(assert (=> d!22422 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112271)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253))) lt!112260)))

(declare-fun lt!112492 () Unit!4685)

(declare-fun choose!9 (BitStream!2302 array!2908 (_ BitVec 64) BitStream!2302) Unit!4685)

(assert (=> d!22422 (= lt!112492 (choose!9 (_2!3153 lt!112253) (buf!1733 (_2!3153 lt!112271)) lt!112260 (BitStream!2303 (buf!1733 (_2!3153 lt!112271)) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253)))))))

(assert (=> d!22422 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3153 lt!112253) (buf!1733 (_2!3153 lt!112271)) lt!112260) lt!112492)))

(declare-fun bs!5389 () Bool)

(assert (= bs!5389 d!22422))

(assert (=> bs!5389 m!111775))

(declare-fun m!112097 () Bool)

(assert (=> bs!5389 m!112097))

(assert (=> b!69832 d!22422))

(declare-fun d!22426 () Bool)

(assert (=> d!22426 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112271)))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!112493 () Unit!4685)

(assert (=> d!22426 (= lt!112493 (choose!9 thiss!1379 (buf!1733 (_2!3153 lt!112271)) (bvsub to!314 i!635) (BitStream!2303 (buf!1733 (_2!3153 lt!112271)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379))))))

(assert (=> d!22426 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1733 (_2!3153 lt!112271)) (bvsub to!314 i!635)) lt!112493)))

(declare-fun bs!5390 () Bool)

(assert (= bs!5390 d!22426))

(assert (=> bs!5390 m!111781))

(declare-fun m!112099 () Bool)

(assert (=> bs!5390 m!112099))

(assert (=> b!69832 d!22426))

(declare-fun d!22428 () Bool)

(declare-fun e!45682 () Bool)

(assert (=> d!22428 e!45682))

(declare-fun res!57836 () Bool)

(assert (=> d!22428 (=> (not res!57836) (not e!45682))))

(declare-fun lt!112551 () tuple2!6086)

(assert (=> d!22428 (= res!57836 (isPrefixOf!0 (_1!3154 lt!112551) (_2!3154 lt!112551)))))

(declare-fun lt!112544 () BitStream!2302)

(assert (=> d!22428 (= lt!112551 (tuple2!6087 lt!112544 (_2!3153 lt!112271)))))

(declare-fun lt!112540 () Unit!4685)

(declare-fun lt!112556 () Unit!4685)

(assert (=> d!22428 (= lt!112540 lt!112556)))

(assert (=> d!22428 (isPrefixOf!0 lt!112544 (_2!3153 lt!112271))))

(assert (=> d!22428 (= lt!112556 (lemmaIsPrefixTransitive!0 lt!112544 (_2!3153 lt!112271) (_2!3153 lt!112271)))))

(declare-fun lt!112554 () Unit!4685)

(declare-fun lt!112550 () Unit!4685)

(assert (=> d!22428 (= lt!112554 lt!112550)))

(assert (=> d!22428 (isPrefixOf!0 lt!112544 (_2!3153 lt!112271))))

(assert (=> d!22428 (= lt!112550 (lemmaIsPrefixTransitive!0 lt!112544 thiss!1379 (_2!3153 lt!112271)))))

(declare-fun lt!112541 () Unit!4685)

(declare-fun e!45683 () Unit!4685)

(assert (=> d!22428 (= lt!112541 e!45683)))

(declare-fun c!5199 () Bool)

(assert (=> d!22428 (= c!5199 (not (= (size!1352 (buf!1733 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!112543 () Unit!4685)

(declare-fun lt!112549 () Unit!4685)

(assert (=> d!22428 (= lt!112543 lt!112549)))

(assert (=> d!22428 (isPrefixOf!0 (_2!3153 lt!112271) (_2!3153 lt!112271))))

(assert (=> d!22428 (= lt!112549 (lemmaIsPrefixRefl!0 (_2!3153 lt!112271)))))

(declare-fun lt!112552 () Unit!4685)

(declare-fun lt!112542 () Unit!4685)

(assert (=> d!22428 (= lt!112552 lt!112542)))

(assert (=> d!22428 (= lt!112542 (lemmaIsPrefixRefl!0 (_2!3153 lt!112271)))))

(declare-fun lt!112545 () Unit!4685)

(declare-fun lt!112538 () Unit!4685)

(assert (=> d!22428 (= lt!112545 lt!112538)))

(assert (=> d!22428 (isPrefixOf!0 lt!112544 lt!112544)))

(assert (=> d!22428 (= lt!112538 (lemmaIsPrefixRefl!0 lt!112544))))

(declare-fun lt!112553 () Unit!4685)

(declare-fun lt!112537 () Unit!4685)

(assert (=> d!22428 (= lt!112553 lt!112537)))

(assert (=> d!22428 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22428 (= lt!112537 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22428 (= lt!112544 (BitStream!2303 (buf!1733 (_2!3153 lt!112271)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)))))

(assert (=> d!22428 (isPrefixOf!0 thiss!1379 (_2!3153 lt!112271))))

(assert (=> d!22428 (= (reader!0 thiss!1379 (_2!3153 lt!112271)) lt!112551)))

(declare-fun b!70038 () Bool)

(declare-fun res!57835 () Bool)

(assert (=> b!70038 (=> (not res!57835) (not e!45682))))

(assert (=> b!70038 (= res!57835 (isPrefixOf!0 (_1!3154 lt!112551) thiss!1379))))

(declare-fun b!70039 () Bool)

(declare-fun lt!112546 () (_ BitVec 64))

(declare-fun lt!112539 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2302 (_ BitVec 64)) BitStream!2302)

(assert (=> b!70039 (= e!45682 (= (_1!3154 lt!112551) (withMovedBitIndex!0 (_2!3154 lt!112551) (bvsub lt!112539 lt!112546))))))

(assert (=> b!70039 (or (= (bvand lt!112539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112539 lt!112546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70039 (= lt!112546 (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112271))) (currentByte!3441 (_2!3153 lt!112271)) (currentBit!3436 (_2!3153 lt!112271))))))

(assert (=> b!70039 (= lt!112539 (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)))))

(declare-fun b!70040 () Bool)

(declare-fun lt!112555 () Unit!4685)

(assert (=> b!70040 (= e!45683 lt!112555)))

(declare-fun lt!112547 () (_ BitVec 64))

(assert (=> b!70040 (= lt!112547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!112548 () (_ BitVec 64))

(assert (=> b!70040 (= lt!112548 (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2908 array!2908 (_ BitVec 64) (_ BitVec 64)) Unit!4685)

(assert (=> b!70040 (= lt!112555 (arrayBitRangesEqSymmetric!0 (buf!1733 thiss!1379) (buf!1733 (_2!3153 lt!112271)) lt!112547 lt!112548))))

(assert (=> b!70040 (arrayBitRangesEq!0 (buf!1733 (_2!3153 lt!112271)) (buf!1733 thiss!1379) lt!112547 lt!112548)))

(declare-fun b!70041 () Bool)

(declare-fun res!57837 () Bool)

(assert (=> b!70041 (=> (not res!57837) (not e!45682))))

(assert (=> b!70041 (= res!57837 (isPrefixOf!0 (_2!3154 lt!112551) (_2!3153 lt!112271)))))

(declare-fun b!70042 () Bool)

(declare-fun Unit!4701 () Unit!4685)

(assert (=> b!70042 (= e!45683 Unit!4701)))

(assert (= (and d!22428 c!5199) b!70040))

(assert (= (and d!22428 (not c!5199)) b!70042))

(assert (= (and d!22428 res!57836) b!70038))

(assert (= (and b!70038 res!57835) b!70041))

(assert (= (and b!70041 res!57837) b!70039))

(assert (=> d!22428 m!111753))

(declare-fun m!112109 () Bool)

(assert (=> d!22428 m!112109))

(declare-fun m!112111 () Bool)

(assert (=> d!22428 m!112111))

(declare-fun m!112113 () Bool)

(assert (=> d!22428 m!112113))

(assert (=> d!22428 m!111835))

(assert (=> d!22428 m!111755))

(declare-fun m!112115 () Bool)

(assert (=> d!22428 m!112115))

(declare-fun m!112117 () Bool)

(assert (=> d!22428 m!112117))

(declare-fun m!112119 () Bool)

(assert (=> d!22428 m!112119))

(declare-fun m!112121 () Bool)

(assert (=> d!22428 m!112121))

(declare-fun m!112123 () Bool)

(assert (=> d!22428 m!112123))

(declare-fun m!112125 () Bool)

(assert (=> b!70038 m!112125))

(assert (=> b!70040 m!111757))

(declare-fun m!112127 () Bool)

(assert (=> b!70040 m!112127))

(declare-fun m!112129 () Bool)

(assert (=> b!70040 m!112129))

(declare-fun m!112131 () Bool)

(assert (=> b!70041 m!112131))

(declare-fun m!112133 () Bool)

(assert (=> b!70039 m!112133))

(assert (=> b!70039 m!111821))

(assert (=> b!70039 m!111757))

(assert (=> b!69832 d!22428))

(declare-fun d!22436 () Bool)

(declare-fun e!45684 () Bool)

(assert (=> d!22436 e!45684))

(declare-fun res!57839 () Bool)

(assert (=> d!22436 (=> (not res!57839) (not e!45684))))

(declare-fun lt!112571 () tuple2!6086)

(assert (=> d!22436 (= res!57839 (isPrefixOf!0 (_1!3154 lt!112571) (_2!3154 lt!112571)))))

(declare-fun lt!112564 () BitStream!2302)

(assert (=> d!22436 (= lt!112571 (tuple2!6087 lt!112564 (_2!3153 lt!112271)))))

(declare-fun lt!112560 () Unit!4685)

(declare-fun lt!112576 () Unit!4685)

(assert (=> d!22436 (= lt!112560 lt!112576)))

(assert (=> d!22436 (isPrefixOf!0 lt!112564 (_2!3153 lt!112271))))

(assert (=> d!22436 (= lt!112576 (lemmaIsPrefixTransitive!0 lt!112564 (_2!3153 lt!112271) (_2!3153 lt!112271)))))

(declare-fun lt!112574 () Unit!4685)

(declare-fun lt!112570 () Unit!4685)

(assert (=> d!22436 (= lt!112574 lt!112570)))

(assert (=> d!22436 (isPrefixOf!0 lt!112564 (_2!3153 lt!112271))))

(assert (=> d!22436 (= lt!112570 (lemmaIsPrefixTransitive!0 lt!112564 (_2!3153 lt!112253) (_2!3153 lt!112271)))))

(declare-fun lt!112561 () Unit!4685)

(declare-fun e!45685 () Unit!4685)

(assert (=> d!22436 (= lt!112561 e!45685)))

(declare-fun c!5200 () Bool)

(assert (=> d!22436 (= c!5200 (not (= (size!1352 (buf!1733 (_2!3153 lt!112253))) #b00000000000000000000000000000000)))))

(declare-fun lt!112563 () Unit!4685)

(declare-fun lt!112569 () Unit!4685)

(assert (=> d!22436 (= lt!112563 lt!112569)))

(assert (=> d!22436 (isPrefixOf!0 (_2!3153 lt!112271) (_2!3153 lt!112271))))

(assert (=> d!22436 (= lt!112569 (lemmaIsPrefixRefl!0 (_2!3153 lt!112271)))))

(declare-fun lt!112572 () Unit!4685)

(declare-fun lt!112562 () Unit!4685)

(assert (=> d!22436 (= lt!112572 lt!112562)))

(assert (=> d!22436 (= lt!112562 (lemmaIsPrefixRefl!0 (_2!3153 lt!112271)))))

(declare-fun lt!112565 () Unit!4685)

(declare-fun lt!112558 () Unit!4685)

(assert (=> d!22436 (= lt!112565 lt!112558)))

(assert (=> d!22436 (isPrefixOf!0 lt!112564 lt!112564)))

(assert (=> d!22436 (= lt!112558 (lemmaIsPrefixRefl!0 lt!112564))))

(declare-fun lt!112573 () Unit!4685)

(declare-fun lt!112557 () Unit!4685)

(assert (=> d!22436 (= lt!112573 lt!112557)))

(assert (=> d!22436 (isPrefixOf!0 (_2!3153 lt!112253) (_2!3153 lt!112253))))

(assert (=> d!22436 (= lt!112557 (lemmaIsPrefixRefl!0 (_2!3153 lt!112253)))))

(assert (=> d!22436 (= lt!112564 (BitStream!2303 (buf!1733 (_2!3153 lt!112271)) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253))))))

(assert (=> d!22436 (isPrefixOf!0 (_2!3153 lt!112253) (_2!3153 lt!112271))))

(assert (=> d!22436 (= (reader!0 (_2!3153 lt!112253) (_2!3153 lt!112271)) lt!112571)))

(declare-fun b!70043 () Bool)

(declare-fun res!57838 () Bool)

(assert (=> b!70043 (=> (not res!57838) (not e!45684))))

(assert (=> b!70043 (= res!57838 (isPrefixOf!0 (_1!3154 lt!112571) (_2!3153 lt!112253)))))

(declare-fun lt!112559 () (_ BitVec 64))

(declare-fun b!70044 () Bool)

(declare-fun lt!112566 () (_ BitVec 64))

(assert (=> b!70044 (= e!45684 (= (_1!3154 lt!112571) (withMovedBitIndex!0 (_2!3154 lt!112571) (bvsub lt!112559 lt!112566))))))

(assert (=> b!70044 (or (= (bvand lt!112559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112566 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112559 lt!112566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70044 (= lt!112566 (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112271))) (currentByte!3441 (_2!3153 lt!112271)) (currentBit!3436 (_2!3153 lt!112271))))))

(assert (=> b!70044 (= lt!112559 (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112253))) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253))))))

(declare-fun b!70045 () Bool)

(declare-fun lt!112575 () Unit!4685)

(assert (=> b!70045 (= e!45685 lt!112575)))

(declare-fun lt!112567 () (_ BitVec 64))

(assert (=> b!70045 (= lt!112567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!112568 () (_ BitVec 64))

(assert (=> b!70045 (= lt!112568 (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112253))) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253))))))

(assert (=> b!70045 (= lt!112575 (arrayBitRangesEqSymmetric!0 (buf!1733 (_2!3153 lt!112253)) (buf!1733 (_2!3153 lt!112271)) lt!112567 lt!112568))))

(assert (=> b!70045 (arrayBitRangesEq!0 (buf!1733 (_2!3153 lt!112271)) (buf!1733 (_2!3153 lt!112253)) lt!112567 lt!112568)))

(declare-fun b!70046 () Bool)

(declare-fun res!57840 () Bool)

(assert (=> b!70046 (=> (not res!57840) (not e!45684))))

(assert (=> b!70046 (= res!57840 (isPrefixOf!0 (_2!3154 lt!112571) (_2!3153 lt!112271)))))

(declare-fun b!70047 () Bool)

(declare-fun Unit!4702 () Unit!4685)

(assert (=> b!70047 (= e!45685 Unit!4702)))

(assert (= (and d!22436 c!5200) b!70045))

(assert (= (and d!22436 (not c!5200)) b!70047))

(assert (= (and d!22436 res!57839) b!70043))

(assert (= (and b!70043 res!57838) b!70046))

(assert (= (and b!70046 res!57840) b!70044))

(declare-fun m!112135 () Bool)

(assert (=> d!22436 m!112135))

(declare-fun m!112137 () Bool)

(assert (=> d!22436 m!112137))

(declare-fun m!112139 () Bool)

(assert (=> d!22436 m!112139))

(assert (=> d!22436 m!112113))

(assert (=> d!22436 m!111829))

(declare-fun m!112141 () Bool)

(assert (=> d!22436 m!112141))

(declare-fun m!112143 () Bool)

(assert (=> d!22436 m!112143))

(declare-fun m!112145 () Bool)

(assert (=> d!22436 m!112145))

(declare-fun m!112147 () Bool)

(assert (=> d!22436 m!112147))

(assert (=> d!22436 m!112121))

(declare-fun m!112149 () Bool)

(assert (=> d!22436 m!112149))

(declare-fun m!112151 () Bool)

(assert (=> b!70043 m!112151))

(assert (=> b!70045 m!111759))

(declare-fun m!112153 () Bool)

(assert (=> b!70045 m!112153))

(declare-fun m!112155 () Bool)

(assert (=> b!70045 m!112155))

(declare-fun m!112157 () Bool)

(assert (=> b!70046 m!112157))

(declare-fun m!112159 () Bool)

(assert (=> b!70044 m!112159))

(assert (=> b!70044 m!111821))

(assert (=> b!70044 m!111759))

(assert (=> b!69832 d!22436))

(declare-fun b!70059 () Bool)

(declare-fun e!45690 () Bool)

(declare-fun lt!112584 () List!726)

(assert (=> b!70059 (= e!45690 (> (length!354 lt!112584) 0))))

(declare-datatypes ((tuple2!6108 0))(
  ( (tuple2!6109 (_1!3167 List!726) (_2!3167 BitStream!2302)) )
))
(declare-fun e!45691 () tuple2!6108)

(declare-fun lt!112585 () (_ BitVec 64))

(declare-datatypes ((tuple2!6110 0))(
  ( (tuple2!6111 (_1!3168 Bool) (_2!3168 BitStream!2302)) )
))
(declare-fun lt!112583 () tuple2!6110)

(declare-fun b!70057 () Bool)

(assert (=> b!70057 (= e!45691 (tuple2!6109 (Cons!722 (_1!3168 lt!112583) (bitStreamReadBitsIntoList!0 (_2!3153 lt!112271) (_2!3168 lt!112583) (bvsub lt!112260 lt!112585))) (_2!3168 lt!112583)))))

(declare-fun readBit!0 (BitStream!2302) tuple2!6110)

(assert (=> b!70057 (= lt!112583 (readBit!0 (_1!3154 lt!112261)))))

(assert (=> b!70057 (= lt!112585 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70056 () Bool)

(assert (=> b!70056 (= e!45691 (tuple2!6109 Nil!723 (_1!3154 lt!112261)))))

(declare-fun d!22438 () Bool)

(assert (=> d!22438 e!45690))

(declare-fun c!5205 () Bool)

(assert (=> d!22438 (= c!5205 (= lt!112260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22438 (= lt!112584 (_1!3167 e!45691))))

(declare-fun c!5206 () Bool)

(assert (=> d!22438 (= c!5206 (= lt!112260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22438 (bvsge lt!112260 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22438 (= (bitStreamReadBitsIntoList!0 (_2!3153 lt!112271) (_1!3154 lt!112261) lt!112260) lt!112584)))

(declare-fun b!70058 () Bool)

(declare-fun isEmpty!226 (List!726) Bool)

(assert (=> b!70058 (= e!45690 (isEmpty!226 lt!112584))))

(assert (= (and d!22438 c!5206) b!70056))

(assert (= (and d!22438 (not c!5206)) b!70057))

(assert (= (and d!22438 c!5205) b!70058))

(assert (= (and d!22438 (not c!5205)) b!70059))

(declare-fun m!112161 () Bool)

(assert (=> b!70059 m!112161))

(declare-fun m!112163 () Bool)

(assert (=> b!70057 m!112163))

(declare-fun m!112165 () Bool)

(assert (=> b!70057 m!112165))

(declare-fun m!112167 () Bool)

(assert (=> b!70058 m!112167))

(assert (=> b!69832 d!22438))

(declare-fun b!70063 () Bool)

(declare-fun e!45692 () Bool)

(declare-fun lt!112587 () List!726)

(assert (=> b!70063 (= e!45692 (> (length!354 lt!112587) 0))))

(declare-fun lt!112588 () (_ BitVec 64))

(declare-fun e!45693 () tuple2!6108)

(declare-fun lt!112586 () tuple2!6110)

(declare-fun b!70061 () Bool)

(assert (=> b!70061 (= e!45693 (tuple2!6109 (Cons!722 (_1!3168 lt!112586) (bitStreamReadBitsIntoList!0 (_2!3153 lt!112271) (_2!3168 lt!112586) (bvsub (bvsub to!314 i!635) lt!112588))) (_2!3168 lt!112586)))))

(assert (=> b!70061 (= lt!112586 (readBit!0 (_1!3154 lt!112262)))))

(assert (=> b!70061 (= lt!112588 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70060 () Bool)

(assert (=> b!70060 (= e!45693 (tuple2!6109 Nil!723 (_1!3154 lt!112262)))))

(declare-fun d!22440 () Bool)

(assert (=> d!22440 e!45692))

(declare-fun c!5207 () Bool)

(assert (=> d!22440 (= c!5207 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22440 (= lt!112587 (_1!3167 e!45693))))

(declare-fun c!5208 () Bool)

(assert (=> d!22440 (= c!5208 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22440 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22440 (= (bitStreamReadBitsIntoList!0 (_2!3153 lt!112271) (_1!3154 lt!112262) (bvsub to!314 i!635)) lt!112587)))

(declare-fun b!70062 () Bool)

(assert (=> b!70062 (= e!45692 (isEmpty!226 lt!112587))))

(assert (= (and d!22440 c!5208) b!70060))

(assert (= (and d!22440 (not c!5208)) b!70061))

(assert (= (and d!22440 c!5207) b!70062))

(assert (= (and d!22440 (not c!5207)) b!70063))

(declare-fun m!112169 () Bool)

(assert (=> b!70063 m!112169))

(declare-fun m!112171 () Bool)

(assert (=> b!70061 m!112171))

(declare-fun m!112173 () Bool)

(assert (=> b!70061 m!112173))

(declare-fun m!112175 () Bool)

(assert (=> b!70062 m!112175))

(assert (=> b!69832 d!22440))

(declare-fun d!22442 () Bool)

(assert (=> d!22442 (= (head!545 (byteArrayBitContentToList!0 (_2!3153 lt!112253) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!841 (byteArrayBitContentToList!0 (_2!3153 lt!112253) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69821 d!22442))

(declare-fun d!22444 () Bool)

(declare-fun c!5211 () Bool)

(assert (=> d!22444 (= c!5211 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45696 () List!726)

(assert (=> d!22444 (= (byteArrayBitContentToList!0 (_2!3153 lt!112253) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!45696)))

(declare-fun b!70068 () Bool)

(assert (=> b!70068 (= e!45696 Nil!723)))

(declare-fun b!70069 () Bool)

(assert (=> b!70069 (= e!45696 (Cons!722 (not (= (bvand ((_ sign_extend 24) (select (arr!1934 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3153 lt!112253) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22444 c!5211) b!70068))

(assert (= (and d!22444 (not c!5211)) b!70069))

(assert (=> b!70069 m!111801))

(declare-fun m!112177 () Bool)

(assert (=> b!70069 m!112177))

(declare-fun m!112179 () Bool)

(assert (=> b!70069 m!112179))

(assert (=> b!69821 d!22444))

(declare-fun d!22446 () Bool)

(assert (=> d!22446 (= (head!545 (bitStreamReadBitsIntoList!0 (_2!3153 lt!112253) (_1!3154 lt!112266) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!841 (bitStreamReadBitsIntoList!0 (_2!3153 lt!112253) (_1!3154 lt!112266) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69821 d!22446))

(declare-fun b!70073 () Bool)

(declare-fun e!45697 () Bool)

(declare-fun lt!112590 () List!726)

(assert (=> b!70073 (= e!45697 (> (length!354 lt!112590) 0))))

(declare-fun e!45698 () tuple2!6108)

(declare-fun lt!112589 () tuple2!6110)

(declare-fun lt!112591 () (_ BitVec 64))

(declare-fun b!70071 () Bool)

(assert (=> b!70071 (= e!45698 (tuple2!6109 (Cons!722 (_1!3168 lt!112589) (bitStreamReadBitsIntoList!0 (_2!3153 lt!112253) (_2!3168 lt!112589) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!112591))) (_2!3168 lt!112589)))))

(assert (=> b!70071 (= lt!112589 (readBit!0 (_1!3154 lt!112266)))))

(assert (=> b!70071 (= lt!112591 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70070 () Bool)

(assert (=> b!70070 (= e!45698 (tuple2!6109 Nil!723 (_1!3154 lt!112266)))))

(declare-fun d!22448 () Bool)

(assert (=> d!22448 e!45697))

(declare-fun c!5212 () Bool)

(assert (=> d!22448 (= c!5212 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22448 (= lt!112590 (_1!3167 e!45698))))

(declare-fun c!5213 () Bool)

(assert (=> d!22448 (= c!5213 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22448 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22448 (= (bitStreamReadBitsIntoList!0 (_2!3153 lt!112253) (_1!3154 lt!112266) #b0000000000000000000000000000000000000000000000000000000000000001) lt!112590)))

(declare-fun b!70072 () Bool)

(assert (=> b!70072 (= e!45697 (isEmpty!226 lt!112590))))

(assert (= (and d!22448 c!5213) b!70070))

(assert (= (and d!22448 (not c!5213)) b!70071))

(assert (= (and d!22448 c!5212) b!70072))

(assert (= (and d!22448 (not c!5212)) b!70073))

(declare-fun m!112181 () Bool)

(assert (=> b!70073 m!112181))

(declare-fun m!112183 () Bool)

(assert (=> b!70071 m!112183))

(declare-fun m!112185 () Bool)

(assert (=> b!70071 m!112185))

(declare-fun m!112187 () Bool)

(assert (=> b!70072 m!112187))

(assert (=> b!69821 d!22448))

(declare-fun d!22450 () Bool)

(assert (=> d!22450 (= (bitAt!0 (buf!1733 (_1!3154 lt!112261)) lt!112258) (not (= (bvand ((_ sign_extend 24) (select (arr!1934 (buf!1733 (_1!3154 lt!112261))) ((_ extract 31 0) (bvsdiv lt!112258 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!112258 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5392 () Bool)

(assert (= bs!5392 d!22450))

(declare-fun m!112189 () Bool)

(assert (=> bs!5392 m!112189))

(assert (=> bs!5392 m!112069))

(assert (=> b!69820 d!22450))

(declare-fun d!22452 () Bool)

(assert (=> d!22452 (= (bitAt!0 (buf!1733 (_1!3154 lt!112262)) lt!112258) (not (= (bvand ((_ sign_extend 24) (select (arr!1934 (buf!1733 (_1!3154 lt!112262))) ((_ extract 31 0) (bvsdiv lt!112258 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!112258 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5393 () Bool)

(assert (= bs!5393 d!22452))

(declare-fun m!112191 () Bool)

(assert (=> bs!5393 m!112191))

(assert (=> bs!5393 m!112069))

(assert (=> b!69820 d!22452))

(declare-fun d!22454 () Bool)

(assert (=> d!22454 (= (array_inv!1210 (buf!1733 thiss!1379)) (bvsge (size!1352 (buf!1733 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!69831 d!22454))

(declare-fun d!22456 () Bool)

(declare-fun res!57849 () Bool)

(declare-fun e!45704 () Bool)

(assert (=> d!22456 (=> (not res!57849) (not e!45704))))

(assert (=> d!22456 (= res!57849 (= (size!1352 (buf!1733 thiss!1379)) (size!1352 (buf!1733 (_2!3153 lt!112253)))))))

(assert (=> d!22456 (= (isPrefixOf!0 thiss!1379 (_2!3153 lt!112253)) e!45704)))

(declare-fun b!70080 () Bool)

(declare-fun res!57847 () Bool)

(assert (=> b!70080 (=> (not res!57847) (not e!45704))))

(assert (=> b!70080 (= res!57847 (bvsle (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)) (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112253))) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253)))))))

(declare-fun b!70081 () Bool)

(declare-fun e!45703 () Bool)

(assert (=> b!70081 (= e!45704 e!45703)))

(declare-fun res!57848 () Bool)

(assert (=> b!70081 (=> res!57848 e!45703)))

(assert (=> b!70081 (= res!57848 (= (size!1352 (buf!1733 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70082 () Bool)

(assert (=> b!70082 (= e!45703 (arrayBitRangesEq!0 (buf!1733 thiss!1379) (buf!1733 (_2!3153 lt!112253)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379))))))

(assert (= (and d!22456 res!57849) b!70080))

(assert (= (and b!70080 res!57847) b!70081))

(assert (= (and b!70081 (not res!57848)) b!70082))

(assert (=> b!70080 m!111757))

(assert (=> b!70080 m!111759))

(assert (=> b!70082 m!111757))

(assert (=> b!70082 m!111757))

(declare-fun m!112193 () Bool)

(assert (=> b!70082 m!112193))

(assert (=> b!69830 d!22456))

(declare-fun d!22458 () Bool)

(assert (=> d!22458 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253))) lt!112260) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253)))) lt!112260))))

(declare-fun bs!5394 () Bool)

(assert (= bs!5394 d!22458))

(assert (=> bs!5394 m!112091))

(assert (=> b!69830 d!22458))

(declare-fun d!22460 () Bool)

(declare-fun e!45707 () Bool)

(assert (=> d!22460 e!45707))

(declare-fun res!57852 () Bool)

(assert (=> d!22460 (=> (not res!57852) (not e!45707))))

(assert (=> d!22460 (= res!57852 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!112594 () Unit!4685)

(declare-fun choose!27 (BitStream!2302 BitStream!2302 (_ BitVec 64) (_ BitVec 64)) Unit!4685)

(assert (=> d!22460 (= lt!112594 (choose!27 thiss!1379 (_2!3153 lt!112253) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!22460 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!22460 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3153 lt!112253) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!112594)))

(declare-fun b!70085 () Bool)

(assert (=> b!70085 (= e!45707 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22460 res!57852) b!70085))

(declare-fun m!112195 () Bool)

(assert (=> d!22460 m!112195))

(declare-fun m!112197 () Bool)

(assert (=> b!70085 m!112197))

(assert (=> b!69830 d!22460))

(declare-fun b!70157 () Bool)

(declare-fun e!45747 () Bool)

(declare-fun e!45746 () Bool)

(assert (=> b!70157 (= e!45747 e!45746)))

(declare-fun res!57905 () Bool)

(assert (=> b!70157 (=> (not res!57905) (not e!45746))))

(declare-fun lt!112678 () tuple2!6084)

(declare-datatypes ((tuple2!6116 0))(
  ( (tuple2!6117 (_1!3171 BitStream!2302) (_2!3171 Bool)) )
))
(declare-fun lt!112676 () tuple2!6116)

(declare-fun lt!112673 () (_ BitVec 8))

(assert (=> b!70157 (= res!57905 (and (= (_2!3171 lt!112676) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1934 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!112673)) #b00000000000000000000000000000000))) (= (_1!3171 lt!112676) (_2!3153 lt!112678))))))

(declare-datatypes ((tuple2!6118 0))(
  ( (tuple2!6119 (_1!3172 array!2908) (_2!3172 BitStream!2302)) )
))
(declare-fun lt!112679 () tuple2!6118)

(declare-fun lt!112680 () BitStream!2302)

(declare-fun readBits!0 (BitStream!2302 (_ BitVec 64)) tuple2!6118)

(assert (=> b!70157 (= lt!112679 (readBits!0 lt!112680 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2302) tuple2!6116)

(assert (=> b!70157 (= lt!112676 (readBitPure!0 lt!112680))))

(declare-fun readerFrom!0 (BitStream!2302 (_ BitVec 32) (_ BitVec 32)) BitStream!2302)

(assert (=> b!70157 (= lt!112680 (readerFrom!0 (_2!3153 lt!112678) (currentBit!3436 thiss!1379) (currentByte!3441 thiss!1379)))))

(declare-fun b!70158 () Bool)

(declare-fun res!57903 () Bool)

(assert (=> b!70158 (=> (not res!57903) (not e!45747))))

(assert (=> b!70158 (= res!57903 (isPrefixOf!0 thiss!1379 (_2!3153 lt!112678)))))

(declare-fun b!70159 () Bool)

(declare-fun e!45745 () Bool)

(declare-fun e!45748 () Bool)

(assert (=> b!70159 (= e!45745 e!45748)))

(declare-fun res!57902 () Bool)

(assert (=> b!70159 (=> (not res!57902) (not e!45748))))

(declare-fun lt!112674 () tuple2!6116)

(declare-fun lt!112683 () tuple2!6084)

(declare-fun lt!112675 () Bool)

(assert (=> b!70159 (= res!57902 (and (= (_2!3171 lt!112674) lt!112675) (= (_1!3171 lt!112674) (_2!3153 lt!112683))))))

(assert (=> b!70159 (= lt!112674 (readBitPure!0 (readerFrom!0 (_2!3153 lt!112683) (currentBit!3436 thiss!1379) (currentByte!3441 thiss!1379))))))

(declare-fun b!70160 () Bool)

(assert (=> b!70160 (= e!45746 (= (bitIndex!0 (size!1352 (buf!1733 (_1!3171 lt!112676))) (currentByte!3441 (_1!3171 lt!112676)) (currentBit!3436 (_1!3171 lt!112676))) (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112678))) (currentByte!3441 (_2!3153 lt!112678)) (currentBit!3436 (_2!3153 lt!112678)))))))

(declare-fun b!70161 () Bool)

(assert (=> b!70161 (= e!45748 (= (bitIndex!0 (size!1352 (buf!1733 (_1!3171 lt!112674))) (currentByte!3441 (_1!3171 lt!112674)) (currentBit!3436 (_1!3171 lt!112674))) (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112683))) (currentByte!3441 (_2!3153 lt!112683)) (currentBit!3436 (_2!3153 lt!112683)))))))

(declare-fun b!70163 () Bool)

(declare-fun res!57906 () Bool)

(assert (=> b!70163 (=> (not res!57906) (not e!45745))))

(assert (=> b!70163 (= res!57906 (isPrefixOf!0 thiss!1379 (_2!3153 lt!112683)))))

(declare-fun b!70164 () Bool)

(declare-fun res!57904 () Bool)

(assert (=> b!70164 (=> (not res!57904) (not e!45745))))

(assert (=> b!70164 (= res!57904 (= (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112683))) (currentByte!3441 (_2!3153 lt!112683)) (currentBit!3436 (_2!3153 lt!112683))) (bvadd (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!70162 () Bool)

(declare-fun res!57908 () Bool)

(assert (=> b!70162 (=> (not res!57908) (not e!45747))))

(declare-fun lt!112681 () (_ BitVec 64))

(declare-fun lt!112677 () (_ BitVec 64))

(assert (=> b!70162 (= res!57908 (= (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112678))) (currentByte!3441 (_2!3153 lt!112678)) (currentBit!3436 (_2!3153 lt!112678))) (bvadd lt!112677 lt!112681)))))

(assert (=> b!70162 (or (not (= (bvand lt!112677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112681 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!112677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!112677 lt!112681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70162 (= lt!112681 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!70162 (= lt!112677 (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)))))

(declare-fun d!22462 () Bool)

(assert (=> d!22462 e!45747))

(declare-fun res!57907 () Bool)

(assert (=> d!22462 (=> (not res!57907) (not e!45747))))

(assert (=> d!22462 (= res!57907 (= (size!1352 (buf!1733 (_2!3153 lt!112678))) (size!1352 (buf!1733 thiss!1379))))))

(declare-fun lt!112682 () array!2908)

(assert (=> d!22462 (= lt!112673 (select (arr!1934 lt!112682) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!22462 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1352 lt!112682)))))

(assert (=> d!22462 (= lt!112682 (array!2909 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!112684 () tuple2!6084)

(assert (=> d!22462 (= lt!112678 (tuple2!6085 (_1!3153 lt!112684) (_2!3153 lt!112684)))))

(assert (=> d!22462 (= lt!112684 lt!112683)))

(assert (=> d!22462 e!45745))

(declare-fun res!57909 () Bool)

(assert (=> d!22462 (=> (not res!57909) (not e!45745))))

(assert (=> d!22462 (= res!57909 (= (size!1352 (buf!1733 thiss!1379)) (size!1352 (buf!1733 (_2!3153 lt!112683)))))))

(declare-fun appendBit!0 (BitStream!2302 Bool) tuple2!6084)

(assert (=> d!22462 (= lt!112683 (appendBit!0 thiss!1379 lt!112675))))

(assert (=> d!22462 (= lt!112675 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1934 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!22462 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!22462 (= (appendBitFromByte!0 thiss!1379 (select (arr!1934 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!112678)))

(assert (= (and d!22462 res!57909) b!70164))

(assert (= (and b!70164 res!57904) b!70163))

(assert (= (and b!70163 res!57906) b!70159))

(assert (= (and b!70159 res!57902) b!70161))

(assert (= (and d!22462 res!57907) b!70162))

(assert (= (and b!70162 res!57908) b!70158))

(assert (= (and b!70158 res!57903) b!70157))

(assert (= (and b!70157 res!57905) b!70160))

(declare-fun m!112255 () Bool)

(assert (=> b!70159 m!112255))

(assert (=> b!70159 m!112255))

(declare-fun m!112257 () Bool)

(assert (=> b!70159 m!112257))

(declare-fun m!112259 () Bool)

(assert (=> b!70160 m!112259))

(declare-fun m!112261 () Bool)

(assert (=> b!70160 m!112261))

(declare-fun m!112263 () Bool)

(assert (=> b!70163 m!112263))

(declare-fun m!112265 () Bool)

(assert (=> d!22462 m!112265))

(declare-fun m!112267 () Bool)

(assert (=> d!22462 m!112267))

(assert (=> d!22462 m!112177))

(assert (=> b!70162 m!112261))

(assert (=> b!70162 m!111757))

(declare-fun m!112269 () Bool)

(assert (=> b!70158 m!112269))

(declare-fun m!112271 () Bool)

(assert (=> b!70161 m!112271))

(declare-fun m!112273 () Bool)

(assert (=> b!70161 m!112273))

(declare-fun m!112275 () Bool)

(assert (=> b!70157 m!112275))

(declare-fun m!112277 () Bool)

(assert (=> b!70157 m!112277))

(declare-fun m!112279 () Bool)

(assert (=> b!70157 m!112279))

(assert (=> b!70164 m!112273))

(assert (=> b!70164 m!111757))

(assert (=> b!69830 d!22462))

(declare-fun d!22498 () Bool)

(assert (=> d!22498 (= (tail!330 lt!112254) (t!1476 lt!112254))))

(assert (=> b!69824 d!22498))

(declare-fun d!22500 () Bool)

(declare-fun e!45751 () Bool)

(assert (=> d!22500 e!45751))

(declare-fun res!57912 () Bool)

(assert (=> d!22500 (=> (not res!57912) (not e!45751))))

(declare-fun lt!112690 () (_ BitVec 64))

(assert (=> d!22500 (= res!57912 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112690 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!112690) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!22500 (= lt!112690 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!112689 () Unit!4685)

(declare-fun choose!42 (BitStream!2302 BitStream!2302 BitStream!2302 BitStream!2302 (_ BitVec 64) List!726) Unit!4685)

(assert (=> d!22500 (= lt!112689 (choose!42 (_2!3153 lt!112271) (_2!3153 lt!112271) (_1!3154 lt!112262) (_1!3154 lt!112261) (bvsub to!314 i!635) lt!112254))))

(assert (=> d!22500 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22500 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3153 lt!112271) (_2!3153 lt!112271) (_1!3154 lt!112262) (_1!3154 lt!112261) (bvsub to!314 i!635) lt!112254) lt!112689)))

(declare-fun b!70167 () Bool)

(assert (=> b!70167 (= e!45751 (= (bitStreamReadBitsIntoList!0 (_2!3153 lt!112271) (_1!3154 lt!112261) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!330 lt!112254)))))

(assert (= (and d!22500 res!57912) b!70167))

(declare-fun m!112281 () Bool)

(assert (=> d!22500 m!112281))

(declare-fun m!112283 () Bool)

(assert (=> b!70167 m!112283))

(assert (=> b!70167 m!111797))

(assert (=> b!69824 d!22500))

(declare-fun d!22502 () Bool)

(declare-fun res!57915 () Bool)

(declare-fun e!45753 () Bool)

(assert (=> d!22502 (=> (not res!57915) (not e!45753))))

(assert (=> d!22502 (= res!57915 (= (size!1352 (buf!1733 thiss!1379)) (size!1352 (buf!1733 (_2!3153 lt!112271)))))))

(assert (=> d!22502 (= (isPrefixOf!0 thiss!1379 (_2!3153 lt!112271)) e!45753)))

(declare-fun b!70168 () Bool)

(declare-fun res!57913 () Bool)

(assert (=> b!70168 (=> (not res!57913) (not e!45753))))

(assert (=> b!70168 (= res!57913 (bvsle (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)) (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112271))) (currentByte!3441 (_2!3153 lt!112271)) (currentBit!3436 (_2!3153 lt!112271)))))))

(declare-fun b!70169 () Bool)

(declare-fun e!45752 () Bool)

(assert (=> b!70169 (= e!45753 e!45752)))

(declare-fun res!57914 () Bool)

(assert (=> b!70169 (=> res!57914 e!45752)))

(assert (=> b!70169 (= res!57914 (= (size!1352 (buf!1733 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70170 () Bool)

(assert (=> b!70170 (= e!45752 (arrayBitRangesEq!0 (buf!1733 thiss!1379) (buf!1733 (_2!3153 lt!112271)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379))))))

(assert (= (and d!22502 res!57915) b!70168))

(assert (= (and b!70168 res!57913) b!70169))

(assert (= (and b!70169 (not res!57914)) b!70170))

(assert (=> b!70168 m!111757))

(assert (=> b!70168 m!111821))

(assert (=> b!70170 m!111757))

(assert (=> b!70170 m!111757))

(declare-fun m!112285 () Bool)

(assert (=> b!70170 m!112285))

(assert (=> b!69835 d!22502))

(declare-fun call!913 () tuple2!6086)

(declare-fun lt!113334 () tuple2!6084)

(declare-fun bm!910 () Bool)

(declare-fun c!5260 () Bool)

(assert (=> bm!910 (= call!913 (reader!0 (_2!3153 lt!112253) (ite c!5260 (_2!3153 lt!113334) (_2!3153 lt!112253))))))

(declare-fun b!70383 () Bool)

(declare-fun e!45860 () tuple2!6084)

(declare-fun Unit!4710 () Unit!4685)

(assert (=> b!70383 (= e!45860 (tuple2!6085 Unit!4710 (_2!3153 lt!113334)))))

(declare-fun lt!113343 () tuple2!6084)

(assert (=> b!70383 (= lt!113343 (appendBitFromByte!0 (_2!3153 lt!112253) (select (arr!1934 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!113357 () (_ BitVec 64))

(assert (=> b!70383 (= lt!113357 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!113340 () (_ BitVec 64))

(assert (=> b!70383 (= lt!113340 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!113358 () Unit!4685)

(assert (=> b!70383 (= lt!113358 (validateOffsetBitsIneqLemma!0 (_2!3153 lt!112253) (_2!3153 lt!113343) lt!113357 lt!113340))))

(assert (=> b!70383 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!113343)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!113343))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!113343))) (bvsub lt!113357 lt!113340))))

(declare-fun lt!113338 () Unit!4685)

(assert (=> b!70383 (= lt!113338 lt!113358)))

(declare-fun lt!113319 () tuple2!6086)

(assert (=> b!70383 (= lt!113319 (reader!0 (_2!3153 lt!112253) (_2!3153 lt!113343)))))

(declare-fun lt!113348 () (_ BitVec 64))

(assert (=> b!70383 (= lt!113348 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!113360 () Unit!4685)

(assert (=> b!70383 (= lt!113360 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3153 lt!112253) (buf!1733 (_2!3153 lt!113343)) lt!113348))))

(assert (=> b!70383 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!113343)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253))) lt!113348)))

(declare-fun lt!113345 () Unit!4685)

(assert (=> b!70383 (= lt!113345 lt!113360)))

(assert (=> b!70383 (= (head!545 (byteArrayBitContentToList!0 (_2!3153 lt!113343) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!545 (bitStreamReadBitsIntoList!0 (_2!3153 lt!113343) (_1!3154 lt!113319) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!113362 () Unit!4685)

(declare-fun Unit!4711 () Unit!4685)

(assert (=> b!70383 (= lt!113362 Unit!4711)))

(assert (=> b!70383 (= lt!113334 (appendBitsMSBFirstLoop!0 (_2!3153 lt!113343) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!113361 () Unit!4685)

(assert (=> b!70383 (= lt!113361 (lemmaIsPrefixTransitive!0 (_2!3153 lt!112253) (_2!3153 lt!113343) (_2!3153 lt!113334)))))

(assert (=> b!70383 (isPrefixOf!0 (_2!3153 lt!112253) (_2!3153 lt!113334))))

(declare-fun lt!113330 () Unit!4685)

(assert (=> b!70383 (= lt!113330 lt!113361)))

(assert (=> b!70383 (= (size!1352 (buf!1733 (_2!3153 lt!113334))) (size!1352 (buf!1733 (_2!3153 lt!112253))))))

(declare-fun lt!113325 () Unit!4685)

(declare-fun Unit!4712 () Unit!4685)

(assert (=> b!70383 (= lt!113325 Unit!4712)))

(assert (=> b!70383 (= (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!113334))) (currentByte!3441 (_2!3153 lt!113334)) (currentBit!3436 (_2!3153 lt!113334))) (bvsub (bvadd (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112253))) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!113336 () Unit!4685)

(declare-fun Unit!4713 () Unit!4685)

(assert (=> b!70383 (= lt!113336 Unit!4713)))

(assert (=> b!70383 (= (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!113334))) (currentByte!3441 (_2!3153 lt!113334)) (currentBit!3436 (_2!3153 lt!113334))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!113343))) (currentByte!3441 (_2!3153 lt!113343)) (currentBit!3436 (_2!3153 lt!113343))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!113344 () Unit!4685)

(declare-fun Unit!4714 () Unit!4685)

(assert (=> b!70383 (= lt!113344 Unit!4714)))

(declare-fun lt!113353 () tuple2!6086)

(assert (=> b!70383 (= lt!113353 call!913)))

(declare-fun lt!113349 () (_ BitVec 64))

(assert (=> b!70383 (= lt!113349 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!113347 () Unit!4685)

(assert (=> b!70383 (= lt!113347 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3153 lt!112253) (buf!1733 (_2!3153 lt!113334)) lt!113349))))

(assert (=> b!70383 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!113334)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253))) lt!113349)))

(declare-fun lt!113320 () Unit!4685)

(assert (=> b!70383 (= lt!113320 lt!113347)))

(declare-fun lt!113331 () tuple2!6086)

(assert (=> b!70383 (= lt!113331 (reader!0 (_2!3153 lt!113343) (_2!3153 lt!113334)))))

(declare-fun lt!113329 () (_ BitVec 64))

(assert (=> b!70383 (= lt!113329 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!113341 () Unit!4685)

(assert (=> b!70383 (= lt!113341 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3153 lt!113343) (buf!1733 (_2!3153 lt!113334)) lt!113329))))

(assert (=> b!70383 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!113334)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!113343))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!113343))) lt!113329)))

(declare-fun lt!113354 () Unit!4685)

(assert (=> b!70383 (= lt!113354 lt!113341)))

(declare-fun lt!113321 () List!726)

(assert (=> b!70383 (= lt!113321 (byteArrayBitContentToList!0 (_2!3153 lt!113334) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!113332 () List!726)

(assert (=> b!70383 (= lt!113332 (byteArrayBitContentToList!0 (_2!3153 lt!113334) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!113351 () List!726)

(assert (=> b!70383 (= lt!113351 (bitStreamReadBitsIntoList!0 (_2!3153 lt!113334) (_1!3154 lt!113353) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!113339 () List!726)

(assert (=> b!70383 (= lt!113339 (bitStreamReadBitsIntoList!0 (_2!3153 lt!113334) (_1!3154 lt!113331) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!113342 () (_ BitVec 64))

(assert (=> b!70383 (= lt!113342 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!113327 () Unit!4685)

(assert (=> b!70383 (= lt!113327 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3153 lt!113334) (_2!3153 lt!113334) (_1!3154 lt!113353) (_1!3154 lt!113331) lt!113342 lt!113351))))

(assert (=> b!70383 (= (bitStreamReadBitsIntoList!0 (_2!3153 lt!113334) (_1!3154 lt!113331) (bvsub lt!113342 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!330 lt!113351))))

(declare-fun lt!113337 () Unit!4685)

(assert (=> b!70383 (= lt!113337 lt!113327)))

(declare-fun lt!113359 () Unit!4685)

(declare-fun lt!113322 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2908 array!2908 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4685)

(assert (=> b!70383 (= lt!113359 (arrayBitRangesEqImpliesEq!0 (buf!1733 (_2!3153 lt!113343)) (buf!1733 (_2!3153 lt!113334)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!113322 (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!113343))) (currentByte!3441 (_2!3153 lt!113343)) (currentBit!3436 (_2!3153 lt!113343)))))))

(assert (=> b!70383 (= (bitAt!0 (buf!1733 (_2!3153 lt!113343)) lt!113322) (bitAt!0 (buf!1733 (_2!3153 lt!113334)) lt!113322))))

(declare-fun lt!113355 () Unit!4685)

(assert (=> b!70383 (= lt!113355 lt!113359)))

(declare-fun b!70384 () Bool)

(declare-fun res!58055 () Bool)

(declare-fun e!45861 () Bool)

(assert (=> b!70384 (=> (not res!58055) (not e!45861))))

(declare-fun lt!113326 () tuple2!6084)

(assert (=> b!70384 (= res!58055 (invariant!0 (currentBit!3436 (_2!3153 lt!113326)) (currentByte!3441 (_2!3153 lt!113326)) (size!1352 (buf!1733 (_2!3153 lt!113326)))))))

(declare-fun b!70385 () Bool)

(declare-fun res!58056 () Bool)

(assert (=> b!70385 (=> (not res!58056) (not e!45861))))

(assert (=> b!70385 (= res!58056 (= (size!1352 (buf!1733 (_2!3153 lt!113326))) (size!1352 (buf!1733 (_2!3153 lt!112253)))))))

(declare-fun b!70386 () Bool)

(declare-fun res!58058 () Bool)

(assert (=> b!70386 (=> (not res!58058) (not e!45861))))

(assert (=> b!70386 (= res!58058 (isPrefixOf!0 (_2!3153 lt!112253) (_2!3153 lt!113326)))))

(declare-fun b!70387 () Bool)

(declare-fun e!45862 () Bool)

(declare-fun lt!113328 () (_ BitVec 64))

(assert (=> b!70387 (= e!45862 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253))) lt!113328))))

(declare-fun b!70388 () Bool)

(declare-fun Unit!4715 () Unit!4685)

(assert (=> b!70388 (= e!45860 (tuple2!6085 Unit!4715 (_2!3153 lt!112253)))))

(assert (=> b!70388 (= (size!1352 (buf!1733 (_2!3153 lt!112253))) (size!1352 (buf!1733 (_2!3153 lt!112253))))))

(declare-fun lt!113335 () Unit!4685)

(declare-fun Unit!4716 () Unit!4685)

(assert (=> b!70388 (= lt!113335 Unit!4716)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2302 array!2908 array!2908 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!70388 (checkByteArrayBitContent!0 (_2!3153 lt!112253) srcBuffer!2 (_1!3172 (readBits!0 (_1!3154 call!913) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!22504 () Bool)

(assert (=> d!22504 e!45861))

(declare-fun res!58057 () Bool)

(assert (=> d!22504 (=> (not res!58057) (not e!45861))))

(declare-fun lt!113356 () (_ BitVec 64))

(assert (=> d!22504 (= res!58057 (= (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!113326))) (currentByte!3441 (_2!3153 lt!113326)) (currentBit!3436 (_2!3153 lt!113326))) (bvsub lt!113356 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!22504 (or (= (bvand lt!113356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113356 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!113324 () (_ BitVec 64))

(assert (=> d!22504 (= lt!113356 (bvadd lt!113324 to!314))))

(assert (=> d!22504 (or (not (= (bvand lt!113324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!113324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!113324 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22504 (= lt!113324 (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112253))) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253))))))

(assert (=> d!22504 (= lt!113326 e!45860)))

(assert (=> d!22504 (= c!5260 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!113323 () Unit!4685)

(declare-fun lt!113346 () Unit!4685)

(assert (=> d!22504 (= lt!113323 lt!113346)))

(assert (=> d!22504 (isPrefixOf!0 (_2!3153 lt!112253) (_2!3153 lt!112253))))

(assert (=> d!22504 (= lt!113346 (lemmaIsPrefixRefl!0 (_2!3153 lt!112253)))))

(assert (=> d!22504 (= lt!113322 (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112253))) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253))))))

(assert (=> d!22504 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22504 (= (appendBitsMSBFirstLoop!0 (_2!3153 lt!112253) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!113326)))

(declare-fun b!70389 () Bool)

(declare-fun lt!113333 () tuple2!6086)

(assert (=> b!70389 (= e!45861 (= (bitStreamReadBitsIntoList!0 (_2!3153 lt!113326) (_1!3154 lt!113333) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3153 lt!113326) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!70389 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70389 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!113350 () Unit!4685)

(declare-fun lt!113352 () Unit!4685)

(assert (=> b!70389 (= lt!113350 lt!113352)))

(assert (=> b!70389 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!113326)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112253))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112253))) lt!113328)))

(assert (=> b!70389 (= lt!113352 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3153 lt!112253) (buf!1733 (_2!3153 lt!113326)) lt!113328))))

(assert (=> b!70389 e!45862))

(declare-fun res!58059 () Bool)

(assert (=> b!70389 (=> (not res!58059) (not e!45862))))

(assert (=> b!70389 (= res!58059 (and (= (size!1352 (buf!1733 (_2!3153 lt!112253))) (size!1352 (buf!1733 (_2!3153 lt!113326)))) (bvsge lt!113328 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70389 (= lt!113328 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!70389 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70389 (= lt!113333 (reader!0 (_2!3153 lt!112253) (_2!3153 lt!113326)))))

(declare-fun b!70390 () Bool)

(declare-fun res!58060 () Bool)

(assert (=> b!70390 (=> (not res!58060) (not e!45861))))

(assert (=> b!70390 (= res!58060 (= (size!1352 (buf!1733 (_2!3153 lt!112253))) (size!1352 (buf!1733 (_2!3153 lt!113326)))))))

(assert (= (and d!22504 c!5260) b!70383))

(assert (= (and d!22504 (not c!5260)) b!70388))

(assert (= (or b!70383 b!70388) bm!910))

(assert (= (and d!22504 res!58057) b!70384))

(assert (= (and b!70384 res!58055) b!70390))

(assert (= (and b!70390 res!58060) b!70386))

(assert (= (and b!70386 res!58058) b!70385))

(assert (= (and b!70385 res!58056) b!70389))

(assert (= (and b!70389 res!58059) b!70387))

(declare-fun m!112735 () Bool)

(assert (=> bm!910 m!112735))

(declare-fun m!112737 () Bool)

(assert (=> b!70384 m!112737))

(declare-fun m!112739 () Bool)

(assert (=> d!22504 m!112739))

(assert (=> d!22504 m!111759))

(assert (=> d!22504 m!112135))

(assert (=> d!22504 m!112141))

(declare-fun m!112741 () Bool)

(assert (=> b!70387 m!112741))

(declare-fun m!112743 () Bool)

(assert (=> b!70386 m!112743))

(declare-fun m!112745 () Bool)

(assert (=> b!70383 m!112745))

(declare-fun m!112747 () Bool)

(assert (=> b!70383 m!112747))

(declare-fun m!112749 () Bool)

(assert (=> b!70383 m!112749))

(declare-fun m!112751 () Bool)

(assert (=> b!70383 m!112751))

(declare-fun m!112753 () Bool)

(assert (=> b!70383 m!112753))

(declare-fun m!112755 () Bool)

(assert (=> b!70383 m!112755))

(declare-fun m!112757 () Bool)

(assert (=> b!70383 m!112757))

(declare-fun m!112759 () Bool)

(assert (=> b!70383 m!112759))

(assert (=> b!70383 m!112751))

(declare-fun m!112761 () Bool)

(assert (=> b!70383 m!112761))

(declare-fun m!112763 () Bool)

(assert (=> b!70383 m!112763))

(declare-fun m!112765 () Bool)

(assert (=> b!70383 m!112765))

(declare-fun m!112767 () Bool)

(assert (=> b!70383 m!112767))

(declare-fun m!112771 () Bool)

(assert (=> b!70383 m!112771))

(declare-fun m!112773 () Bool)

(assert (=> b!70383 m!112773))

(assert (=> b!70383 m!111759))

(assert (=> b!70383 m!112767))

(declare-fun m!112775 () Bool)

(assert (=> b!70383 m!112775))

(declare-fun m!112777 () Bool)

(assert (=> b!70383 m!112777))

(declare-fun m!112779 () Bool)

(assert (=> b!70383 m!112779))

(declare-fun m!112781 () Bool)

(assert (=> b!70383 m!112781))

(declare-fun m!112783 () Bool)

(assert (=> b!70383 m!112783))

(declare-fun m!112785 () Bool)

(assert (=> b!70383 m!112785))

(assert (=> b!70383 m!112777))

(declare-fun m!112787 () Bool)

(assert (=> b!70383 m!112787))

(declare-fun m!112789 () Bool)

(assert (=> b!70383 m!112789))

(declare-fun m!112791 () Bool)

(assert (=> b!70383 m!112791))

(declare-fun m!112793 () Bool)

(assert (=> b!70383 m!112793))

(declare-fun m!112795 () Bool)

(assert (=> b!70383 m!112795))

(declare-fun m!112797 () Bool)

(assert (=> b!70383 m!112797))

(declare-fun m!112799 () Bool)

(assert (=> b!70383 m!112799))

(declare-fun m!112801 () Bool)

(assert (=> b!70383 m!112801))

(declare-fun m!112803 () Bool)

(assert (=> b!70383 m!112803))

(declare-fun m!112805 () Bool)

(assert (=> b!70383 m!112805))

(assert (=> b!70383 m!112795))

(declare-fun m!112807 () Bool)

(assert (=> b!70383 m!112807))

(declare-fun m!112809 () Bool)

(assert (=> b!70388 m!112809))

(declare-fun m!112811 () Bool)

(assert (=> b!70388 m!112811))

(declare-fun m!112813 () Bool)

(assert (=> b!70389 m!112813))

(declare-fun m!112815 () Bool)

(assert (=> b!70389 m!112815))

(declare-fun m!112817 () Bool)

(assert (=> b!70389 m!112817))

(declare-fun m!112819 () Bool)

(assert (=> b!70389 m!112819))

(declare-fun m!112821 () Bool)

(assert (=> b!70389 m!112821))

(assert (=> b!69835 d!22504))

(declare-fun d!22632 () Bool)

(assert (=> d!22632 (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!113372 () Unit!4685)

(assert (=> d!22632 (= lt!113372 (choose!9 thiss!1379 (buf!1733 (_2!3153 lt!112253)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2303 (buf!1733 (_2!3153 lt!112253)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379))))))

(assert (=> d!22632 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1733 (_2!3153 lt!112253)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!113372)))

(declare-fun bs!5426 () Bool)

(assert (= bs!5426 d!22632))

(assert (=> bs!5426 m!111837))

(declare-fun m!112823 () Bool)

(assert (=> bs!5426 m!112823))

(assert (=> b!69835 d!22632))

(declare-fun d!22634 () Bool)

(declare-fun res!58068 () Bool)

(declare-fun e!45867 () Bool)

(assert (=> d!22634 (=> (not res!58068) (not e!45867))))

(assert (=> d!22634 (= res!58068 (= (size!1352 (buf!1733 (_2!3153 lt!112253))) (size!1352 (buf!1733 (_2!3153 lt!112271)))))))

(assert (=> d!22634 (= (isPrefixOf!0 (_2!3153 lt!112253) (_2!3153 lt!112271)) e!45867)))

(declare-fun b!70396 () Bool)

(declare-fun res!58066 () Bool)

(assert (=> b!70396 (=> (not res!58066) (not e!45867))))

(assert (=> b!70396 (= res!58066 (bvsle (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112253))) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253))) (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112271))) (currentByte!3441 (_2!3153 lt!112271)) (currentBit!3436 (_2!3153 lt!112271)))))))

(declare-fun b!70397 () Bool)

(declare-fun e!45866 () Bool)

(assert (=> b!70397 (= e!45867 e!45866)))

(declare-fun res!58067 () Bool)

(assert (=> b!70397 (=> res!58067 e!45866)))

(assert (=> b!70397 (= res!58067 (= (size!1352 (buf!1733 (_2!3153 lt!112253))) #b00000000000000000000000000000000))))

(declare-fun b!70398 () Bool)

(assert (=> b!70398 (= e!45866 (arrayBitRangesEq!0 (buf!1733 (_2!3153 lt!112253)) (buf!1733 (_2!3153 lt!112271)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112253))) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253)))))))

(assert (= (and d!22634 res!58068) b!70396))

(assert (= (and b!70396 res!58066) b!70397))

(assert (= (and b!70397 (not res!58067)) b!70398))

(assert (=> b!70396 m!111759))

(assert (=> b!70396 m!111821))

(assert (=> b!70398 m!111759))

(assert (=> b!70398 m!111759))

(declare-fun m!112825 () Bool)

(assert (=> b!70398 m!112825))

(assert (=> b!69835 d!22634))

(declare-fun d!22636 () Bool)

(assert (=> d!22636 (isPrefixOf!0 thiss!1379 (_2!3153 lt!112271))))

(declare-fun lt!113375 () Unit!4685)

(declare-fun choose!30 (BitStream!2302 BitStream!2302 BitStream!2302) Unit!4685)

(assert (=> d!22636 (= lt!113375 (choose!30 thiss!1379 (_2!3153 lt!112253) (_2!3153 lt!112271)))))

(assert (=> d!22636 (isPrefixOf!0 thiss!1379 (_2!3153 lt!112253))))

(assert (=> d!22636 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3153 lt!112253) (_2!3153 lt!112271)) lt!113375)))

(declare-fun bs!5427 () Bool)

(assert (= bs!5427 d!22636))

(assert (=> bs!5427 m!111835))

(declare-fun m!112827 () Bool)

(assert (=> bs!5427 m!112827))

(assert (=> bs!5427 m!111803))

(assert (=> b!69835 d!22636))

(declare-fun d!22638 () Bool)

(declare-fun e!45868 () Bool)

(assert (=> d!22638 e!45868))

(declare-fun res!58070 () Bool)

(assert (=> d!22638 (=> (not res!58070) (not e!45868))))

(declare-fun lt!113390 () tuple2!6086)

(assert (=> d!22638 (= res!58070 (isPrefixOf!0 (_1!3154 lt!113390) (_2!3154 lt!113390)))))

(declare-fun lt!113383 () BitStream!2302)

(assert (=> d!22638 (= lt!113390 (tuple2!6087 lt!113383 (_2!3153 lt!112253)))))

(declare-fun lt!113379 () Unit!4685)

(declare-fun lt!113395 () Unit!4685)

(assert (=> d!22638 (= lt!113379 lt!113395)))

(assert (=> d!22638 (isPrefixOf!0 lt!113383 (_2!3153 lt!112253))))

(assert (=> d!22638 (= lt!113395 (lemmaIsPrefixTransitive!0 lt!113383 (_2!3153 lt!112253) (_2!3153 lt!112253)))))

(declare-fun lt!113393 () Unit!4685)

(declare-fun lt!113389 () Unit!4685)

(assert (=> d!22638 (= lt!113393 lt!113389)))

(assert (=> d!22638 (isPrefixOf!0 lt!113383 (_2!3153 lt!112253))))

(assert (=> d!22638 (= lt!113389 (lemmaIsPrefixTransitive!0 lt!113383 thiss!1379 (_2!3153 lt!112253)))))

(declare-fun lt!113380 () Unit!4685)

(declare-fun e!45869 () Unit!4685)

(assert (=> d!22638 (= lt!113380 e!45869)))

(declare-fun c!5261 () Bool)

(assert (=> d!22638 (= c!5261 (not (= (size!1352 (buf!1733 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!113382 () Unit!4685)

(declare-fun lt!113388 () Unit!4685)

(assert (=> d!22638 (= lt!113382 lt!113388)))

(assert (=> d!22638 (isPrefixOf!0 (_2!3153 lt!112253) (_2!3153 lt!112253))))

(assert (=> d!22638 (= lt!113388 (lemmaIsPrefixRefl!0 (_2!3153 lt!112253)))))

(declare-fun lt!113391 () Unit!4685)

(declare-fun lt!113381 () Unit!4685)

(assert (=> d!22638 (= lt!113391 lt!113381)))

(assert (=> d!22638 (= lt!113381 (lemmaIsPrefixRefl!0 (_2!3153 lt!112253)))))

(declare-fun lt!113384 () Unit!4685)

(declare-fun lt!113377 () Unit!4685)

(assert (=> d!22638 (= lt!113384 lt!113377)))

(assert (=> d!22638 (isPrefixOf!0 lt!113383 lt!113383)))

(assert (=> d!22638 (= lt!113377 (lemmaIsPrefixRefl!0 lt!113383))))

(declare-fun lt!113392 () Unit!4685)

(declare-fun lt!113376 () Unit!4685)

(assert (=> d!22638 (= lt!113392 lt!113376)))

(assert (=> d!22638 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22638 (= lt!113376 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22638 (= lt!113383 (BitStream!2303 (buf!1733 (_2!3153 lt!112253)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)))))

(assert (=> d!22638 (isPrefixOf!0 thiss!1379 (_2!3153 lt!112253))))

(assert (=> d!22638 (= (reader!0 thiss!1379 (_2!3153 lt!112253)) lt!113390)))

(declare-fun b!70399 () Bool)

(declare-fun res!58069 () Bool)

(assert (=> b!70399 (=> (not res!58069) (not e!45868))))

(assert (=> b!70399 (= res!58069 (isPrefixOf!0 (_1!3154 lt!113390) thiss!1379))))

(declare-fun lt!113378 () (_ BitVec 64))

(declare-fun b!70400 () Bool)

(declare-fun lt!113385 () (_ BitVec 64))

(assert (=> b!70400 (= e!45868 (= (_1!3154 lt!113390) (withMovedBitIndex!0 (_2!3154 lt!113390) (bvsub lt!113378 lt!113385))))))

(assert (=> b!70400 (or (= (bvand lt!113378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113385 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113378 lt!113385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70400 (= lt!113385 (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112253))) (currentByte!3441 (_2!3153 lt!112253)) (currentBit!3436 (_2!3153 lt!112253))))))

(assert (=> b!70400 (= lt!113378 (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)))))

(declare-fun b!70401 () Bool)

(declare-fun lt!113394 () Unit!4685)

(assert (=> b!70401 (= e!45869 lt!113394)))

(declare-fun lt!113386 () (_ BitVec 64))

(assert (=> b!70401 (= lt!113386 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!113387 () (_ BitVec 64))

(assert (=> b!70401 (= lt!113387 (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)))))

(assert (=> b!70401 (= lt!113394 (arrayBitRangesEqSymmetric!0 (buf!1733 thiss!1379) (buf!1733 (_2!3153 lt!112253)) lt!113386 lt!113387))))

(assert (=> b!70401 (arrayBitRangesEq!0 (buf!1733 (_2!3153 lt!112253)) (buf!1733 thiss!1379) lt!113386 lt!113387)))

(declare-fun b!70402 () Bool)

(declare-fun res!58071 () Bool)

(assert (=> b!70402 (=> (not res!58071) (not e!45868))))

(assert (=> b!70402 (= res!58071 (isPrefixOf!0 (_2!3154 lt!113390) (_2!3153 lt!112253)))))

(declare-fun b!70403 () Bool)

(declare-fun Unit!4718 () Unit!4685)

(assert (=> b!70403 (= e!45869 Unit!4718)))

(assert (= (and d!22638 c!5261) b!70401))

(assert (= (and d!22638 (not c!5261)) b!70403))

(assert (= (and d!22638 res!58070) b!70399))

(assert (= (and b!70399 res!58069) b!70402))

(assert (= (and b!70402 res!58071) b!70400))

(assert (=> d!22638 m!111753))

(declare-fun m!112829 () Bool)

(assert (=> d!22638 m!112829))

(declare-fun m!112831 () Bool)

(assert (=> d!22638 m!112831))

(assert (=> d!22638 m!112135))

(assert (=> d!22638 m!111803))

(assert (=> d!22638 m!111755))

(declare-fun m!112833 () Bool)

(assert (=> d!22638 m!112833))

(declare-fun m!112835 () Bool)

(assert (=> d!22638 m!112835))

(declare-fun m!112837 () Bool)

(assert (=> d!22638 m!112837))

(assert (=> d!22638 m!112141))

(declare-fun m!112839 () Bool)

(assert (=> d!22638 m!112839))

(declare-fun m!112841 () Bool)

(assert (=> b!70399 m!112841))

(assert (=> b!70401 m!111757))

(declare-fun m!112843 () Bool)

(assert (=> b!70401 m!112843))

(declare-fun m!112845 () Bool)

(assert (=> b!70401 m!112845))

(declare-fun m!112847 () Bool)

(assert (=> b!70402 m!112847))

(declare-fun m!112849 () Bool)

(assert (=> b!70400 m!112849))

(assert (=> b!70400 m!111759))

(assert (=> b!70400 m!111757))

(assert (=> b!69835 d!22638))

(declare-fun d!22640 () Bool)

(assert (=> d!22640 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112253)))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5428 () Bool)

(assert (= bs!5428 d!22640))

(declare-fun m!112851 () Bool)

(assert (=> bs!5428 m!112851))

(assert (=> b!69835 d!22640))

(declare-fun d!22642 () Bool)

(assert (=> d!22642 (= (head!545 (byteArrayBitContentToList!0 (_2!3153 lt!112271) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!841 (byteArrayBitContentToList!0 (_2!3153 lt!112271) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!69834 d!22642))

(declare-fun d!22644 () Bool)

(declare-fun c!5262 () Bool)

(assert (=> d!22644 (= c!5262 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45870 () List!726)

(assert (=> d!22644 (= (byteArrayBitContentToList!0 (_2!3153 lt!112271) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!45870)))

(declare-fun b!70404 () Bool)

(assert (=> b!70404 (= e!45870 Nil!723)))

(declare-fun b!70405 () Bool)

(assert (=> b!70405 (= e!45870 (Cons!722 (not (= (bvand ((_ sign_extend 24) (select (arr!1934 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3153 lt!112271) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22644 c!5262) b!70404))

(assert (= (and d!22644 (not c!5262)) b!70405))

(assert (=> b!70405 m!111801))

(assert (=> b!70405 m!112177))

(declare-fun m!112853 () Bool)

(assert (=> b!70405 m!112853))

(assert (=> b!69834 d!22644))

(declare-fun d!22646 () Bool)

(assert (=> d!22646 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1934 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5429 () Bool)

(assert (= bs!5429 d!22646))

(assert (=> bs!5429 m!111801))

(assert (=> bs!5429 m!112177))

(assert (=> b!69834 d!22646))

(declare-fun d!22648 () Bool)

(assert (=> d!22648 (= (array_inv!1210 srcBuffer!2) (bvsge (size!1352 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13644 d!22648))

(declare-fun d!22650 () Bool)

(assert (=> d!22650 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3436 thiss!1379) (currentByte!3441 thiss!1379) (size!1352 (buf!1733 thiss!1379))))))

(declare-fun bs!5430 () Bool)

(assert (= bs!5430 d!22650))

(declare-fun m!112855 () Bool)

(assert (=> bs!5430 m!112855))

(assert (=> start!13644 d!22650))

(declare-fun d!22652 () Bool)

(declare-fun e!45871 () Bool)

(assert (=> d!22652 e!45871))

(declare-fun res!58073 () Bool)

(assert (=> d!22652 (=> (not res!58073) (not e!45871))))

(declare-fun lt!113397 () (_ BitVec 64))

(declare-fun lt!113396 () (_ BitVec 64))

(declare-fun lt!113401 () (_ BitVec 64))

(assert (=> d!22652 (= res!58073 (= lt!113401 (bvsub lt!113397 lt!113396)))))

(assert (=> d!22652 (or (= (bvand lt!113397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113396 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113397 lt!113396) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22652 (= lt!113396 (remainingBits!0 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112271)))) ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112271))) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112271)))))))

(declare-fun lt!113398 () (_ BitVec 64))

(declare-fun lt!113400 () (_ BitVec 64))

(assert (=> d!22652 (= lt!113397 (bvmul lt!113398 lt!113400))))

(assert (=> d!22652 (or (= lt!113398 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!113400 (bvsdiv (bvmul lt!113398 lt!113400) lt!113398)))))

(assert (=> d!22652 (= lt!113400 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22652 (= lt!113398 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112271)))))))

(assert (=> d!22652 (= lt!113401 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3441 (_2!3153 lt!112271))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3436 (_2!3153 lt!112271)))))))

(assert (=> d!22652 (invariant!0 (currentBit!3436 (_2!3153 lt!112271)) (currentByte!3441 (_2!3153 lt!112271)) (size!1352 (buf!1733 (_2!3153 lt!112271))))))

(assert (=> d!22652 (= (bitIndex!0 (size!1352 (buf!1733 (_2!3153 lt!112271))) (currentByte!3441 (_2!3153 lt!112271)) (currentBit!3436 (_2!3153 lt!112271))) lt!113401)))

(declare-fun b!70406 () Bool)

(declare-fun res!58072 () Bool)

(assert (=> b!70406 (=> (not res!58072) (not e!45871))))

(assert (=> b!70406 (= res!58072 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!113401))))

(declare-fun b!70407 () Bool)

(declare-fun lt!113399 () (_ BitVec 64))

(assert (=> b!70407 (= e!45871 (bvsle lt!113401 (bvmul lt!113399 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70407 (or (= lt!113399 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!113399 #b0000000000000000000000000000000000000000000000000000000000001000) lt!113399)))))

(assert (=> b!70407 (= lt!113399 ((_ sign_extend 32) (size!1352 (buf!1733 (_2!3153 lt!112271)))))))

(assert (= (and d!22652 res!58073) b!70406))

(assert (= (and b!70406 res!58072) b!70407))

(declare-fun m!112857 () Bool)

(assert (=> d!22652 m!112857))

(assert (=> d!22652 m!111795))

(assert (=> b!69823 d!22652))

(declare-fun d!22654 () Bool)

(declare-fun res!58076 () Bool)

(declare-fun e!45873 () Bool)

(assert (=> d!22654 (=> (not res!58076) (not e!45873))))

(assert (=> d!22654 (= res!58076 (= (size!1352 (buf!1733 thiss!1379)) (size!1352 (buf!1733 thiss!1379))))))

(assert (=> d!22654 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!45873)))

(declare-fun b!70408 () Bool)

(declare-fun res!58074 () Bool)

(assert (=> b!70408 (=> (not res!58074) (not e!45873))))

(assert (=> b!70408 (= res!58074 (bvsle (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)) (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379))))))

(declare-fun b!70409 () Bool)

(declare-fun e!45872 () Bool)

(assert (=> b!70409 (= e!45873 e!45872)))

(declare-fun res!58075 () Bool)

(assert (=> b!70409 (=> res!58075 e!45872)))

(assert (=> b!70409 (= res!58075 (= (size!1352 (buf!1733 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70410 () Bool)

(assert (=> b!70410 (= e!45872 (arrayBitRangesEq!0 (buf!1733 thiss!1379) (buf!1733 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379))))))

(assert (= (and d!22654 res!58076) b!70408))

(assert (= (and b!70408 res!58074) b!70409))

(assert (= (and b!70409 (not res!58075)) b!70410))

(assert (=> b!70408 m!111757))

(assert (=> b!70408 m!111757))

(assert (=> b!70410 m!111757))

(assert (=> b!70410 m!111757))

(declare-fun m!112859 () Bool)

(assert (=> b!70410 m!112859))

(assert (=> b!69822 d!22654))

(declare-fun d!22656 () Bool)

(assert (=> d!22656 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!113410 () Unit!4685)

(declare-fun choose!11 (BitStream!2302) Unit!4685)

(assert (=> d!22656 (= lt!113410 (choose!11 thiss!1379))))

(assert (=> d!22656 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!113410)))

(declare-fun bs!5432 () Bool)

(assert (= bs!5432 d!22656))

(assert (=> bs!5432 m!111753))

(declare-fun m!112861 () Bool)

(assert (=> bs!5432 m!112861))

(assert (=> b!69822 d!22656))

(declare-fun d!22658 () Bool)

(declare-fun e!45886 () Bool)

(assert (=> d!22658 e!45886))

(declare-fun res!58088 () Bool)

(assert (=> d!22658 (=> (not res!58088) (not e!45886))))

(declare-fun lt!113416 () (_ BitVec 64))

(declare-fun lt!113411 () (_ BitVec 64))

(declare-fun lt!113412 () (_ BitVec 64))

(assert (=> d!22658 (= res!58088 (= lt!113416 (bvsub lt!113412 lt!113411)))))

(assert (=> d!22658 (or (= (bvand lt!113412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113411 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113412 lt!113411) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22658 (= lt!113411 (remainingBits!0 ((_ sign_extend 32) (size!1352 (buf!1733 thiss!1379))) ((_ sign_extend 32) (currentByte!3441 thiss!1379)) ((_ sign_extend 32) (currentBit!3436 thiss!1379))))))

(declare-fun lt!113413 () (_ BitVec 64))

(declare-fun lt!113415 () (_ BitVec 64))

(assert (=> d!22658 (= lt!113412 (bvmul lt!113413 lt!113415))))

(assert (=> d!22658 (or (= lt!113413 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!113415 (bvsdiv (bvmul lt!113413 lt!113415) lt!113413)))))

(assert (=> d!22658 (= lt!113415 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22658 (= lt!113413 ((_ sign_extend 32) (size!1352 (buf!1733 thiss!1379))))))

(assert (=> d!22658 (= lt!113416 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3441 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3436 thiss!1379))))))

(assert (=> d!22658 (invariant!0 (currentBit!3436 thiss!1379) (currentByte!3441 thiss!1379) (size!1352 (buf!1733 thiss!1379)))))

(assert (=> d!22658 (= (bitIndex!0 (size!1352 (buf!1733 thiss!1379)) (currentByte!3441 thiss!1379) (currentBit!3436 thiss!1379)) lt!113416)))

(declare-fun b!70425 () Bool)

(declare-fun res!58087 () Bool)

(assert (=> b!70425 (=> (not res!58087) (not e!45886))))

(assert (=> b!70425 (= res!58087 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!113416))))

(declare-fun b!70426 () Bool)

(declare-fun lt!113414 () (_ BitVec 64))

(assert (=> b!70426 (= e!45886 (bvsle lt!113416 (bvmul lt!113414 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70426 (or (= lt!113414 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!113414 #b0000000000000000000000000000000000000000000000000000000000001000) lt!113414)))))

(assert (=> b!70426 (= lt!113414 ((_ sign_extend 32) (size!1352 (buf!1733 thiss!1379))))))

(assert (= (and d!22658 res!58088) b!70425))

(assert (= (and b!70425 res!58087) b!70426))

(assert (=> d!22658 m!112071))

(assert (=> d!22658 m!112855))

(assert (=> b!69822 d!22658))

(declare-fun d!22660 () Bool)

(assert (=> d!22660 (= (head!545 lt!112254) (h!841 lt!112254))))

(assert (=> b!69833 d!22660))

(push 1)

(assert (not b!70057))

(assert (not b!70045))

(assert (not d!22408))

(assert (not b!70389))

(assert (not b!70399))

(assert (not b!70080))

(assert (not b!70041))

(assert (not b!70405))

(assert (not d!22658))

(assert (not b!70408))

(assert (not d!22412))

(assert (not d!22632))

(assert (not b!70396))

(assert (not b!70384))

(assert (not b!70062))

(assert (not b!70073))

(assert (not d!22428))

(assert (not b!70162))

(assert (not b!70400))

(assert (not b!70040))

(assert (not bm!910))

(assert (not b!70387))

(assert (not b!70388))

(assert (not b!70085))

(assert (not b!70069))

(assert (not b!70046))

(assert (not d!22504))

(assert (not b!70058))

(assert (not d!22650))

(assert (not b!70044))

(assert (not b!70072))

(assert (not d!22420))

(assert (not d!22636))

(assert (not d!22436))

(assert (not d!22656))

(assert (not b!70160))

(assert (not d!22462))

(assert (not b!70402))

(assert (not b!70161))

(assert (not d!22652))

(assert (not b!70383))

(assert (not d!22418))

(assert (not b!70157))

(assert (not b!70082))

(assert (not d!22638))

(assert (not b!70039))

(assert (not b!70038))

(assert (not d!22426))

(assert (not b!70009))

(assert (not b!70061))

(assert (not b!70158))

(assert (not d!22422))

(assert (not b!70164))

(assert (not d!22500))

(assert (not b!70401))

(assert (not d!22416))

(assert (not d!22458))

(assert (not b!70167))

(assert (not b!70410))

(assert (not b!70398))

(assert (not b!70007))

(assert (not b!70163))

(assert (not b!70005))

(assert (not b!70170))

(assert (not b!70063))

(assert (not b!70159))

(assert (not bm!898))

(assert (not b!70071))

(assert (not b!70168))

(assert (not b!70043))

(assert (not b!70059))

(assert (not b!70386))

(assert (not d!22460))

(assert (not d!22640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

