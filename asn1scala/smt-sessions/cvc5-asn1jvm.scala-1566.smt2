; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44202 () Bool)

(assert start!44202)

(declare-fun b!210546 () Bool)

(declare-fun res!176780 () Bool)

(declare-fun e!143637 () Bool)

(assert (=> b!210546 (=> (not res!176780) (not e!143637))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!210546 (= res!176780 (not (= i!590 nBits!348)))))

(declare-fun b!210547 () Bool)

(declare-fun e!143630 () Bool)

(declare-fun e!143632 () Bool)

(assert (=> b!210547 (= e!143630 e!143632)))

(declare-fun res!176790 () Bool)

(assert (=> b!210547 (=> (not res!176790) (not e!143632))))

(declare-fun lt!330671 () (_ BitVec 64))

(declare-fun lt!330664 () (_ BitVec 64))

(assert (=> b!210547 (= res!176790 (= lt!330671 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!330664)))))

(declare-datatypes ((array!10490 0))(
  ( (array!10491 (arr!5539 (Array (_ BitVec 32) (_ BitVec 8))) (size!4609 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8326 0))(
  ( (BitStream!8327 (buf!5129 array!10490) (currentByte!9677 (_ BitVec 32)) (currentBit!9672 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15007 0))(
  ( (Unit!15008) )
))
(declare-datatypes ((tuple2!18038 0))(
  ( (tuple2!18039 (_1!9674 Unit!15007) (_2!9674 BitStream!8326)) )
))
(declare-fun lt!330648 () tuple2!18038)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210547 (= lt!330671 (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))))))

(declare-fun thiss!1204 () BitStream!8326)

(assert (=> b!210547 (= lt!330664 (bitIndex!0 (size!4609 (buf!5129 thiss!1204)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204)))))

(declare-fun b!210548 () Bool)

(declare-fun res!176791 () Bool)

(declare-fun e!143635 () Bool)

(assert (=> b!210548 (=> res!176791 e!143635)))

(declare-fun lt!330652 () tuple2!18038)

(declare-fun lt!330658 () (_ BitVec 64))

(declare-fun lt!330655 () (_ BitVec 64))

(assert (=> b!210548 (= res!176791 (or (not (= (size!4609 (buf!5129 (_2!9674 lt!330652))) (size!4609 (buf!5129 thiss!1204)))) (not (= lt!330658 (bvsub (bvadd lt!330655 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!210550 () Bool)

(declare-fun e!143638 () Bool)

(declare-datatypes ((tuple2!18040 0))(
  ( (tuple2!18041 (_1!9675 BitStream!8326) (_2!9675 Bool)) )
))
(declare-fun lt!330646 () tuple2!18040)

(declare-fun lt!330645 () tuple2!18040)

(assert (=> b!210550 (= e!143638 (= (_2!9675 lt!330646) (_2!9675 lt!330645)))))

(declare-fun b!210551 () Bool)

(declare-fun e!143639 () Bool)

(assert (=> b!210551 (= e!143639 e!143637)))

(declare-fun res!176787 () Bool)

(assert (=> b!210551 (=> (not res!176787) (not e!143637))))

(declare-fun lt!330661 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210551 (= res!176787 (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 thiss!1204))) ((_ sign_extend 32) (currentByte!9677 thiss!1204)) ((_ sign_extend 32) (currentBit!9672 thiss!1204)) lt!330661))))

(assert (=> b!210551 (= lt!330661 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!210552 () Bool)

(declare-fun e!143629 () Bool)

(assert (=> b!210552 (= e!143632 e!143629)))

(declare-fun res!176779 () Bool)

(assert (=> b!210552 (=> (not res!176779) (not e!143629))))

(declare-fun lt!330663 () Bool)

(declare-fun lt!330654 () tuple2!18040)

(assert (=> b!210552 (= res!176779 (and (= (_2!9675 lt!330654) lt!330663) (= (_1!9675 lt!330654) (_2!9674 lt!330648))))))

(declare-fun readBitPure!0 (BitStream!8326) tuple2!18040)

(declare-fun readerFrom!0 (BitStream!8326 (_ BitVec 32) (_ BitVec 32)) BitStream!8326)

(assert (=> b!210552 (= lt!330654 (readBitPure!0 (readerFrom!0 (_2!9674 lt!330648) (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204))))))

(declare-fun b!210553 () Bool)

(declare-fun e!143636 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!210553 (= e!143636 (invariant!0 (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204) (size!4609 (buf!5129 (_2!9674 lt!330652)))))))

(declare-fun b!210554 () Bool)

(declare-fun e!143634 () Bool)

(assert (=> b!210554 (= e!143635 e!143634)))

(declare-fun res!176785 () Bool)

(assert (=> b!210554 (=> res!176785 e!143634)))

(declare-fun lt!330660 () (_ BitVec 64))

(declare-datatypes ((tuple2!18042 0))(
  ( (tuple2!18043 (_1!9676 BitStream!8326) (_2!9676 BitStream!8326)) )
))
(declare-fun lt!330668 () tuple2!18042)

(declare-datatypes ((tuple2!18044 0))(
  ( (tuple2!18045 (_1!9677 BitStream!8326) (_2!9677 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18044)

(assert (=> b!210554 (= res!176785 (not (= (_1!9677 (readNBitsLSBFirstsLoopPure!0 (_1!9676 lt!330668) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330660)) (_2!9676 lt!330668))))))

(declare-fun lt!330666 () (_ BitVec 64))

(assert (=> b!210554 (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330652)))) ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330648))) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330648))) lt!330666)))

(declare-fun lt!330665 () Unit!15007)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8326 array!10490 (_ BitVec 64)) Unit!15007)

(assert (=> b!210554 (= lt!330665 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9674 lt!330648) (buf!5129 (_2!9674 lt!330652)) lt!330666))))

(assert (=> b!210554 (= lt!330666 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!330657 () (_ BitVec 64))

(declare-fun lt!330649 () tuple2!18040)

(declare-fun lt!330656 () (_ BitVec 64))

(assert (=> b!210554 (= lt!330660 (bvor lt!330657 (ite (_2!9675 lt!330649) lt!330656 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!330651 () tuple2!18044)

(declare-fun lt!330667 () tuple2!18042)

(assert (=> b!210554 (= lt!330651 (readNBitsLSBFirstsLoopPure!0 (_1!9676 lt!330667) nBits!348 i!590 lt!330657))))

(assert (=> b!210554 (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330652)))) ((_ sign_extend 32) (currentByte!9677 thiss!1204)) ((_ sign_extend 32) (currentBit!9672 thiss!1204)) lt!330661)))

(declare-fun lt!330653 () Unit!15007)

(assert (=> b!210554 (= lt!330653 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5129 (_2!9674 lt!330652)) lt!330661))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210554 (= lt!330657 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!210554 (= (_2!9675 lt!330649) lt!330663)))

(assert (=> b!210554 (= lt!330649 (readBitPure!0 (_1!9676 lt!330667)))))

(declare-fun reader!0 (BitStream!8326 BitStream!8326) tuple2!18042)

(assert (=> b!210554 (= lt!330668 (reader!0 (_2!9674 lt!330648) (_2!9674 lt!330652)))))

(assert (=> b!210554 (= lt!330667 (reader!0 thiss!1204 (_2!9674 lt!330652)))))

(assert (=> b!210554 e!143638))

(declare-fun res!176782 () Bool)

(assert (=> b!210554 (=> (not res!176782) (not e!143638))))

(assert (=> b!210554 (= res!176782 (= (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!330646))) (currentByte!9677 (_1!9675 lt!330646)) (currentBit!9672 (_1!9675 lt!330646))) (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!330645))) (currentByte!9677 (_1!9675 lt!330645)) (currentBit!9672 (_1!9675 lt!330645)))))))

(declare-fun lt!330644 () Unit!15007)

(declare-fun lt!330650 () BitStream!8326)

(declare-fun readBitPrefixLemma!0 (BitStream!8326 BitStream!8326) Unit!15007)

(assert (=> b!210554 (= lt!330644 (readBitPrefixLemma!0 lt!330650 (_2!9674 lt!330652)))))

(assert (=> b!210554 (= lt!330645 (readBitPure!0 (BitStream!8327 (buf!5129 (_2!9674 lt!330652)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204))))))

(assert (=> b!210554 (= lt!330646 (readBitPure!0 lt!330650))))

(assert (=> b!210554 e!143636))

(declare-fun res!176775 () Bool)

(assert (=> b!210554 (=> (not res!176775) (not e!143636))))

(assert (=> b!210554 (= res!176775 (invariant!0 (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204) (size!4609 (buf!5129 (_2!9674 lt!330648)))))))

(assert (=> b!210554 (= lt!330650 (BitStream!8327 (buf!5129 (_2!9674 lt!330648)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204)))))

(declare-fun b!210555 () Bool)

(declare-fun res!176788 () Bool)

(assert (=> b!210555 (=> res!176788 e!143635)))

(declare-fun isPrefixOf!0 (BitStream!8326 BitStream!8326) Bool)

(assert (=> b!210555 (= res!176788 (not (isPrefixOf!0 (_2!9674 lt!330648) (_2!9674 lt!330652))))))

(declare-fun b!210556 () Bool)

(declare-fun res!176783 () Bool)

(assert (=> b!210556 (=> res!176783 e!143635)))

(assert (=> b!210556 (= res!176783 (not (invariant!0 (currentBit!9672 (_2!9674 lt!330652)) (currentByte!9677 (_2!9674 lt!330652)) (size!4609 (buf!5129 (_2!9674 lt!330652))))))))

(declare-fun b!210557 () Bool)

(declare-fun e!143640 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!8326 (_ BitVec 64)) BitStream!8326)

(assert (=> b!210557 (= e!143640 (= (_1!9676 lt!330667) (withMovedBitIndex!0 (_2!9676 lt!330667) (bvsub lt!330655 lt!330658))))))

(declare-fun b!210558 () Bool)

(declare-fun res!176786 () Bool)

(assert (=> b!210558 (=> res!176786 e!143635)))

(assert (=> b!210558 (= res!176786 (not (isPrefixOf!0 thiss!1204 (_2!9674 lt!330648))))))

(declare-fun lt!330647 () (_ BitVec 64))

(declare-fun lt!330670 () (_ BitVec 64))

(declare-fun b!210559 () Bool)

(assert (=> b!210559 (= e!143634 (or (= lt!330647 (bvand lt!330658 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!330647 (bvand (bvsub lt!330670 lt!330658) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210559 (= lt!330647 (bvand lt!330670 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!210559 e!143640))

(declare-fun res!176778 () Bool)

(assert (=> b!210559 (=> (not res!176778) (not e!143640))))

(declare-fun lt!330669 () tuple2!18044)

(assert (=> b!210559 (= res!176778 (and (= (_2!9677 lt!330651) (_2!9677 lt!330669)) (= (_1!9677 lt!330651) (_1!9677 lt!330669))))))

(declare-fun lt!330662 () Unit!15007)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15007)

(assert (=> b!210559 (= lt!330662 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9676 lt!330667) nBits!348 i!590 lt!330657))))

(assert (=> b!210559 (= lt!330669 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9676 lt!330667) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330660))))

(declare-fun b!210560 () Bool)

(declare-fun e!143631 () Bool)

(assert (=> b!210560 (= e!143631 e!143635)))

(declare-fun res!176781 () Bool)

(assert (=> b!210560 (=> res!176781 e!143635)))

(assert (=> b!210560 (= res!176781 (not (= lt!330658 (bvsub (bvsub (bvadd lt!330670 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!210560 (= lt!330658 (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330652))) (currentByte!9677 (_2!9674 lt!330652)) (currentBit!9672 (_2!9674 lt!330652))))))

(assert (=> b!210560 (isPrefixOf!0 thiss!1204 (_2!9674 lt!330652))))

(declare-fun lt!330659 () Unit!15007)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8326 BitStream!8326 BitStream!8326) Unit!15007)

(assert (=> b!210560 (= lt!330659 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9674 lt!330648) (_2!9674 lt!330652)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8326 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18038)

(assert (=> b!210560 (= lt!330652 (appendBitsLSBFirstLoopTR!0 (_2!9674 lt!330648) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!210561 () Bool)

(declare-fun res!176792 () Bool)

(assert (=> b!210561 (=> (not res!176792) (not e!143632))))

(assert (=> b!210561 (= res!176792 (isPrefixOf!0 thiss!1204 (_2!9674 lt!330648)))))

(declare-fun b!210562 () Bool)

(declare-fun res!176789 () Bool)

(assert (=> b!210562 (=> (not res!176789) (not e!143637))))

(assert (=> b!210562 (= res!176789 (invariant!0 (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204) (size!4609 (buf!5129 thiss!1204))))))

(declare-fun b!210549 () Bool)

(declare-fun e!143633 () Bool)

(declare-fun array_inv!4350 (array!10490) Bool)

(assert (=> b!210549 (= e!143633 (array_inv!4350 (buf!5129 thiss!1204)))))

(declare-fun res!176777 () Bool)

(assert (=> start!44202 (=> (not res!176777) (not e!143639))))

(assert (=> start!44202 (= res!176777 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44202 e!143639))

(assert (=> start!44202 true))

(declare-fun inv!12 (BitStream!8326) Bool)

(assert (=> start!44202 (and (inv!12 thiss!1204) e!143633)))

(declare-fun b!210563 () Bool)

(assert (=> b!210563 (= e!143629 (= (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!330654))) (currentByte!9677 (_1!9675 lt!330654)) (currentBit!9672 (_1!9675 lt!330654))) lt!330671))))

(declare-fun b!210564 () Bool)

(assert (=> b!210564 (= e!143637 (not e!143631))))

(declare-fun res!176776 () Bool)

(assert (=> b!210564 (=> res!176776 e!143631)))

(assert (=> b!210564 (= res!176776 (not (= lt!330670 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!330655))))))

(assert (=> b!210564 (= lt!330670 (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))))))

(assert (=> b!210564 (= lt!330655 (bitIndex!0 (size!4609 (buf!5129 thiss!1204)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204)))))

(assert (=> b!210564 e!143630))

(declare-fun res!176784 () Bool)

(assert (=> b!210564 (=> (not res!176784) (not e!143630))))

(assert (=> b!210564 (= res!176784 (= (size!4609 (buf!5129 thiss!1204)) (size!4609 (buf!5129 (_2!9674 lt!330648)))))))

(declare-fun appendBit!0 (BitStream!8326 Bool) tuple2!18038)

(assert (=> b!210564 (= lt!330648 (appendBit!0 thiss!1204 lt!330663))))

(assert (=> b!210564 (= lt!330663 (not (= (bvand v!189 lt!330656) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210564 (= lt!330656 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(assert (= (and start!44202 res!176777) b!210551))

(assert (= (and b!210551 res!176787) b!210562))

(assert (= (and b!210562 res!176789) b!210546))

(assert (= (and b!210546 res!176780) b!210564))

(assert (= (and b!210564 res!176784) b!210547))

(assert (= (and b!210547 res!176790) b!210561))

(assert (= (and b!210561 res!176792) b!210552))

(assert (= (and b!210552 res!176779) b!210563))

(assert (= (and b!210564 (not res!176776)) b!210560))

(assert (= (and b!210560 (not res!176781)) b!210556))

(assert (= (and b!210556 (not res!176783)) b!210548))

(assert (= (and b!210548 (not res!176791)) b!210555))

(assert (= (and b!210555 (not res!176788)) b!210558))

(assert (= (and b!210558 (not res!176786)) b!210554))

(assert (= (and b!210554 res!176775) b!210553))

(assert (= (and b!210554 res!176782) b!210550))

(assert (= (and b!210554 (not res!176785)) b!210559))

(assert (= (and b!210559 res!176778) b!210557))

(assert (= start!44202 b!210549))

(declare-fun m!324237 () Bool)

(assert (=> b!210556 m!324237))

(declare-fun m!324239 () Bool)

(assert (=> b!210559 m!324239))

(declare-fun m!324241 () Bool)

(assert (=> b!210559 m!324241))

(assert (=> b!210559 m!324241))

(declare-fun m!324243 () Bool)

(assert (=> b!210559 m!324243))

(declare-fun m!324245 () Bool)

(assert (=> b!210553 m!324245))

(declare-fun m!324247 () Bool)

(assert (=> b!210560 m!324247))

(declare-fun m!324249 () Bool)

(assert (=> b!210560 m!324249))

(declare-fun m!324251 () Bool)

(assert (=> b!210560 m!324251))

(declare-fun m!324253 () Bool)

(assert (=> b!210560 m!324253))

(declare-fun m!324255 () Bool)

(assert (=> start!44202 m!324255))

(declare-fun m!324257 () Bool)

(assert (=> b!210551 m!324257))

(declare-fun m!324259 () Bool)

(assert (=> b!210549 m!324259))

(declare-fun m!324261 () Bool)

(assert (=> b!210562 m!324261))

(declare-fun m!324263 () Bool)

(assert (=> b!210552 m!324263))

(assert (=> b!210552 m!324263))

(declare-fun m!324265 () Bool)

(assert (=> b!210552 m!324265))

(declare-fun m!324267 () Bool)

(assert (=> b!210547 m!324267))

(declare-fun m!324269 () Bool)

(assert (=> b!210547 m!324269))

(declare-fun m!324271 () Bool)

(assert (=> b!210555 m!324271))

(declare-fun m!324273 () Bool)

(assert (=> b!210554 m!324273))

(declare-fun m!324275 () Bool)

(assert (=> b!210554 m!324275))

(declare-fun m!324277 () Bool)

(assert (=> b!210554 m!324277))

(declare-fun m!324279 () Bool)

(assert (=> b!210554 m!324279))

(declare-fun m!324281 () Bool)

(assert (=> b!210554 m!324281))

(declare-fun m!324283 () Bool)

(assert (=> b!210554 m!324283))

(declare-fun m!324285 () Bool)

(assert (=> b!210554 m!324285))

(declare-fun m!324287 () Bool)

(assert (=> b!210554 m!324287))

(declare-fun m!324289 () Bool)

(assert (=> b!210554 m!324289))

(declare-fun m!324291 () Bool)

(assert (=> b!210554 m!324291))

(declare-fun m!324293 () Bool)

(assert (=> b!210554 m!324293))

(declare-fun m!324295 () Bool)

(assert (=> b!210554 m!324295))

(declare-fun m!324297 () Bool)

(assert (=> b!210554 m!324297))

(declare-fun m!324299 () Bool)

(assert (=> b!210554 m!324299))

(declare-fun m!324301 () Bool)

(assert (=> b!210554 m!324301))

(declare-fun m!324303 () Bool)

(assert (=> b!210554 m!324303))

(assert (=> b!210564 m!324267))

(assert (=> b!210564 m!324269))

(declare-fun m!324305 () Bool)

(assert (=> b!210564 m!324305))

(declare-fun m!324307 () Bool)

(assert (=> b!210557 m!324307))

(declare-fun m!324309 () Bool)

(assert (=> b!210561 m!324309))

(declare-fun m!324311 () Bool)

(assert (=> b!210563 m!324311))

(assert (=> b!210558 m!324309))

(push 1)

(assert (not b!210552))

(assert (not b!210558))

(assert (not b!210561))

(assert (not b!210562))

(assert (not b!210554))

(assert (not b!210555))

(assert (not start!44202))

(assert (not b!210559))

(assert (not b!210551))

(assert (not b!210556))

(assert (not b!210557))

(assert (not b!210560))

(assert (not b!210564))

(assert (not b!210563))

(assert (not b!210547))

(assert (not b!210549))

(assert (not b!210553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!71257 () Bool)

(declare-fun e!143721 () Bool)

(assert (=> d!71257 e!143721))

(declare-fun res!176906 () Bool)

(assert (=> d!71257 (=> (not res!176906) (not e!143721))))

(declare-fun lt!330854 () (_ BitVec 64))

(declare-fun lt!330856 () (_ BitVec 64))

(declare-fun lt!330857 () (_ BitVec 64))

(assert (=> d!71257 (= res!176906 (= lt!330856 (bvsub lt!330857 lt!330854)))))

(assert (=> d!71257 (or (= (bvand lt!330857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330854 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330857 lt!330854) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71257 (= lt!330854 (remainingBits!0 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330648)))) ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330648))) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330648)))))))

(declare-fun lt!330853 () (_ BitVec 64))

(declare-fun lt!330852 () (_ BitVec 64))

(assert (=> d!71257 (= lt!330857 (bvmul lt!330853 lt!330852))))

(assert (=> d!71257 (or (= lt!330853 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!330852 (bvsdiv (bvmul lt!330853 lt!330852) lt!330853)))))

(assert (=> d!71257 (= lt!330852 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71257 (= lt!330853 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330648)))))))

(assert (=> d!71257 (= lt!330856 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330648))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330648)))))))

(assert (=> d!71257 (invariant!0 (currentBit!9672 (_2!9674 lt!330648)) (currentByte!9677 (_2!9674 lt!330648)) (size!4609 (buf!5129 (_2!9674 lt!330648))))))

(assert (=> d!71257 (= (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))) lt!330856)))

(declare-fun b!210683 () Bool)

(declare-fun res!176905 () Bool)

(assert (=> b!210683 (=> (not res!176905) (not e!143721))))

(assert (=> b!210683 (= res!176905 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330856))))

(declare-fun b!210684 () Bool)

(declare-fun lt!330855 () (_ BitVec 64))

(assert (=> b!210684 (= e!143721 (bvsle lt!330856 (bvmul lt!330855 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210684 (or (= lt!330855 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!330855 #b0000000000000000000000000000000000000000000000000000000000001000) lt!330855)))))

(assert (=> b!210684 (= lt!330855 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330648)))))))

(assert (= (and d!71257 res!176906) b!210683))

(assert (= (and b!210683 res!176905) b!210684))

(declare-fun m!324465 () Bool)

(assert (=> d!71257 m!324465))

(declare-fun m!324467 () Bool)

(assert (=> d!71257 m!324467))

(assert (=> b!210564 d!71257))

(declare-fun d!71259 () Bool)

(declare-fun e!143722 () Bool)

(assert (=> d!71259 e!143722))

(declare-fun res!176908 () Bool)

(assert (=> d!71259 (=> (not res!176908) (not e!143722))))

(declare-fun lt!330860 () (_ BitVec 64))

(declare-fun lt!330863 () (_ BitVec 64))

(declare-fun lt!330862 () (_ BitVec 64))

(assert (=> d!71259 (= res!176908 (= lt!330862 (bvsub lt!330863 lt!330860)))))

(assert (=> d!71259 (or (= (bvand lt!330863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330860 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330863 lt!330860) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71259 (= lt!330860 (remainingBits!0 ((_ sign_extend 32) (size!4609 (buf!5129 thiss!1204))) ((_ sign_extend 32) (currentByte!9677 thiss!1204)) ((_ sign_extend 32) (currentBit!9672 thiss!1204))))))

(declare-fun lt!330859 () (_ BitVec 64))

(declare-fun lt!330858 () (_ BitVec 64))

(assert (=> d!71259 (= lt!330863 (bvmul lt!330859 lt!330858))))

(assert (=> d!71259 (or (= lt!330859 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!330858 (bvsdiv (bvmul lt!330859 lt!330858) lt!330859)))))

(assert (=> d!71259 (= lt!330858 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71259 (= lt!330859 ((_ sign_extend 32) (size!4609 (buf!5129 thiss!1204))))))

(assert (=> d!71259 (= lt!330862 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9677 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9672 thiss!1204))))))

(assert (=> d!71259 (invariant!0 (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204) (size!4609 (buf!5129 thiss!1204)))))

(assert (=> d!71259 (= (bitIndex!0 (size!4609 (buf!5129 thiss!1204)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204)) lt!330862)))

(declare-fun b!210685 () Bool)

(declare-fun res!176907 () Bool)

(assert (=> b!210685 (=> (not res!176907) (not e!143722))))

(assert (=> b!210685 (= res!176907 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330862))))

(declare-fun b!210686 () Bool)

(declare-fun lt!330861 () (_ BitVec 64))

(assert (=> b!210686 (= e!143722 (bvsle lt!330862 (bvmul lt!330861 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210686 (or (= lt!330861 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!330861 #b0000000000000000000000000000000000000000000000000000000000001000) lt!330861)))))

(assert (=> b!210686 (= lt!330861 ((_ sign_extend 32) (size!4609 (buf!5129 thiss!1204))))))

(assert (= (and d!71259 res!176908) b!210685))

(assert (= (and b!210685 res!176907) b!210686))

(declare-fun m!324469 () Bool)

(assert (=> d!71259 m!324469))

(assert (=> d!71259 m!324261))

(assert (=> b!210564 d!71259))

(declare-fun d!71261 () Bool)

(declare-fun e!143727 () Bool)

(assert (=> d!71261 e!143727))

(declare-fun res!176919 () Bool)

(assert (=> d!71261 (=> (not res!176919) (not e!143727))))

(declare-fun lt!330873 () tuple2!18038)

(assert (=> d!71261 (= res!176919 (= (size!4609 (buf!5129 thiss!1204)) (size!4609 (buf!5129 (_2!9674 lt!330873)))))))

(declare-fun choose!16 (BitStream!8326 Bool) tuple2!18038)

(assert (=> d!71261 (= lt!330873 (choose!16 thiss!1204 lt!330663))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71261 (validate_offset_bit!0 ((_ sign_extend 32) (size!4609 (buf!5129 thiss!1204))) ((_ sign_extend 32) (currentByte!9677 thiss!1204)) ((_ sign_extend 32) (currentBit!9672 thiss!1204)))))

(assert (=> d!71261 (= (appendBit!0 thiss!1204 lt!330663) lt!330873)))

(declare-fun b!210697 () Bool)

(declare-fun res!176918 () Bool)

(assert (=> b!210697 (=> (not res!176918) (not e!143727))))

(assert (=> b!210697 (= res!176918 (isPrefixOf!0 thiss!1204 (_2!9674 lt!330873)))))

(declare-fun b!210699 () Bool)

(declare-fun e!143728 () Bool)

(declare-fun lt!330874 () tuple2!18040)

(assert (=> b!210699 (= e!143728 (= (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!330874))) (currentByte!9677 (_1!9675 lt!330874)) (currentBit!9672 (_1!9675 lt!330874))) (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330873))) (currentByte!9677 (_2!9674 lt!330873)) (currentBit!9672 (_2!9674 lt!330873)))))))

(declare-fun b!210696 () Bool)

(declare-fun res!176920 () Bool)

(assert (=> b!210696 (=> (not res!176920) (not e!143727))))

(declare-fun lt!330875 () (_ BitVec 64))

(declare-fun lt!330872 () (_ BitVec 64))

(assert (=> b!210696 (= res!176920 (= (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330873))) (currentByte!9677 (_2!9674 lt!330873)) (currentBit!9672 (_2!9674 lt!330873))) (bvadd lt!330872 lt!330875)))))

(assert (=> b!210696 (or (not (= (bvand lt!330872 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330875 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!330872 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!330872 lt!330875) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210696 (= lt!330875 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!210696 (= lt!330872 (bitIndex!0 (size!4609 (buf!5129 thiss!1204)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204)))))

(declare-fun b!210698 () Bool)

(assert (=> b!210698 (= e!143727 e!143728)))

(declare-fun res!176917 () Bool)

(assert (=> b!210698 (=> (not res!176917) (not e!143728))))

(assert (=> b!210698 (= res!176917 (and (= (_2!9675 lt!330874) lt!330663) (= (_1!9675 lt!330874) (_2!9674 lt!330873))))))

(assert (=> b!210698 (= lt!330874 (readBitPure!0 (readerFrom!0 (_2!9674 lt!330873) (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204))))))

(assert (= (and d!71261 res!176919) b!210696))

(assert (= (and b!210696 res!176920) b!210697))

(assert (= (and b!210697 res!176918) b!210698))

(assert (= (and b!210698 res!176917) b!210699))

(declare-fun m!324471 () Bool)

(assert (=> b!210698 m!324471))

(assert (=> b!210698 m!324471))

(declare-fun m!324473 () Bool)

(assert (=> b!210698 m!324473))

(declare-fun m!324475 () Bool)

(assert (=> b!210697 m!324475))

(declare-fun m!324477 () Bool)

(assert (=> d!71261 m!324477))

(declare-fun m!324479 () Bool)

(assert (=> d!71261 m!324479))

(declare-fun m!324481 () Bool)

(assert (=> b!210699 m!324481))

(declare-fun m!324483 () Bool)

(assert (=> b!210699 m!324483))

(assert (=> b!210696 m!324483))

(assert (=> b!210696 m!324269))

(assert (=> b!210564 d!71261))

(declare-fun d!71263 () Bool)

(assert (=> d!71263 (= (invariant!0 (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204) (size!4609 (buf!5129 (_2!9674 lt!330652)))) (and (bvsge (currentBit!9672 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9672 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9677 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9677 thiss!1204) (size!4609 (buf!5129 (_2!9674 lt!330652)))) (and (= (currentBit!9672 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9677 thiss!1204) (size!4609 (buf!5129 (_2!9674 lt!330652))))))))))

(assert (=> b!210553 d!71263))

(declare-fun d!71265 () Bool)

(declare-fun res!176929 () Bool)

(declare-fun e!143733 () Bool)

(assert (=> d!71265 (=> (not res!176929) (not e!143733))))

(assert (=> d!71265 (= res!176929 (= (size!4609 (buf!5129 (_2!9674 lt!330648))) (size!4609 (buf!5129 (_2!9674 lt!330652)))))))

(assert (=> d!71265 (= (isPrefixOf!0 (_2!9674 lt!330648) (_2!9674 lt!330652)) e!143733)))

(declare-fun b!210706 () Bool)

(declare-fun res!176928 () Bool)

(assert (=> b!210706 (=> (not res!176928) (not e!143733))))

(assert (=> b!210706 (= res!176928 (bvsle (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))) (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330652))) (currentByte!9677 (_2!9674 lt!330652)) (currentBit!9672 (_2!9674 lt!330652)))))))

(declare-fun b!210707 () Bool)

(declare-fun e!143734 () Bool)

(assert (=> b!210707 (= e!143733 e!143734)))

(declare-fun res!176927 () Bool)

(assert (=> b!210707 (=> res!176927 e!143734)))

(assert (=> b!210707 (= res!176927 (= (size!4609 (buf!5129 (_2!9674 lt!330648))) #b00000000000000000000000000000000))))

(declare-fun b!210708 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10490 array!10490 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210708 (= e!143734 (arrayBitRangesEq!0 (buf!5129 (_2!9674 lt!330648)) (buf!5129 (_2!9674 lt!330652)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648)))))))

(assert (= (and d!71265 res!176929) b!210706))

(assert (= (and b!210706 res!176928) b!210707))

(assert (= (and b!210707 (not res!176927)) b!210708))

(assert (=> b!210706 m!324267))

(assert (=> b!210706 m!324247))

(assert (=> b!210708 m!324267))

(assert (=> b!210708 m!324267))

(declare-fun m!324485 () Bool)

(assert (=> b!210708 m!324485))

(assert (=> b!210555 d!71265))

(declare-fun b!210730 () Bool)

(declare-fun res!176947 () Bool)

(declare-fun e!143746 () Bool)

(assert (=> b!210730 (=> (not res!176947) (not e!143746))))

(declare-fun lt!330964 () tuple2!18042)

(assert (=> b!210730 (= res!176947 (isPrefixOf!0 (_2!9676 lt!330964) (_2!9674 lt!330652)))))

(declare-fun d!71267 () Bool)

(assert (=> d!71267 e!143746))

(declare-fun res!176949 () Bool)

(assert (=> d!71267 (=> (not res!176949) (not e!143746))))

(assert (=> d!71267 (= res!176949 (isPrefixOf!0 (_1!9676 lt!330964) (_2!9676 lt!330964)))))

(declare-fun lt!330951 () BitStream!8326)

(assert (=> d!71267 (= lt!330964 (tuple2!18043 lt!330951 (_2!9674 lt!330652)))))

(declare-fun lt!330958 () Unit!15007)

(declare-fun lt!330961 () Unit!15007)

(assert (=> d!71267 (= lt!330958 lt!330961)))

(assert (=> d!71267 (isPrefixOf!0 lt!330951 (_2!9674 lt!330652))))

(assert (=> d!71267 (= lt!330961 (lemmaIsPrefixTransitive!0 lt!330951 (_2!9674 lt!330652) (_2!9674 lt!330652)))))

(declare-fun lt!330960 () Unit!15007)

(declare-fun lt!330950 () Unit!15007)

(assert (=> d!71267 (= lt!330960 lt!330950)))

(assert (=> d!71267 (isPrefixOf!0 lt!330951 (_2!9674 lt!330652))))

(assert (=> d!71267 (= lt!330950 (lemmaIsPrefixTransitive!0 lt!330951 (_2!9674 lt!330648) (_2!9674 lt!330652)))))

(declare-fun lt!330949 () Unit!15007)

(declare-fun e!143747 () Unit!15007)

(assert (=> d!71267 (= lt!330949 e!143747)))

(declare-fun c!10361 () Bool)

(assert (=> d!71267 (= c!10361 (not (= (size!4609 (buf!5129 (_2!9674 lt!330648))) #b00000000000000000000000000000000)))))

(declare-fun lt!330963 () Unit!15007)

(declare-fun lt!330954 () Unit!15007)

(assert (=> d!71267 (= lt!330963 lt!330954)))

(assert (=> d!71267 (isPrefixOf!0 (_2!9674 lt!330652) (_2!9674 lt!330652))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8326) Unit!15007)

(assert (=> d!71267 (= lt!330954 (lemmaIsPrefixRefl!0 (_2!9674 lt!330652)))))

(declare-fun lt!330957 () Unit!15007)

(declare-fun lt!330948 () Unit!15007)

(assert (=> d!71267 (= lt!330957 lt!330948)))

(assert (=> d!71267 (= lt!330948 (lemmaIsPrefixRefl!0 (_2!9674 lt!330652)))))

(declare-fun lt!330955 () Unit!15007)

(declare-fun lt!330962 () Unit!15007)

(assert (=> d!71267 (= lt!330955 lt!330962)))

(assert (=> d!71267 (isPrefixOf!0 lt!330951 lt!330951)))

(assert (=> d!71267 (= lt!330962 (lemmaIsPrefixRefl!0 lt!330951))))

(declare-fun lt!330947 () Unit!15007)

(declare-fun lt!330953 () Unit!15007)

(assert (=> d!71267 (= lt!330947 lt!330953)))

(assert (=> d!71267 (isPrefixOf!0 (_2!9674 lt!330648) (_2!9674 lt!330648))))

(assert (=> d!71267 (= lt!330953 (lemmaIsPrefixRefl!0 (_2!9674 lt!330648)))))

(assert (=> d!71267 (= lt!330951 (BitStream!8327 (buf!5129 (_2!9674 lt!330652)) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))))))

(assert (=> d!71267 (isPrefixOf!0 (_2!9674 lt!330648) (_2!9674 lt!330652))))

(assert (=> d!71267 (= (reader!0 (_2!9674 lt!330648) (_2!9674 lt!330652)) lt!330964)))

(declare-fun b!210731 () Bool)

(declare-fun res!176948 () Bool)

(assert (=> b!210731 (=> (not res!176948) (not e!143746))))

(assert (=> b!210731 (= res!176948 (isPrefixOf!0 (_1!9676 lt!330964) (_2!9674 lt!330648)))))

(declare-fun lt!330965 () (_ BitVec 64))

(declare-fun lt!330956 () (_ BitVec 64))

(declare-fun b!210732 () Bool)

(assert (=> b!210732 (= e!143746 (= (_1!9676 lt!330964) (withMovedBitIndex!0 (_2!9676 lt!330964) (bvsub lt!330965 lt!330956))))))

(assert (=> b!210732 (or (= (bvand lt!330965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330956 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330965 lt!330956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210732 (= lt!330956 (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330652))) (currentByte!9677 (_2!9674 lt!330652)) (currentBit!9672 (_2!9674 lt!330652))))))

(assert (=> b!210732 (= lt!330965 (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))))))

(declare-fun b!210733 () Bool)

(declare-fun Unit!15013 () Unit!15007)

(assert (=> b!210733 (= e!143747 Unit!15013)))

(declare-fun b!210734 () Bool)

(declare-fun lt!330946 () Unit!15007)

(assert (=> b!210734 (= e!143747 lt!330946)))

(declare-fun lt!330952 () (_ BitVec 64))

(assert (=> b!210734 (= lt!330952 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!330959 () (_ BitVec 64))

(assert (=> b!210734 (= lt!330959 (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10490 array!10490 (_ BitVec 64) (_ BitVec 64)) Unit!15007)

(assert (=> b!210734 (= lt!330946 (arrayBitRangesEqSymmetric!0 (buf!5129 (_2!9674 lt!330648)) (buf!5129 (_2!9674 lt!330652)) lt!330952 lt!330959))))

(assert (=> b!210734 (arrayBitRangesEq!0 (buf!5129 (_2!9674 lt!330652)) (buf!5129 (_2!9674 lt!330648)) lt!330952 lt!330959)))

(assert (= (and d!71267 c!10361) b!210734))

(assert (= (and d!71267 (not c!10361)) b!210733))

(assert (= (and d!71267 res!176949) b!210731))

(assert (= (and b!210731 res!176948) b!210730))

(assert (= (and b!210730 res!176947) b!210732))

(declare-fun m!324501 () Bool)

(assert (=> b!210731 m!324501))

(declare-fun m!324503 () Bool)

(assert (=> d!71267 m!324503))

(declare-fun m!324505 () Bool)

(assert (=> d!71267 m!324505))

(declare-fun m!324507 () Bool)

(assert (=> d!71267 m!324507))

(declare-fun m!324509 () Bool)

(assert (=> d!71267 m!324509))

(declare-fun m!324511 () Bool)

(assert (=> d!71267 m!324511))

(assert (=> d!71267 m!324271))

(declare-fun m!324513 () Bool)

(assert (=> d!71267 m!324513))

(declare-fun m!324515 () Bool)

(assert (=> d!71267 m!324515))

(declare-fun m!324517 () Bool)

(assert (=> d!71267 m!324517))

(declare-fun m!324519 () Bool)

(assert (=> d!71267 m!324519))

(declare-fun m!324521 () Bool)

(assert (=> d!71267 m!324521))

(declare-fun m!324523 () Bool)

(assert (=> b!210730 m!324523))

(assert (=> b!210734 m!324267))

(declare-fun m!324525 () Bool)

(assert (=> b!210734 m!324525))

(declare-fun m!324527 () Bool)

(assert (=> b!210734 m!324527))

(declare-fun m!324529 () Bool)

(assert (=> b!210732 m!324529))

(assert (=> b!210732 m!324247))

(assert (=> b!210732 m!324267))

(assert (=> b!210554 d!71267))

(declare-fun d!71279 () Bool)

(assert (=> d!71279 (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330652)))) ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330648))) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330648))) lt!330666)))

(declare-fun lt!330968 () Unit!15007)

(declare-fun choose!9 (BitStream!8326 array!10490 (_ BitVec 64) BitStream!8326) Unit!15007)

(assert (=> d!71279 (= lt!330968 (choose!9 (_2!9674 lt!330648) (buf!5129 (_2!9674 lt!330652)) lt!330666 (BitStream!8327 (buf!5129 (_2!9674 lt!330652)) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648)))))))

(assert (=> d!71279 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9674 lt!330648) (buf!5129 (_2!9674 lt!330652)) lt!330666) lt!330968)))

(declare-fun bs!17499 () Bool)

(assert (= bs!17499 d!71279))

(assert (=> bs!17499 m!324279))

(declare-fun m!324531 () Bool)

(assert (=> bs!17499 m!324531))

(assert (=> b!210554 d!71279))

(declare-fun d!71281 () Bool)

(assert (=> d!71281 (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330652)))) ((_ sign_extend 32) (currentByte!9677 thiss!1204)) ((_ sign_extend 32) (currentBit!9672 thiss!1204)) lt!330661)))

(declare-fun lt!330969 () Unit!15007)

(assert (=> d!71281 (= lt!330969 (choose!9 thiss!1204 (buf!5129 (_2!9674 lt!330652)) lt!330661 (BitStream!8327 (buf!5129 (_2!9674 lt!330652)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204))))))

(assert (=> d!71281 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5129 (_2!9674 lt!330652)) lt!330661) lt!330969)))

(declare-fun bs!17500 () Bool)

(assert (= bs!17500 d!71281))

(assert (=> bs!17500 m!324293))

(declare-fun m!324533 () Bool)

(assert (=> bs!17500 m!324533))

(assert (=> b!210554 d!71281))

(declare-fun d!71283 () Bool)

(declare-datatypes ((tuple2!18062 0))(
  ( (tuple2!18063 (_1!9686 Bool) (_2!9686 BitStream!8326)) )
))
(declare-fun lt!330972 () tuple2!18062)

(declare-fun readBit!0 (BitStream!8326) tuple2!18062)

(assert (=> d!71283 (= lt!330972 (readBit!0 lt!330650))))

(assert (=> d!71283 (= (readBitPure!0 lt!330650) (tuple2!18041 (_2!9686 lt!330972) (_1!9686 lt!330972)))))

(declare-fun bs!17501 () Bool)

(assert (= bs!17501 d!71283))

(declare-fun m!324535 () Bool)

(assert (=> bs!17501 m!324535))

(assert (=> b!210554 d!71283))

(declare-datatypes ((tuple2!18064 0))(
  ( (tuple2!18065 (_1!9687 (_ BitVec 64)) (_2!9687 BitStream!8326)) )
))
(declare-fun lt!330981 () tuple2!18064)

(declare-fun d!71285 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18064)

(assert (=> d!71285 (= lt!330981 (readNBitsLSBFirstsLoop!0 (_1!9676 lt!330667) nBits!348 i!590 lt!330657))))

(assert (=> d!71285 (= (readNBitsLSBFirstsLoopPure!0 (_1!9676 lt!330667) nBits!348 i!590 lt!330657) (tuple2!18045 (_2!9687 lt!330981) (_1!9687 lt!330981)))))

(declare-fun bs!17502 () Bool)

(assert (= bs!17502 d!71285))

(declare-fun m!324537 () Bool)

(assert (=> bs!17502 m!324537))

(assert (=> b!210554 d!71285))

(declare-fun d!71287 () Bool)

(declare-fun e!143762 () Bool)

(assert (=> d!71287 e!143762))

(declare-fun res!176973 () Bool)

(assert (=> d!71287 (=> (not res!176973) (not e!143762))))

(declare-fun lt!330997 () tuple2!18040)

(declare-fun lt!330996 () tuple2!18040)

(assert (=> d!71287 (= res!176973 (= (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!330997))) (currentByte!9677 (_1!9675 lt!330997)) (currentBit!9672 (_1!9675 lt!330997))) (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!330996))) (currentByte!9677 (_1!9675 lt!330996)) (currentBit!9672 (_1!9675 lt!330996)))))))

(declare-fun lt!330998 () BitStream!8326)

(declare-fun lt!330999 () Unit!15007)

(declare-fun choose!50 (BitStream!8326 BitStream!8326 BitStream!8326 tuple2!18040 tuple2!18040 BitStream!8326 Bool tuple2!18040 tuple2!18040 BitStream!8326 Bool) Unit!15007)

(assert (=> d!71287 (= lt!330999 (choose!50 lt!330650 (_2!9674 lt!330652) lt!330998 lt!330997 (tuple2!18041 (_1!9675 lt!330997) (_2!9675 lt!330997)) (_1!9675 lt!330997) (_2!9675 lt!330997) lt!330996 (tuple2!18041 (_1!9675 lt!330996) (_2!9675 lt!330996)) (_1!9675 lt!330996) (_2!9675 lt!330996)))))

(assert (=> d!71287 (= lt!330996 (readBitPure!0 lt!330998))))

(assert (=> d!71287 (= lt!330997 (readBitPure!0 lt!330650))))

(assert (=> d!71287 (= lt!330998 (BitStream!8327 (buf!5129 (_2!9674 lt!330652)) (currentByte!9677 lt!330650) (currentBit!9672 lt!330650)))))

(assert (=> d!71287 (invariant!0 (currentBit!9672 lt!330650) (currentByte!9677 lt!330650) (size!4609 (buf!5129 (_2!9674 lt!330652))))))

(assert (=> d!71287 (= (readBitPrefixLemma!0 lt!330650 (_2!9674 lt!330652)) lt!330999)))

(declare-fun b!210759 () Bool)

(assert (=> b!210759 (= e!143762 (= (_2!9675 lt!330997) (_2!9675 lt!330996)))))

(assert (= (and d!71287 res!176973) b!210759))

(declare-fun m!324555 () Bool)

(assert (=> d!71287 m!324555))

(declare-fun m!324557 () Bool)

(assert (=> d!71287 m!324557))

(assert (=> d!71287 m!324299))

(declare-fun m!324559 () Bool)

(assert (=> d!71287 m!324559))

(declare-fun m!324561 () Bool)

(assert (=> d!71287 m!324561))

(declare-fun m!324563 () Bool)

(assert (=> d!71287 m!324563))

(assert (=> b!210554 d!71287))

(declare-fun d!71293 () Bool)

(assert (=> d!71293 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330652)))) ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330648))) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330648))) lt!330666) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330652)))) ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330648))) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330648)))) lt!330666))))

(declare-fun bs!17504 () Bool)

(assert (= bs!17504 d!71293))

(declare-fun m!324567 () Bool)

(assert (=> bs!17504 m!324567))

(assert (=> b!210554 d!71293))

(declare-fun d!71297 () Bool)

(declare-fun lt!331003 () tuple2!18064)

(assert (=> d!71297 (= lt!331003 (readNBitsLSBFirstsLoop!0 (_1!9676 lt!330668) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330660))))

(assert (=> d!71297 (= (readNBitsLSBFirstsLoopPure!0 (_1!9676 lt!330668) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330660) (tuple2!18045 (_2!9687 lt!331003) (_1!9687 lt!331003)))))

(declare-fun bs!17505 () Bool)

(assert (= bs!17505 d!71297))

(declare-fun m!324569 () Bool)

(assert (=> bs!17505 m!324569))

(assert (=> b!210554 d!71297))

(declare-fun d!71299 () Bool)

(declare-fun lt!331004 () tuple2!18062)

(assert (=> d!71299 (= lt!331004 (readBit!0 (BitStream!8327 (buf!5129 (_2!9674 lt!330652)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204))))))

(assert (=> d!71299 (= (readBitPure!0 (BitStream!8327 (buf!5129 (_2!9674 lt!330652)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204))) (tuple2!18041 (_2!9686 lt!331004) (_1!9686 lt!331004)))))

(declare-fun bs!17506 () Bool)

(assert (= bs!17506 d!71299))

(declare-fun m!324571 () Bool)

(assert (=> bs!17506 m!324571))

(assert (=> b!210554 d!71299))

(declare-fun d!71301 () Bool)

(assert (=> d!71301 (= (invariant!0 (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204) (size!4609 (buf!5129 (_2!9674 lt!330648)))) (and (bvsge (currentBit!9672 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9672 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9677 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9677 thiss!1204) (size!4609 (buf!5129 (_2!9674 lt!330648)))) (and (= (currentBit!9672 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9677 thiss!1204) (size!4609 (buf!5129 (_2!9674 lt!330648))))))))))

(assert (=> b!210554 d!71301))

(declare-fun d!71303 () Bool)

(declare-fun e!143763 () Bool)

(assert (=> d!71303 e!143763))

(declare-fun res!176976 () Bool)

(assert (=> d!71303 (=> (not res!176976) (not e!143763))))

(declare-fun lt!331007 () (_ BitVec 64))

(declare-fun lt!331009 () (_ BitVec 64))

(declare-fun lt!331010 () (_ BitVec 64))

(assert (=> d!71303 (= res!176976 (= lt!331009 (bvsub lt!331010 lt!331007)))))

(assert (=> d!71303 (or (= (bvand lt!331010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331010 lt!331007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71303 (= lt!331007 (remainingBits!0 ((_ sign_extend 32) (size!4609 (buf!5129 (_1!9675 lt!330645)))) ((_ sign_extend 32) (currentByte!9677 (_1!9675 lt!330645))) ((_ sign_extend 32) (currentBit!9672 (_1!9675 lt!330645)))))))

(declare-fun lt!331006 () (_ BitVec 64))

(declare-fun lt!331005 () (_ BitVec 64))

(assert (=> d!71303 (= lt!331010 (bvmul lt!331006 lt!331005))))

(assert (=> d!71303 (or (= lt!331006 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331005 (bvsdiv (bvmul lt!331006 lt!331005) lt!331006)))))

(assert (=> d!71303 (= lt!331005 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71303 (= lt!331006 ((_ sign_extend 32) (size!4609 (buf!5129 (_1!9675 lt!330645)))))))

(assert (=> d!71303 (= lt!331009 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9677 (_1!9675 lt!330645))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9672 (_1!9675 lt!330645)))))))

(assert (=> d!71303 (invariant!0 (currentBit!9672 (_1!9675 lt!330645)) (currentByte!9677 (_1!9675 lt!330645)) (size!4609 (buf!5129 (_1!9675 lt!330645))))))

(assert (=> d!71303 (= (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!330645))) (currentByte!9677 (_1!9675 lt!330645)) (currentBit!9672 (_1!9675 lt!330645))) lt!331009)))

(declare-fun b!210760 () Bool)

(declare-fun res!176975 () Bool)

(assert (=> b!210760 (=> (not res!176975) (not e!143763))))

(assert (=> b!210760 (= res!176975 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331009))))

(declare-fun b!210761 () Bool)

(declare-fun lt!331008 () (_ BitVec 64))

(assert (=> b!210761 (= e!143763 (bvsle lt!331009 (bvmul lt!331008 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210761 (or (= lt!331008 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331008 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331008)))))

(assert (=> b!210761 (= lt!331008 ((_ sign_extend 32) (size!4609 (buf!5129 (_1!9675 lt!330645)))))))

(assert (= (and d!71303 res!176976) b!210760))

(assert (= (and b!210760 res!176975) b!210761))

(declare-fun m!324573 () Bool)

(assert (=> d!71303 m!324573))

(declare-fun m!324575 () Bool)

(assert (=> d!71303 m!324575))

(assert (=> b!210554 d!71303))

(declare-fun b!210762 () Bool)

(declare-fun res!176977 () Bool)

(declare-fun e!143764 () Bool)

(assert (=> b!210762 (=> (not res!176977) (not e!143764))))

(declare-fun lt!331029 () tuple2!18042)

(assert (=> b!210762 (= res!176977 (isPrefixOf!0 (_2!9676 lt!331029) (_2!9674 lt!330652)))))

(declare-fun d!71305 () Bool)

(assert (=> d!71305 e!143764))

(declare-fun res!176979 () Bool)

(assert (=> d!71305 (=> (not res!176979) (not e!143764))))

(assert (=> d!71305 (= res!176979 (isPrefixOf!0 (_1!9676 lt!331029) (_2!9676 lt!331029)))))

(declare-fun lt!331016 () BitStream!8326)

(assert (=> d!71305 (= lt!331029 (tuple2!18043 lt!331016 (_2!9674 lt!330652)))))

(declare-fun lt!331023 () Unit!15007)

(declare-fun lt!331026 () Unit!15007)

(assert (=> d!71305 (= lt!331023 lt!331026)))

(assert (=> d!71305 (isPrefixOf!0 lt!331016 (_2!9674 lt!330652))))

(assert (=> d!71305 (= lt!331026 (lemmaIsPrefixTransitive!0 lt!331016 (_2!9674 lt!330652) (_2!9674 lt!330652)))))

(declare-fun lt!331025 () Unit!15007)

(declare-fun lt!331015 () Unit!15007)

(assert (=> d!71305 (= lt!331025 lt!331015)))

(assert (=> d!71305 (isPrefixOf!0 lt!331016 (_2!9674 lt!330652))))

(assert (=> d!71305 (= lt!331015 (lemmaIsPrefixTransitive!0 lt!331016 thiss!1204 (_2!9674 lt!330652)))))

(declare-fun lt!331014 () Unit!15007)

(declare-fun e!143765 () Unit!15007)

(assert (=> d!71305 (= lt!331014 e!143765)))

(declare-fun c!10362 () Bool)

(assert (=> d!71305 (= c!10362 (not (= (size!4609 (buf!5129 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!331028 () Unit!15007)

(declare-fun lt!331019 () Unit!15007)

(assert (=> d!71305 (= lt!331028 lt!331019)))

(assert (=> d!71305 (isPrefixOf!0 (_2!9674 lt!330652) (_2!9674 lt!330652))))

(assert (=> d!71305 (= lt!331019 (lemmaIsPrefixRefl!0 (_2!9674 lt!330652)))))

(declare-fun lt!331022 () Unit!15007)

(declare-fun lt!331013 () Unit!15007)

(assert (=> d!71305 (= lt!331022 lt!331013)))

(assert (=> d!71305 (= lt!331013 (lemmaIsPrefixRefl!0 (_2!9674 lt!330652)))))

(declare-fun lt!331020 () Unit!15007)

(declare-fun lt!331027 () Unit!15007)

(assert (=> d!71305 (= lt!331020 lt!331027)))

(assert (=> d!71305 (isPrefixOf!0 lt!331016 lt!331016)))

(assert (=> d!71305 (= lt!331027 (lemmaIsPrefixRefl!0 lt!331016))))

(declare-fun lt!331012 () Unit!15007)

(declare-fun lt!331018 () Unit!15007)

(assert (=> d!71305 (= lt!331012 lt!331018)))

(assert (=> d!71305 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71305 (= lt!331018 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71305 (= lt!331016 (BitStream!8327 (buf!5129 (_2!9674 lt!330652)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204)))))

(assert (=> d!71305 (isPrefixOf!0 thiss!1204 (_2!9674 lt!330652))))

(assert (=> d!71305 (= (reader!0 thiss!1204 (_2!9674 lt!330652)) lt!331029)))

(declare-fun b!210763 () Bool)

(declare-fun res!176978 () Bool)

(assert (=> b!210763 (=> (not res!176978) (not e!143764))))

(assert (=> b!210763 (= res!176978 (isPrefixOf!0 (_1!9676 lt!331029) thiss!1204))))

(declare-fun lt!331021 () (_ BitVec 64))

(declare-fun b!210764 () Bool)

(declare-fun lt!331030 () (_ BitVec 64))

(assert (=> b!210764 (= e!143764 (= (_1!9676 lt!331029) (withMovedBitIndex!0 (_2!9676 lt!331029) (bvsub lt!331030 lt!331021))))))

(assert (=> b!210764 (or (= (bvand lt!331030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331021 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331030 lt!331021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210764 (= lt!331021 (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330652))) (currentByte!9677 (_2!9674 lt!330652)) (currentBit!9672 (_2!9674 lt!330652))))))

(assert (=> b!210764 (= lt!331030 (bitIndex!0 (size!4609 (buf!5129 thiss!1204)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204)))))

(declare-fun b!210765 () Bool)

(declare-fun Unit!15014 () Unit!15007)

(assert (=> b!210765 (= e!143765 Unit!15014)))

(declare-fun b!210766 () Bool)

(declare-fun lt!331011 () Unit!15007)

(assert (=> b!210766 (= e!143765 lt!331011)))

(declare-fun lt!331017 () (_ BitVec 64))

(assert (=> b!210766 (= lt!331017 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!331024 () (_ BitVec 64))

(assert (=> b!210766 (= lt!331024 (bitIndex!0 (size!4609 (buf!5129 thiss!1204)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204)))))

(assert (=> b!210766 (= lt!331011 (arrayBitRangesEqSymmetric!0 (buf!5129 thiss!1204) (buf!5129 (_2!9674 lt!330652)) lt!331017 lt!331024))))

(assert (=> b!210766 (arrayBitRangesEq!0 (buf!5129 (_2!9674 lt!330652)) (buf!5129 thiss!1204) lt!331017 lt!331024)))

(assert (= (and d!71305 c!10362) b!210766))

(assert (= (and d!71305 (not c!10362)) b!210765))

(assert (= (and d!71305 res!176979) b!210763))

(assert (= (and b!210763 res!176978) b!210762))

(assert (= (and b!210762 res!176977) b!210764))

(declare-fun m!324577 () Bool)

(assert (=> b!210763 m!324577))

(declare-fun m!324579 () Bool)

(assert (=> d!71305 m!324579))

(declare-fun m!324581 () Bool)

(assert (=> d!71305 m!324581))

(declare-fun m!324583 () Bool)

(assert (=> d!71305 m!324583))

(declare-fun m!324585 () Bool)

(assert (=> d!71305 m!324585))

(declare-fun m!324587 () Bool)

(assert (=> d!71305 m!324587))

(assert (=> d!71305 m!324249))

(declare-fun m!324589 () Bool)

(assert (=> d!71305 m!324589))

(declare-fun m!324591 () Bool)

(assert (=> d!71305 m!324591))

(assert (=> d!71305 m!324517))

(declare-fun m!324593 () Bool)

(assert (=> d!71305 m!324593))

(assert (=> d!71305 m!324521))

(declare-fun m!324595 () Bool)

(assert (=> b!210762 m!324595))

(assert (=> b!210766 m!324269))

(declare-fun m!324597 () Bool)

(assert (=> b!210766 m!324597))

(declare-fun m!324599 () Bool)

(assert (=> b!210766 m!324599))

(declare-fun m!324601 () Bool)

(assert (=> b!210764 m!324601))

(assert (=> b!210764 m!324247))

(assert (=> b!210764 m!324269))

(assert (=> b!210554 d!71305))

(declare-fun d!71309 () Bool)

(declare-fun lt!331031 () tuple2!18062)

(assert (=> d!71309 (= lt!331031 (readBit!0 (_1!9676 lt!330667)))))

(assert (=> d!71309 (= (readBitPure!0 (_1!9676 lt!330667)) (tuple2!18041 (_2!9686 lt!331031) (_1!9686 lt!331031)))))

(declare-fun bs!17507 () Bool)

(assert (= bs!17507 d!71309))

(declare-fun m!324603 () Bool)

(assert (=> bs!17507 m!324603))

(assert (=> b!210554 d!71309))

(declare-fun d!71311 () Bool)

(assert (=> d!71311 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!210554 d!71311))

(declare-fun d!71315 () Bool)

(assert (=> d!71315 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330652)))) ((_ sign_extend 32) (currentByte!9677 thiss!1204)) ((_ sign_extend 32) (currentBit!9672 thiss!1204)) lt!330661) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330652)))) ((_ sign_extend 32) (currentByte!9677 thiss!1204)) ((_ sign_extend 32) (currentBit!9672 thiss!1204))) lt!330661))))

(declare-fun bs!17508 () Bool)

(assert (= bs!17508 d!71315))

(declare-fun m!324605 () Bool)

(assert (=> bs!17508 m!324605))

(assert (=> b!210554 d!71315))

(declare-fun d!71317 () Bool)

(declare-fun e!143769 () Bool)

(assert (=> d!71317 e!143769))

(declare-fun res!176984 () Bool)

(assert (=> d!71317 (=> (not res!176984) (not e!143769))))

(declare-fun lt!331034 () (_ BitVec 64))

(declare-fun lt!331036 () (_ BitVec 64))

(declare-fun lt!331037 () (_ BitVec 64))

(assert (=> d!71317 (= res!176984 (= lt!331036 (bvsub lt!331037 lt!331034)))))

(assert (=> d!71317 (or (= (bvand lt!331037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331034 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331037 lt!331034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71317 (= lt!331034 (remainingBits!0 ((_ sign_extend 32) (size!4609 (buf!5129 (_1!9675 lt!330646)))) ((_ sign_extend 32) (currentByte!9677 (_1!9675 lt!330646))) ((_ sign_extend 32) (currentBit!9672 (_1!9675 lt!330646)))))))

(declare-fun lt!331033 () (_ BitVec 64))

(declare-fun lt!331032 () (_ BitVec 64))

(assert (=> d!71317 (= lt!331037 (bvmul lt!331033 lt!331032))))

(assert (=> d!71317 (or (= lt!331033 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331032 (bvsdiv (bvmul lt!331033 lt!331032) lt!331033)))))

(assert (=> d!71317 (= lt!331032 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71317 (= lt!331033 ((_ sign_extend 32) (size!4609 (buf!5129 (_1!9675 lt!330646)))))))

(assert (=> d!71317 (= lt!331036 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9677 (_1!9675 lt!330646))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9672 (_1!9675 lt!330646)))))))

(assert (=> d!71317 (invariant!0 (currentBit!9672 (_1!9675 lt!330646)) (currentByte!9677 (_1!9675 lt!330646)) (size!4609 (buf!5129 (_1!9675 lt!330646))))))

(assert (=> d!71317 (= (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!330646))) (currentByte!9677 (_1!9675 lt!330646)) (currentBit!9672 (_1!9675 lt!330646))) lt!331036)))

(declare-fun b!210770 () Bool)

(declare-fun res!176983 () Bool)

(assert (=> b!210770 (=> (not res!176983) (not e!143769))))

(assert (=> b!210770 (= res!176983 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331036))))

(declare-fun b!210771 () Bool)

(declare-fun lt!331035 () (_ BitVec 64))

(assert (=> b!210771 (= e!143769 (bvsle lt!331036 (bvmul lt!331035 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210771 (or (= lt!331035 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331035 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331035)))))

(assert (=> b!210771 (= lt!331035 ((_ sign_extend 32) (size!4609 (buf!5129 (_1!9675 lt!330646)))))))

(assert (= (and d!71317 res!176984) b!210770))

(assert (= (and b!210770 res!176983) b!210771))

(declare-fun m!324607 () Bool)

(assert (=> d!71317 m!324607))

(declare-fun m!324609 () Bool)

(assert (=> d!71317 m!324609))

(assert (=> b!210554 d!71317))

(declare-fun d!71319 () Bool)

(assert (=> d!71319 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204) (size!4609 (buf!5129 thiss!1204))))))

(declare-fun bs!17509 () Bool)

(assert (= bs!17509 d!71319))

(assert (=> bs!17509 m!324261))

(assert (=> start!44202 d!71319))

(declare-fun d!71321 () Bool)

(assert (=> d!71321 (= (invariant!0 (currentBit!9672 (_2!9674 lt!330652)) (currentByte!9677 (_2!9674 lt!330652)) (size!4609 (buf!5129 (_2!9674 lt!330652)))) (and (bvsge (currentBit!9672 (_2!9674 lt!330652)) #b00000000000000000000000000000000) (bvslt (currentBit!9672 (_2!9674 lt!330652)) #b00000000000000000000000000001000) (bvsge (currentByte!9677 (_2!9674 lt!330652)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9677 (_2!9674 lt!330652)) (size!4609 (buf!5129 (_2!9674 lt!330652)))) (and (= (currentBit!9672 (_2!9674 lt!330652)) #b00000000000000000000000000000000) (= (currentByte!9677 (_2!9674 lt!330652)) (size!4609 (buf!5129 (_2!9674 lt!330652))))))))))

(assert (=> b!210556 d!71321))

(assert (=> b!210547 d!71257))

(assert (=> b!210547 d!71259))

(declare-fun d!71323 () Bool)

(declare-fun e!143773 () Bool)

(assert (=> d!71323 e!143773))

(declare-fun res!176989 () Bool)

(assert (=> d!71323 (=> (not res!176989) (not e!143773))))

(declare-fun lt!331052 () (_ BitVec 64))

(declare-fun lt!331051 () BitStream!8326)

(assert (=> d!71323 (= res!176989 (= (bvadd lt!331052 (bvsub lt!330655 lt!330658)) (bitIndex!0 (size!4609 (buf!5129 lt!331051)) (currentByte!9677 lt!331051) (currentBit!9672 lt!331051))))))

(assert (=> d!71323 (or (not (= (bvand lt!331052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330655 lt!330658) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!331052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!331052 (bvsub lt!330655 lt!330658)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71323 (= lt!331052 (bitIndex!0 (size!4609 (buf!5129 (_2!9676 lt!330667))) (currentByte!9677 (_2!9676 lt!330667)) (currentBit!9672 (_2!9676 lt!330667))))))

(declare-fun moveBitIndex!0 (BitStream!8326 (_ BitVec 64)) tuple2!18038)

(assert (=> d!71323 (= lt!331051 (_2!9674 (moveBitIndex!0 (_2!9676 lt!330667) (bvsub lt!330655 lt!330658))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8326 (_ BitVec 64)) Bool)

(assert (=> d!71323 (moveBitIndexPrecond!0 (_2!9676 lt!330667) (bvsub lt!330655 lt!330658))))

(assert (=> d!71323 (= (withMovedBitIndex!0 (_2!9676 lt!330667) (bvsub lt!330655 lt!330658)) lt!331051)))

(declare-fun b!210776 () Bool)

(assert (=> b!210776 (= e!143773 (= (size!4609 (buf!5129 (_2!9676 lt!330667))) (size!4609 (buf!5129 lt!331051))))))

(assert (= (and d!71323 res!176989) b!210776))

(declare-fun m!324617 () Bool)

(assert (=> d!71323 m!324617))

(declare-fun m!324619 () Bool)

(assert (=> d!71323 m!324619))

(declare-fun m!324621 () Bool)

(assert (=> d!71323 m!324621))

(declare-fun m!324623 () Bool)

(assert (=> d!71323 m!324623))

(assert (=> b!210557 d!71323))

(declare-fun d!71329 () Bool)

(declare-fun lt!331066 () tuple2!18044)

(declare-fun lt!331068 () tuple2!18044)

(assert (=> d!71329 (and (= (_2!9677 lt!331066) (_2!9677 lt!331068)) (= (_1!9677 lt!331066) (_1!9677 lt!331068)))))

(declare-fun lt!331067 () Unit!15007)

(declare-fun lt!331069 () (_ BitVec 64))

(declare-fun lt!331065 () BitStream!8326)

(declare-fun lt!331070 () Bool)

(declare-fun choose!56 (BitStream!8326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18044 tuple2!18044 BitStream!8326 (_ BitVec 64) Bool BitStream!8326 (_ BitVec 64) tuple2!18044 tuple2!18044 BitStream!8326 (_ BitVec 64)) Unit!15007)

(assert (=> d!71329 (= lt!331067 (choose!56 (_1!9676 lt!330667) nBits!348 i!590 lt!330657 lt!331066 (tuple2!18045 (_1!9677 lt!331066) (_2!9677 lt!331066)) (_1!9677 lt!331066) (_2!9677 lt!331066) lt!331070 lt!331065 lt!331069 lt!331068 (tuple2!18045 (_1!9677 lt!331068) (_2!9677 lt!331068)) (_1!9677 lt!331068) (_2!9677 lt!331068)))))

(assert (=> d!71329 (= lt!331068 (readNBitsLSBFirstsLoopPure!0 lt!331065 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!331069))))

(assert (=> d!71329 (= lt!331069 (bvor lt!330657 (ite lt!331070 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71329 (= lt!331065 (withMovedBitIndex!0 (_1!9676 lt!330667) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71329 (= lt!331070 (_2!9675 (readBitPure!0 (_1!9676 lt!330667))))))

(assert (=> d!71329 (= lt!331066 (readNBitsLSBFirstsLoopPure!0 (_1!9676 lt!330667) nBits!348 i!590 lt!330657))))

(assert (=> d!71329 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9676 lt!330667) nBits!348 i!590 lt!330657) lt!331067)))

(declare-fun bs!17512 () Bool)

(assert (= bs!17512 d!71329))

(assert (=> bs!17512 m!324275))

(declare-fun m!324625 () Bool)

(assert (=> bs!17512 m!324625))

(declare-fun m!324627 () Bool)

(assert (=> bs!17512 m!324627))

(assert (=> bs!17512 m!324241))

(assert (=> bs!17512 m!324273))

(assert (=> b!210559 d!71329))

(declare-fun d!71331 () Bool)

(declare-fun lt!331071 () tuple2!18064)

(assert (=> d!71331 (= lt!331071 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9676 lt!330667) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330660))))

(assert (=> d!71331 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9676 lt!330667) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330660) (tuple2!18045 (_2!9687 lt!331071) (_1!9687 lt!331071)))))

(declare-fun bs!17513 () Bool)

(assert (= bs!17513 d!71331))

(assert (=> bs!17513 m!324241))

(declare-fun m!324629 () Bool)

(assert (=> bs!17513 m!324629))

(assert (=> b!210559 d!71331))

(declare-fun d!71333 () Bool)

(declare-fun e!143774 () Bool)

(assert (=> d!71333 e!143774))

(declare-fun res!176990 () Bool)

(assert (=> d!71333 (=> (not res!176990) (not e!143774))))

(declare-fun lt!331073 () (_ BitVec 64))

(declare-fun lt!331072 () BitStream!8326)

(assert (=> d!71333 (= res!176990 (= (bvadd lt!331073 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4609 (buf!5129 lt!331072)) (currentByte!9677 lt!331072) (currentBit!9672 lt!331072))))))

(assert (=> d!71333 (or (not (= (bvand lt!331073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!331073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!331073 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71333 (= lt!331073 (bitIndex!0 (size!4609 (buf!5129 (_1!9676 lt!330667))) (currentByte!9677 (_1!9676 lt!330667)) (currentBit!9672 (_1!9676 lt!330667))))))

(assert (=> d!71333 (= lt!331072 (_2!9674 (moveBitIndex!0 (_1!9676 lt!330667) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!71333 (moveBitIndexPrecond!0 (_1!9676 lt!330667) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71333 (= (withMovedBitIndex!0 (_1!9676 lt!330667) #b0000000000000000000000000000000000000000000000000000000000000001) lt!331072)))

(declare-fun b!210777 () Bool)

(assert (=> b!210777 (= e!143774 (= (size!4609 (buf!5129 (_1!9676 lt!330667))) (size!4609 (buf!5129 lt!331072))))))

(assert (= (and d!71333 res!176990) b!210777))

(declare-fun m!324631 () Bool)

(assert (=> d!71333 m!324631))

(declare-fun m!324633 () Bool)

(assert (=> d!71333 m!324633))

(declare-fun m!324635 () Bool)

(assert (=> d!71333 m!324635))

(declare-fun m!324637 () Bool)

(assert (=> d!71333 m!324637))

(assert (=> b!210559 d!71333))

(declare-fun d!71335 () Bool)

(declare-fun res!176993 () Bool)

(declare-fun e!143775 () Bool)

(assert (=> d!71335 (=> (not res!176993) (not e!143775))))

(assert (=> d!71335 (= res!176993 (= (size!4609 (buf!5129 thiss!1204)) (size!4609 (buf!5129 (_2!9674 lt!330648)))))))

(assert (=> d!71335 (= (isPrefixOf!0 thiss!1204 (_2!9674 lt!330648)) e!143775)))

(declare-fun b!210778 () Bool)

(declare-fun res!176992 () Bool)

(assert (=> b!210778 (=> (not res!176992) (not e!143775))))

(assert (=> b!210778 (= res!176992 (bvsle (bitIndex!0 (size!4609 (buf!5129 thiss!1204)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204)) (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648)))))))

(declare-fun b!210779 () Bool)

(declare-fun e!143776 () Bool)

(assert (=> b!210779 (= e!143775 e!143776)))

(declare-fun res!176991 () Bool)

(assert (=> b!210779 (=> res!176991 e!143776)))

(assert (=> b!210779 (= res!176991 (= (size!4609 (buf!5129 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210780 () Bool)

(assert (=> b!210780 (= e!143776 (arrayBitRangesEq!0 (buf!5129 thiss!1204) (buf!5129 (_2!9674 lt!330648)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4609 (buf!5129 thiss!1204)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204))))))

(assert (= (and d!71335 res!176993) b!210778))

(assert (= (and b!210778 res!176992) b!210779))

(assert (= (and b!210779 (not res!176991)) b!210780))

(assert (=> b!210778 m!324269))

(assert (=> b!210778 m!324267))

(assert (=> b!210780 m!324269))

(assert (=> b!210780 m!324269))

(declare-fun m!324639 () Bool)

(assert (=> b!210780 m!324639))

(assert (=> b!210558 d!71335))

(declare-fun d!71337 () Bool)

(declare-fun e!143777 () Bool)

(assert (=> d!71337 e!143777))

(declare-fun res!176995 () Bool)

(assert (=> d!71337 (=> (not res!176995) (not e!143777))))

(declare-fun lt!331078 () (_ BitVec 64))

(declare-fun lt!331079 () (_ BitVec 64))

(declare-fun lt!331076 () (_ BitVec 64))

(assert (=> d!71337 (= res!176995 (= lt!331078 (bvsub lt!331079 lt!331076)))))

(assert (=> d!71337 (or (= (bvand lt!331079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331076 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331079 lt!331076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71337 (= lt!331076 (remainingBits!0 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330652)))) ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330652))) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330652)))))))

(declare-fun lt!331075 () (_ BitVec 64))

(declare-fun lt!331074 () (_ BitVec 64))

(assert (=> d!71337 (= lt!331079 (bvmul lt!331075 lt!331074))))

(assert (=> d!71337 (or (= lt!331075 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331074 (bvsdiv (bvmul lt!331075 lt!331074) lt!331075)))))

(assert (=> d!71337 (= lt!331074 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71337 (= lt!331075 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330652)))))))

(assert (=> d!71337 (= lt!331078 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330652))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330652)))))))

(assert (=> d!71337 (invariant!0 (currentBit!9672 (_2!9674 lt!330652)) (currentByte!9677 (_2!9674 lt!330652)) (size!4609 (buf!5129 (_2!9674 lt!330652))))))

(assert (=> d!71337 (= (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330652))) (currentByte!9677 (_2!9674 lt!330652)) (currentBit!9672 (_2!9674 lt!330652))) lt!331078)))

(declare-fun b!210781 () Bool)

(declare-fun res!176994 () Bool)

(assert (=> b!210781 (=> (not res!176994) (not e!143777))))

(assert (=> b!210781 (= res!176994 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331078))))

(declare-fun b!210782 () Bool)

(declare-fun lt!331077 () (_ BitVec 64))

(assert (=> b!210782 (= e!143777 (bvsle lt!331078 (bvmul lt!331077 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210782 (or (= lt!331077 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331077 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331077)))))

(assert (=> b!210782 (= lt!331077 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330652)))))))

(assert (= (and d!71337 res!176995) b!210781))

(assert (= (and b!210781 res!176994) b!210782))

(declare-fun m!324641 () Bool)

(assert (=> d!71337 m!324641))

(assert (=> d!71337 m!324237))

(assert (=> b!210560 d!71337))

(declare-fun d!71339 () Bool)

(declare-fun res!176998 () Bool)

(declare-fun e!143778 () Bool)

(assert (=> d!71339 (=> (not res!176998) (not e!143778))))

(assert (=> d!71339 (= res!176998 (= (size!4609 (buf!5129 thiss!1204)) (size!4609 (buf!5129 (_2!9674 lt!330652)))))))

(assert (=> d!71339 (= (isPrefixOf!0 thiss!1204 (_2!9674 lt!330652)) e!143778)))

(declare-fun b!210783 () Bool)

(declare-fun res!176997 () Bool)

(assert (=> b!210783 (=> (not res!176997) (not e!143778))))

(assert (=> b!210783 (= res!176997 (bvsle (bitIndex!0 (size!4609 (buf!5129 thiss!1204)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204)) (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330652))) (currentByte!9677 (_2!9674 lt!330652)) (currentBit!9672 (_2!9674 lt!330652)))))))

(declare-fun b!210784 () Bool)

(declare-fun e!143779 () Bool)

(assert (=> b!210784 (= e!143778 e!143779)))

(declare-fun res!176996 () Bool)

(assert (=> b!210784 (=> res!176996 e!143779)))

(assert (=> b!210784 (= res!176996 (= (size!4609 (buf!5129 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210785 () Bool)

(assert (=> b!210785 (= e!143779 (arrayBitRangesEq!0 (buf!5129 thiss!1204) (buf!5129 (_2!9674 lt!330652)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4609 (buf!5129 thiss!1204)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204))))))

(assert (= (and d!71339 res!176998) b!210783))

(assert (= (and b!210783 res!176997) b!210784))

(assert (= (and b!210784 (not res!176996)) b!210785))

(assert (=> b!210783 m!324269))

(assert (=> b!210783 m!324247))

(assert (=> b!210785 m!324269))

(assert (=> b!210785 m!324269))

(declare-fun m!324643 () Bool)

(assert (=> b!210785 m!324643))

(assert (=> b!210560 d!71339))

(declare-fun d!71341 () Bool)

(assert (=> d!71341 (isPrefixOf!0 thiss!1204 (_2!9674 lt!330652))))

(declare-fun lt!331082 () Unit!15007)

(declare-fun choose!30 (BitStream!8326 BitStream!8326 BitStream!8326) Unit!15007)

(assert (=> d!71341 (= lt!331082 (choose!30 thiss!1204 (_2!9674 lt!330648) (_2!9674 lt!330652)))))

(assert (=> d!71341 (isPrefixOf!0 thiss!1204 (_2!9674 lt!330648))))

(assert (=> d!71341 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9674 lt!330648) (_2!9674 lt!330652)) lt!331082)))

(declare-fun bs!17514 () Bool)

(assert (= bs!17514 d!71341))

(assert (=> bs!17514 m!324249))

(declare-fun m!324645 () Bool)

(assert (=> bs!17514 m!324645))

(assert (=> bs!17514 m!324309))

(assert (=> b!210560 d!71341))

(declare-fun b!210863 () Bool)

(declare-fun lt!331367 () tuple2!18040)

(declare-fun lt!331345 () tuple2!18038)

(assert (=> b!210863 (= lt!331367 (readBitPure!0 (readerFrom!0 (_2!9674 lt!331345) (currentBit!9672 (_2!9674 lt!330648)) (currentByte!9677 (_2!9674 lt!330648)))))))

(declare-fun res!177061 () Bool)

(declare-fun lt!331336 () Bool)

(assert (=> b!210863 (= res!177061 (and (= (_2!9675 lt!331367) lt!331336) (= (_1!9675 lt!331367) (_2!9674 lt!331345))))))

(declare-fun e!143826 () Bool)

(assert (=> b!210863 (=> (not res!177061) (not e!143826))))

(declare-fun e!143829 () Bool)

(assert (=> b!210863 (= e!143829 e!143826)))

(declare-fun b!210864 () Bool)

(declare-fun res!177065 () Bool)

(declare-fun e!143825 () Bool)

(assert (=> b!210864 (=> (not res!177065) (not e!143825))))

(declare-fun lt!331371 () tuple2!18038)

(assert (=> b!210864 (= res!177065 (= (size!4609 (buf!5129 (_2!9674 lt!330648))) (size!4609 (buf!5129 (_2!9674 lt!331371)))))))

(declare-fun b!210865 () Bool)

(declare-fun res!177071 () Bool)

(assert (=> b!210865 (= res!177071 (isPrefixOf!0 (_2!9674 lt!330648) (_2!9674 lt!331345)))))

(assert (=> b!210865 (=> (not res!177071) (not e!143829))))

(declare-fun b!210866 () Bool)

(declare-fun res!177060 () Bool)

(assert (=> b!210866 (= res!177060 (= (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!331345))) (currentByte!9677 (_2!9674 lt!331345)) (currentBit!9672 (_2!9674 lt!331345))) (bvadd (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!210866 (=> (not res!177060) (not e!143829))))

(declare-fun b!210867 () Bool)

(declare-fun e!143822 () Bool)

(declare-fun lt!331369 () tuple2!18044)

(declare-fun lt!331335 () tuple2!18042)

(assert (=> b!210867 (= e!143822 (= (_1!9677 lt!331369) (_2!9676 lt!331335)))))

(declare-fun b!210868 () Bool)

(declare-fun res!177068 () Bool)

(assert (=> b!210868 (=> (not res!177068) (not e!143825))))

(assert (=> b!210868 (= res!177068 (isPrefixOf!0 (_2!9674 lt!330648) (_2!9674 lt!331371)))))

(declare-fun b!210869 () Bool)

(declare-fun e!143823 () Bool)

(assert (=> b!210869 (= e!143825 e!143823)))

(declare-fun res!177066 () Bool)

(assert (=> b!210869 (=> (not res!177066) (not e!143823))))

(declare-fun lt!331376 () tuple2!18044)

(assert (=> b!210869 (= res!177066 (= (_2!9677 lt!331376) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!331340 () tuple2!18042)

(assert (=> b!210869 (= lt!331376 (readNBitsLSBFirstsLoopPure!0 (_1!9676 lt!331340) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!331346 () Unit!15007)

(declare-fun lt!331348 () Unit!15007)

(assert (=> b!210869 (= lt!331346 lt!331348)))

(declare-fun lt!331364 () (_ BitVec 64))

(assert (=> b!210869 (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!331371)))) ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330648))) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330648))) lt!331364)))

(assert (=> b!210869 (= lt!331348 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9674 lt!330648) (buf!5129 (_2!9674 lt!331371)) lt!331364))))

(declare-fun e!143830 () Bool)

(assert (=> b!210869 e!143830))

(declare-fun res!177063 () Bool)

(assert (=> b!210869 (=> (not res!177063) (not e!143830))))

(assert (=> b!210869 (= res!177063 (and (= (size!4609 (buf!5129 (_2!9674 lt!330648))) (size!4609 (buf!5129 (_2!9674 lt!331371)))) (bvsge lt!331364 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210869 (= lt!331364 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!210869 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!210869 (= lt!331340 (reader!0 (_2!9674 lt!330648) (_2!9674 lt!331371)))))

(declare-fun b!210870 () Bool)

(assert (=> b!210870 (= e!143826 (= (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!331367))) (currentByte!9677 (_1!9675 lt!331367)) (currentBit!9672 (_1!9675 lt!331367))) (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!331345))) (currentByte!9677 (_2!9674 lt!331345)) (currentBit!9672 (_2!9674 lt!331345)))))))

(declare-fun b!210871 () Bool)

(declare-fun res!177070 () Bool)

(assert (=> b!210871 (=> (not res!177070) (not e!143825))))

(declare-fun lt!331356 () (_ BitVec 64))

(declare-fun lt!331354 () (_ BitVec 64))

(assert (=> b!210871 (= res!177070 (= (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!331371))) (currentByte!9677 (_2!9674 lt!331371)) (currentBit!9672 (_2!9674 lt!331371))) (bvsub lt!331356 lt!331354)))))

(assert (=> b!210871 (or (= (bvand lt!331356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331354 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331356 lt!331354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210871 (= lt!331354 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!331381 () (_ BitVec 64))

(declare-fun lt!331374 () (_ BitVec 64))

(assert (=> b!210871 (= lt!331356 (bvadd lt!331381 lt!331374))))

(assert (=> b!210871 (or (not (= (bvand lt!331381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331374 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!331381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!331381 lt!331374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210871 (= lt!331374 ((_ sign_extend 32) nBits!348))))

(assert (=> b!210871 (= lt!331381 (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))))))

(declare-fun b!210872 () Bool)

(declare-fun e!143828 () (_ BitVec 64))

(assert (=> b!210872 (= e!143828 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!210873 () Bool)

(declare-fun e!143827 () tuple2!18038)

(declare-fun lt!331383 () tuple2!18038)

(assert (=> b!210873 (= e!143827 (tuple2!18039 (_1!9674 lt!331383) (_2!9674 lt!331383)))))

(assert (=> b!210873 (= lt!331336 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210873 (= lt!331345 (appendBit!0 (_2!9674 lt!330648) lt!331336))))

(declare-fun res!177067 () Bool)

(assert (=> b!210873 (= res!177067 (= (size!4609 (buf!5129 (_2!9674 lt!330648))) (size!4609 (buf!5129 (_2!9674 lt!331345)))))))

(assert (=> b!210873 (=> (not res!177067) (not e!143829))))

(assert (=> b!210873 e!143829))

(declare-fun lt!331362 () tuple2!18038)

(assert (=> b!210873 (= lt!331362 lt!331345)))

(assert (=> b!210873 (= lt!331383 (appendBitsLSBFirstLoopTR!0 (_2!9674 lt!331362) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!331370 () Unit!15007)

(assert (=> b!210873 (= lt!331370 (lemmaIsPrefixTransitive!0 (_2!9674 lt!330648) (_2!9674 lt!331362) (_2!9674 lt!331383)))))

(declare-fun call!3318 () Bool)

(assert (=> b!210873 call!3318))

(declare-fun lt!331351 () Unit!15007)

(assert (=> b!210873 (= lt!331351 lt!331370)))

(assert (=> b!210873 (invariant!0 (currentBit!9672 (_2!9674 lt!330648)) (currentByte!9677 (_2!9674 lt!330648)) (size!4609 (buf!5129 (_2!9674 lt!331362))))))

(declare-fun lt!331341 () BitStream!8326)

(assert (=> b!210873 (= lt!331341 (BitStream!8327 (buf!5129 (_2!9674 lt!331362)) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))))))

(assert (=> b!210873 (invariant!0 (currentBit!9672 lt!331341) (currentByte!9677 lt!331341) (size!4609 (buf!5129 (_2!9674 lt!331383))))))

(declare-fun lt!331334 () BitStream!8326)

(assert (=> b!210873 (= lt!331334 (BitStream!8327 (buf!5129 (_2!9674 lt!331383)) (currentByte!9677 lt!331341) (currentBit!9672 lt!331341)))))

(declare-fun lt!331358 () tuple2!18040)

(assert (=> b!210873 (= lt!331358 (readBitPure!0 lt!331341))))

(declare-fun lt!331378 () tuple2!18040)

(assert (=> b!210873 (= lt!331378 (readBitPure!0 lt!331334))))

(declare-fun lt!331332 () Unit!15007)

(assert (=> b!210873 (= lt!331332 (readBitPrefixLemma!0 lt!331341 (_2!9674 lt!331383)))))

(declare-fun res!177069 () Bool)

(assert (=> b!210873 (= res!177069 (= (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!331358))) (currentByte!9677 (_1!9675 lt!331358)) (currentBit!9672 (_1!9675 lt!331358))) (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!331378))) (currentByte!9677 (_1!9675 lt!331378)) (currentBit!9672 (_1!9675 lt!331378)))))))

(declare-fun e!143824 () Bool)

(assert (=> b!210873 (=> (not res!177069) (not e!143824))))

(assert (=> b!210873 e!143824))

(declare-fun lt!331361 () Unit!15007)

(assert (=> b!210873 (= lt!331361 lt!331332)))

(declare-fun lt!331357 () tuple2!18042)

(assert (=> b!210873 (= lt!331357 (reader!0 (_2!9674 lt!330648) (_2!9674 lt!331383)))))

(declare-fun lt!331337 () tuple2!18042)

(assert (=> b!210873 (= lt!331337 (reader!0 (_2!9674 lt!331362) (_2!9674 lt!331383)))))

(declare-fun lt!331366 () tuple2!18040)

(assert (=> b!210873 (= lt!331366 (readBitPure!0 (_1!9676 lt!331357)))))

(assert (=> b!210873 (= (_2!9675 lt!331366) lt!331336)))

(declare-fun lt!331368 () Unit!15007)

(declare-fun Unit!15015 () Unit!15007)

(assert (=> b!210873 (= lt!331368 Unit!15015)))

(declare-fun lt!331386 () (_ BitVec 64))

(assert (=> b!210873 (= lt!331386 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331331 () (_ BitVec 64))

(assert (=> b!210873 (= lt!331331 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331353 () Unit!15007)

(assert (=> b!210873 (= lt!331353 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9674 lt!330648) (buf!5129 (_2!9674 lt!331383)) lt!331331))))

(assert (=> b!210873 (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!331383)))) ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330648))) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330648))) lt!331331)))

(declare-fun lt!331343 () Unit!15007)

(assert (=> b!210873 (= lt!331343 lt!331353)))

(declare-fun lt!331347 () tuple2!18044)

(assert (=> b!210873 (= lt!331347 (readNBitsLSBFirstsLoopPure!0 (_1!9676 lt!331357) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!331386))))

(declare-fun lt!331365 () (_ BitVec 64))

(assert (=> b!210873 (= lt!331365 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!331342 () Unit!15007)

(assert (=> b!210873 (= lt!331342 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9674 lt!331362) (buf!5129 (_2!9674 lt!331383)) lt!331365))))

(assert (=> b!210873 (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!331383)))) ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!331362))) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!331362))) lt!331365)))

(declare-fun lt!331373 () Unit!15007)

(assert (=> b!210873 (= lt!331373 lt!331342)))

(declare-fun lt!331384 () tuple2!18044)

(assert (=> b!210873 (= lt!331384 (readNBitsLSBFirstsLoopPure!0 (_1!9676 lt!331337) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!331386 (ite (_2!9675 lt!331366) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!331385 () tuple2!18044)

(assert (=> b!210873 (= lt!331385 (readNBitsLSBFirstsLoopPure!0 (_1!9676 lt!331357) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!331386))))

(declare-fun c!10372 () Bool)

(assert (=> b!210873 (= c!10372 (_2!9675 (readBitPure!0 (_1!9676 lt!331357))))))

(declare-fun lt!331350 () tuple2!18044)

(assert (=> b!210873 (= lt!331350 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9676 lt!331357) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!331386 e!143828)))))

(declare-fun lt!331339 () Unit!15007)

(assert (=> b!210873 (= lt!331339 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9676 lt!331357) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!331386))))

(assert (=> b!210873 (and (= (_2!9677 lt!331385) (_2!9677 lt!331350)) (= (_1!9677 lt!331385) (_1!9677 lt!331350)))))

(declare-fun lt!331382 () Unit!15007)

(assert (=> b!210873 (= lt!331382 lt!331339)))

(assert (=> b!210873 (= (_1!9676 lt!331357) (withMovedBitIndex!0 (_2!9676 lt!331357) (bvsub (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))) (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!331383))) (currentByte!9677 (_2!9674 lt!331383)) (currentBit!9672 (_2!9674 lt!331383))))))))

(declare-fun lt!331349 () Unit!15007)

(declare-fun Unit!15016 () Unit!15007)

(assert (=> b!210873 (= lt!331349 Unit!15016)))

(assert (=> b!210873 (= (_1!9676 lt!331337) (withMovedBitIndex!0 (_2!9676 lt!331337) (bvsub (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!331362))) (currentByte!9677 (_2!9674 lt!331362)) (currentBit!9672 (_2!9674 lt!331362))) (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!331383))) (currentByte!9677 (_2!9674 lt!331383)) (currentBit!9672 (_2!9674 lt!331383))))))))

(declare-fun lt!331333 () Unit!15007)

(declare-fun Unit!15017 () Unit!15007)

(assert (=> b!210873 (= lt!331333 Unit!15017)))

(assert (=> b!210873 (= (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))) (bvsub (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!331362))) (currentByte!9677 (_2!9674 lt!331362)) (currentBit!9672 (_2!9674 lt!331362))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!331359 () Unit!15007)

(declare-fun Unit!15018 () Unit!15007)

(assert (=> b!210873 (= lt!331359 Unit!15018)))

(assert (=> b!210873 (= (_2!9677 lt!331347) (_2!9677 lt!331384))))

(declare-fun lt!331355 () Unit!15007)

(declare-fun Unit!15019 () Unit!15007)

(assert (=> b!210873 (= lt!331355 Unit!15019)))

(assert (=> b!210873 (invariant!0 (currentBit!9672 (_2!9674 lt!331383)) (currentByte!9677 (_2!9674 lt!331383)) (size!4609 (buf!5129 (_2!9674 lt!331383))))))

(declare-fun lt!331377 () Unit!15007)

(declare-fun Unit!15020 () Unit!15007)

(assert (=> b!210873 (= lt!331377 Unit!15020)))

(assert (=> b!210873 (= (size!4609 (buf!5129 (_2!9674 lt!330648))) (size!4609 (buf!5129 (_2!9674 lt!331383))))))

(declare-fun lt!331363 () Unit!15007)

(declare-fun Unit!15021 () Unit!15007)

(assert (=> b!210873 (= lt!331363 Unit!15021)))

(assert (=> b!210873 (= (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!331383))) (currentByte!9677 (_2!9674 lt!331383)) (currentBit!9672 (_2!9674 lt!331383))) (bvsub (bvadd (bitIndex!0 (size!4609 (buf!5129 (_2!9674 lt!330648))) (currentByte!9677 (_2!9674 lt!330648)) (currentBit!9672 (_2!9674 lt!330648))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331379 () Unit!15007)

(declare-fun Unit!15022 () Unit!15007)

(assert (=> b!210873 (= lt!331379 Unit!15022)))

(declare-fun lt!331375 () Unit!15007)

(declare-fun Unit!15023 () Unit!15007)

(assert (=> b!210873 (= lt!331375 Unit!15023)))

(assert (=> b!210873 (= lt!331335 (reader!0 (_2!9674 lt!330648) (_2!9674 lt!331383)))))

(declare-fun lt!331372 () (_ BitVec 64))

(assert (=> b!210873 (= lt!331372 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331338 () Unit!15007)

(assert (=> b!210873 (= lt!331338 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9674 lt!330648) (buf!5129 (_2!9674 lt!331383)) lt!331372))))

(assert (=> b!210873 (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!331383)))) ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330648))) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330648))) lt!331372)))

(declare-fun lt!331360 () Unit!15007)

(assert (=> b!210873 (= lt!331360 lt!331338)))

(assert (=> b!210873 (= lt!331369 (readNBitsLSBFirstsLoopPure!0 (_1!9676 lt!331335) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!177062 () Bool)

(assert (=> b!210873 (= res!177062 (= (_2!9677 lt!331369) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!210873 (=> (not res!177062) (not e!143822))))

(assert (=> b!210873 e!143822))

(declare-fun lt!331352 () Unit!15007)

(declare-fun Unit!15024 () Unit!15007)

(assert (=> b!210873 (= lt!331352 Unit!15024)))

(declare-fun b!210874 () Bool)

(assert (=> b!210874 (= e!143828 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun d!71343 () Bool)

(assert (=> d!71343 e!143825))

(declare-fun res!177064 () Bool)

(assert (=> d!71343 (=> (not res!177064) (not e!143825))))

(assert (=> d!71343 (= res!177064 (invariant!0 (currentBit!9672 (_2!9674 lt!331371)) (currentByte!9677 (_2!9674 lt!331371)) (size!4609 (buf!5129 (_2!9674 lt!331371)))))))

(assert (=> d!71343 (= lt!331371 e!143827)))

(declare-fun c!10371 () Bool)

(assert (=> d!71343 (= c!10371 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71343 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71343 (= (appendBitsLSBFirstLoopTR!0 (_2!9674 lt!330648) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!331371)))

(declare-fun b!210875 () Bool)

(assert (=> b!210875 (= e!143824 (= (_2!9675 lt!331358) (_2!9675 lt!331378)))))

(declare-fun b!210876 () Bool)

(declare-fun Unit!15025 () Unit!15007)

(assert (=> b!210876 (= e!143827 (tuple2!18039 Unit!15025 (_2!9674 lt!330648)))))

(declare-fun lt!331344 () Unit!15007)

(assert (=> b!210876 (= lt!331344 (lemmaIsPrefixRefl!0 (_2!9674 lt!330648)))))

(assert (=> b!210876 call!3318))

(declare-fun lt!331380 () Unit!15007)

(assert (=> b!210876 (= lt!331380 lt!331344)))

(declare-fun b!210877 () Bool)

(assert (=> b!210877 (= e!143830 (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 (_2!9674 lt!330648)))) ((_ sign_extend 32) (currentByte!9677 (_2!9674 lt!330648))) ((_ sign_extend 32) (currentBit!9672 (_2!9674 lt!330648))) lt!331364))))

(declare-fun bm!3315 () Bool)

(assert (=> bm!3315 (= call!3318 (isPrefixOf!0 (_2!9674 lt!330648) (ite c!10371 (_2!9674 lt!330648) (_2!9674 lt!331383))))))

(declare-fun b!210878 () Bool)

(assert (=> b!210878 (= e!143823 (= (_1!9677 lt!331376) (_2!9676 lt!331340)))))

(assert (= (and d!71343 c!10371) b!210876))

(assert (= (and d!71343 (not c!10371)) b!210873))

(assert (= (and b!210873 res!177067) b!210866))

(assert (= (and b!210866 res!177060) b!210865))

(assert (= (and b!210865 res!177071) b!210863))

(assert (= (and b!210863 res!177061) b!210870))

(assert (= (and b!210873 res!177069) b!210875))

(assert (= (and b!210873 c!10372) b!210874))

(assert (= (and b!210873 (not c!10372)) b!210872))

(assert (= (and b!210873 res!177062) b!210867))

(assert (= (or b!210876 b!210873) bm!3315))

(assert (= (and d!71343 res!177064) b!210864))

(assert (= (and b!210864 res!177065) b!210871))

(assert (= (and b!210871 res!177070) b!210868))

(assert (= (and b!210868 res!177068) b!210869))

(assert (= (and b!210869 res!177063) b!210877))

(assert (= (and b!210869 res!177066) b!210878))

(declare-fun m!324745 () Bool)

(assert (=> b!210871 m!324745))

(assert (=> b!210871 m!324267))

(declare-fun m!324747 () Bool)

(assert (=> bm!3315 m!324747))

(declare-fun m!324749 () Bool)

(assert (=> b!210866 m!324749))

(assert (=> b!210866 m!324267))

(declare-fun m!324751 () Bool)

(assert (=> b!210863 m!324751))

(assert (=> b!210863 m!324751))

(declare-fun m!324753 () Bool)

(assert (=> b!210863 m!324753))

(declare-fun m!324755 () Bool)

(assert (=> b!210873 m!324755))

(declare-fun m!324757 () Bool)

(assert (=> b!210873 m!324757))

(declare-fun m!324759 () Bool)

(assert (=> b!210873 m!324759))

(declare-fun m!324761 () Bool)

(assert (=> b!210873 m!324761))

(declare-fun m!324763 () Bool)

(assert (=> b!210873 m!324763))

(declare-fun m!324765 () Bool)

(assert (=> b!210873 m!324765))

(declare-fun m!324767 () Bool)

(assert (=> b!210873 m!324767))

(declare-fun m!324769 () Bool)

(assert (=> b!210873 m!324769))

(declare-fun m!324771 () Bool)

(assert (=> b!210873 m!324771))

(declare-fun m!324773 () Bool)

(assert (=> b!210873 m!324773))

(declare-fun m!324775 () Bool)

(assert (=> b!210873 m!324775))

(declare-fun m!324777 () Bool)

(assert (=> b!210873 m!324777))

(declare-fun m!324779 () Bool)

(assert (=> b!210873 m!324779))

(declare-fun m!324781 () Bool)

(assert (=> b!210873 m!324781))

(declare-fun m!324783 () Bool)

(assert (=> b!210873 m!324783))

(declare-fun m!324785 () Bool)

(assert (=> b!210873 m!324785))

(declare-fun m!324787 () Bool)

(assert (=> b!210873 m!324787))

(assert (=> b!210873 m!324771))

(declare-fun m!324789 () Bool)

(assert (=> b!210873 m!324789))

(declare-fun m!324791 () Bool)

(assert (=> b!210873 m!324791))

(declare-fun m!324793 () Bool)

(assert (=> b!210873 m!324793))

(declare-fun m!324795 () Bool)

(assert (=> b!210873 m!324795))

(declare-fun m!324797 () Bool)

(assert (=> b!210873 m!324797))

(assert (=> b!210873 m!324267))

(declare-fun m!324799 () Bool)

(assert (=> b!210873 m!324799))

(declare-fun m!324801 () Bool)

(assert (=> b!210873 m!324801))

(declare-fun m!324803 () Bool)

(assert (=> b!210873 m!324803))

(declare-fun m!324805 () Bool)

(assert (=> b!210873 m!324805))

(declare-fun m!324807 () Bool)

(assert (=> b!210873 m!324807))

(declare-fun m!324809 () Bool)

(assert (=> b!210873 m!324809))

(declare-fun m!324811 () Bool)

(assert (=> b!210873 m!324811))

(declare-fun m!324813 () Bool)

(assert (=> b!210873 m!324813))

(declare-fun m!324815 () Bool)

(assert (=> b!210873 m!324815))

(declare-fun m!324817 () Bool)

(assert (=> b!210873 m!324817))

(declare-fun m!324819 () Bool)

(assert (=> b!210869 m!324819))

(assert (=> b!210869 m!324767))

(declare-fun m!324821 () Bool)

(assert (=> b!210869 m!324821))

(declare-fun m!324823 () Bool)

(assert (=> b!210869 m!324823))

(assert (=> b!210869 m!324811))

(declare-fun m!324825 () Bool)

(assert (=> b!210869 m!324825))

(declare-fun m!324827 () Bool)

(assert (=> b!210865 m!324827))

(declare-fun m!324829 () Bool)

(assert (=> d!71343 m!324829))

(assert (=> b!210876 m!324507))

(declare-fun m!324831 () Bool)

(assert (=> b!210877 m!324831))

(declare-fun m!324833 () Bool)

(assert (=> b!210868 m!324833))

(declare-fun m!324835 () Bool)

(assert (=> b!210870 m!324835))

(assert (=> b!210870 m!324749))

(assert (=> b!210560 d!71343))

(declare-fun d!71389 () Bool)

(assert (=> d!71389 (= (array_inv!4350 (buf!5129 thiss!1204)) (bvsge (size!4609 (buf!5129 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!210549 d!71389))

(declare-fun d!71391 () Bool)

(assert (=> d!71391 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4609 (buf!5129 thiss!1204))) ((_ sign_extend 32) (currentByte!9677 thiss!1204)) ((_ sign_extend 32) (currentBit!9672 thiss!1204)) lt!330661) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4609 (buf!5129 thiss!1204))) ((_ sign_extend 32) (currentByte!9677 thiss!1204)) ((_ sign_extend 32) (currentBit!9672 thiss!1204))) lt!330661))))

(declare-fun bs!17525 () Bool)

(assert (= bs!17525 d!71391))

(assert (=> bs!17525 m!324469))

(assert (=> b!210551 d!71391))

(assert (=> b!210561 d!71335))

(declare-fun d!71393 () Bool)

(declare-fun lt!331387 () tuple2!18062)

(assert (=> d!71393 (= lt!331387 (readBit!0 (readerFrom!0 (_2!9674 lt!330648) (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204))))))

(assert (=> d!71393 (= (readBitPure!0 (readerFrom!0 (_2!9674 lt!330648) (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204))) (tuple2!18041 (_2!9686 lt!331387) (_1!9686 lt!331387)))))

(declare-fun bs!17526 () Bool)

(assert (= bs!17526 d!71393))

(assert (=> bs!17526 m!324263))

(declare-fun m!324837 () Bool)

(assert (=> bs!17526 m!324837))

(assert (=> b!210552 d!71393))

(declare-fun d!71395 () Bool)

(declare-fun e!143833 () Bool)

(assert (=> d!71395 e!143833))

(declare-fun res!177075 () Bool)

(assert (=> d!71395 (=> (not res!177075) (not e!143833))))

(assert (=> d!71395 (= res!177075 (invariant!0 (currentBit!9672 (_2!9674 lt!330648)) (currentByte!9677 (_2!9674 lt!330648)) (size!4609 (buf!5129 (_2!9674 lt!330648)))))))

(assert (=> d!71395 (= (readerFrom!0 (_2!9674 lt!330648) (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204)) (BitStream!8327 (buf!5129 (_2!9674 lt!330648)) (currentByte!9677 thiss!1204) (currentBit!9672 thiss!1204)))))

(declare-fun b!210881 () Bool)

(assert (=> b!210881 (= e!143833 (invariant!0 (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204) (size!4609 (buf!5129 (_2!9674 lt!330648)))))))

(assert (= (and d!71395 res!177075) b!210881))

(assert (=> d!71395 m!324467))

(assert (=> b!210881 m!324303))

(assert (=> b!210552 d!71395))

(declare-fun d!71397 () Bool)

(declare-fun e!143834 () Bool)

(assert (=> d!71397 e!143834))

(declare-fun res!177077 () Bool)

(assert (=> d!71397 (=> (not res!177077) (not e!143834))))

(declare-fun lt!331393 () (_ BitVec 64))

(declare-fun lt!331390 () (_ BitVec 64))

(declare-fun lt!331392 () (_ BitVec 64))

(assert (=> d!71397 (= res!177077 (= lt!331392 (bvsub lt!331393 lt!331390)))))

(assert (=> d!71397 (or (= (bvand lt!331393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331390 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331393 lt!331390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71397 (= lt!331390 (remainingBits!0 ((_ sign_extend 32) (size!4609 (buf!5129 (_1!9675 lt!330654)))) ((_ sign_extend 32) (currentByte!9677 (_1!9675 lt!330654))) ((_ sign_extend 32) (currentBit!9672 (_1!9675 lt!330654)))))))

(declare-fun lt!331389 () (_ BitVec 64))

(declare-fun lt!331388 () (_ BitVec 64))

(assert (=> d!71397 (= lt!331393 (bvmul lt!331389 lt!331388))))

(assert (=> d!71397 (or (= lt!331389 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331388 (bvsdiv (bvmul lt!331389 lt!331388) lt!331389)))))

(assert (=> d!71397 (= lt!331388 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71397 (= lt!331389 ((_ sign_extend 32) (size!4609 (buf!5129 (_1!9675 lt!330654)))))))

(assert (=> d!71397 (= lt!331392 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9677 (_1!9675 lt!330654))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9672 (_1!9675 lt!330654)))))))

(assert (=> d!71397 (invariant!0 (currentBit!9672 (_1!9675 lt!330654)) (currentByte!9677 (_1!9675 lt!330654)) (size!4609 (buf!5129 (_1!9675 lt!330654))))))

(assert (=> d!71397 (= (bitIndex!0 (size!4609 (buf!5129 (_1!9675 lt!330654))) (currentByte!9677 (_1!9675 lt!330654)) (currentBit!9672 (_1!9675 lt!330654))) lt!331392)))

(declare-fun b!210882 () Bool)

(declare-fun res!177076 () Bool)

(assert (=> b!210882 (=> (not res!177076) (not e!143834))))

(assert (=> b!210882 (= res!177076 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331392))))

(declare-fun b!210883 () Bool)

(declare-fun lt!331391 () (_ BitVec 64))

(assert (=> b!210883 (= e!143834 (bvsle lt!331392 (bvmul lt!331391 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210883 (or (= lt!331391 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331391 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331391)))))

(assert (=> b!210883 (= lt!331391 ((_ sign_extend 32) (size!4609 (buf!5129 (_1!9675 lt!330654)))))))

(assert (= (and d!71397 res!177077) b!210882))

(assert (= (and b!210882 res!177076) b!210883))

(declare-fun m!324839 () Bool)

(assert (=> d!71397 m!324839))

(declare-fun m!324841 () Bool)

(assert (=> d!71397 m!324841))

(assert (=> b!210563 d!71397))

(declare-fun d!71399 () Bool)

(assert (=> d!71399 (= (invariant!0 (currentBit!9672 thiss!1204) (currentByte!9677 thiss!1204) (size!4609 (buf!5129 thiss!1204))) (and (bvsge (currentBit!9672 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9672 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9677 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9677 thiss!1204) (size!4609 (buf!5129 thiss!1204))) (and (= (currentBit!9672 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9677 thiss!1204) (size!4609 (buf!5129 thiss!1204)))))))))

(assert (=> b!210562 d!71399))

(push 1)

(assert (not b!210778))

(assert (not d!71337))

(assert (not d!71329))

(assert (not b!210869))

(assert (not d!71305))

(assert (not b!210708))

(assert (not d!71393))

(assert (not b!210866))

(assert (not d!71395))

(assert (not b!210764))

(assert (not b!210766))

(assert (not d!71397))

(assert (not b!210706))

(assert (not d!71303))

(assert (not b!210873))

(assert (not b!210868))

(assert (not b!210734))

(assert (not d!71259))

(assert (not d!71317))

(assert (not b!210863))

(assert (not b!210871))

(assert (not b!210763))

(assert (not d!71299))

(assert (not b!210699))

(assert (not b!210783))

(assert (not d!71293))

(assert (not d!71287))

(assert (not b!210780))

(assert (not b!210731))

(assert (not b!210865))

(assert (not b!210876))

(assert (not d!71267))

(assert (not b!210696))

(assert (not d!71281))

(assert (not b!210785))

(assert (not d!71297))

(assert (not d!71333))

(assert (not d!71319))

(assert (not d!71315))

(assert (not b!210730))

(assert (not b!210870))

(assert (not d!71261))

(assert (not d!71323))

(assert (not d!71279))

(assert (not d!71331))

(assert (not d!71343))

(assert (not bm!3315))

(assert (not b!210877))

(assert (not d!71309))

(assert (not d!71285))

(assert (not d!71391))

(assert (not d!71341))

(assert (not d!71257))

(assert (not d!71283))

(assert (not b!210697))

(assert (not b!210762))

(assert (not b!210732))

(assert (not b!210698))

(assert (not b!210881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

