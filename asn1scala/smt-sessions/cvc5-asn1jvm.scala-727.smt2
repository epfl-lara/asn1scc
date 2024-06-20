; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20338 () Bool)

(assert start!20338)

(declare-fun b!102066 () Bool)

(declare-fun e!66744 () Bool)

(declare-datatypes ((array!4782 0))(
  ( (array!4783 (arr!2775 (Array (_ BitVec 32) (_ BitVec 8))) (size!2182 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3838 0))(
  ( (BitStream!3839 (buf!2542 array!4782) (currentByte!5015 (_ BitVec 32)) (currentBit!5010 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8284 0))(
  ( (tuple2!8285 (_1!4397 BitStream!3838) (_2!4397 Bool)) )
))
(declare-fun lt!148488 () tuple2!8284)

(declare-fun lt!148494 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102066 (= e!66744 (= (bitIndex!0 (size!2182 (buf!2542 (_1!4397 lt!148488))) (currentByte!5015 (_1!4397 lt!148488)) (currentBit!5010 (_1!4397 lt!148488))) lt!148494))))

(declare-fun b!102067 () Bool)

(declare-fun e!66742 () Bool)

(assert (=> b!102067 (= e!66742 e!66744)))

(declare-fun res!83893 () Bool)

(assert (=> b!102067 (=> (not res!83893) (not e!66744))))

(declare-fun lt!148499 () Bool)

(declare-datatypes ((Unit!6260 0))(
  ( (Unit!6261) )
))
(declare-datatypes ((tuple2!8286 0))(
  ( (tuple2!8287 (_1!4398 Unit!6260) (_2!4398 BitStream!3838)) )
))
(declare-fun lt!148503 () tuple2!8286)

(assert (=> b!102067 (= res!83893 (and (= (_2!4397 lt!148488) lt!148499) (= (_1!4397 lt!148488) (_2!4398 lt!148503))))))

(declare-fun thiss!1305 () BitStream!3838)

(declare-fun readBitPure!0 (BitStream!3838) tuple2!8284)

(declare-fun readerFrom!0 (BitStream!3838 (_ BitVec 32) (_ BitVec 32)) BitStream!3838)

(assert (=> b!102067 (= lt!148488 (readBitPure!0 (readerFrom!0 (_2!4398 lt!148503) (currentBit!5010 thiss!1305) (currentByte!5015 thiss!1305))))))

(declare-fun b!102068 () Bool)

(declare-fun res!83896 () Bool)

(assert (=> b!102068 (=> (not res!83896) (not e!66742))))

(declare-fun isPrefixOf!0 (BitStream!3838 BitStream!3838) Bool)

(assert (=> b!102068 (= res!83896 (isPrefixOf!0 thiss!1305 (_2!4398 lt!148503)))))

(declare-fun b!102069 () Bool)

(declare-fun res!83897 () Bool)

(declare-fun e!66743 () Bool)

(assert (=> b!102069 (=> (not res!83897) (not e!66743))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102069 (= res!83897 (invariant!0 (currentBit!5010 thiss!1305) (currentByte!5015 thiss!1305) (size!2182 (buf!2542 (_2!4398 lt!148503)))))))

(declare-fun b!102070 () Bool)

(declare-fun e!66746 () Bool)

(declare-fun lt!148498 () tuple2!8284)

(declare-fun lt!148497 () tuple2!8284)

(assert (=> b!102070 (= e!66746 (= (_2!4397 lt!148498) (_2!4397 lt!148497)))))

(declare-fun b!102071 () Bool)

(declare-fun e!66737 () Bool)

(declare-fun array_inv!1984 (array!4782) Bool)

(assert (=> b!102071 (= e!66737 (array_inv!1984 (buf!2542 thiss!1305)))))

(declare-fun e!66740 () Bool)

(declare-fun b!102072 () Bool)

(declare-fun lt!148487 () (_ BitVec 64))

(declare-fun lt!148501 () (_ BitVec 64))

(declare-fun lt!148495 () (_ BitVec 64))

(assert (=> b!102072 (= e!66740 (or (not (= (bvand lt!148495 lt!148501) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148495 lt!148487) lt!148495)))))

(declare-fun b!102073 () Bool)

(declare-fun e!66741 () Bool)

(declare-fun e!66745 () Bool)

(assert (=> b!102073 (= e!66741 e!66745)))

(declare-fun res!83892 () Bool)

(assert (=> b!102073 (=> (not res!83892) (not e!66745))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!102073 (= res!83892 (and (= (bvand v!199 lt!148487) v!199) (bvslt i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102073 (= lt!148487 (onesLSBLong!0 nBits!396))))

(declare-fun b!102074 () Bool)

(declare-fun lt!148490 () tuple2!8286)

(assert (=> b!102074 (= e!66743 (invariant!0 (currentBit!5010 thiss!1305) (currentByte!5015 thiss!1305) (size!2182 (buf!2542 (_2!4398 lt!148490)))))))

(declare-fun b!102075 () Bool)

(declare-fun e!66739 () Bool)

(assert (=> b!102075 (= e!66739 e!66742)))

(declare-fun res!83900 () Bool)

(assert (=> b!102075 (=> (not res!83900) (not e!66742))))

(declare-fun lt!148500 () (_ BitVec 64))

(assert (=> b!102075 (= res!83900 (= lt!148494 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148500)))))

(assert (=> b!102075 (= lt!148494 (bitIndex!0 (size!2182 (buf!2542 (_2!4398 lt!148503))) (currentByte!5015 (_2!4398 lt!148503)) (currentBit!5010 (_2!4398 lt!148503))))))

(assert (=> b!102075 (= lt!148500 (bitIndex!0 (size!2182 (buf!2542 thiss!1305)) (currentByte!5015 thiss!1305) (currentBit!5010 thiss!1305)))))

(declare-fun b!102076 () Bool)

(declare-fun e!66738 () Bool)

(assert (=> b!102076 (= e!66738 e!66741)))

(declare-fun res!83895 () Bool)

(assert (=> b!102076 (=> (not res!83895) (not e!66741))))

(declare-fun lt!148493 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102076 (= res!83895 (validate_offset_bits!1 ((_ sign_extend 32) (size!2182 (buf!2542 thiss!1305))) ((_ sign_extend 32) (currentByte!5015 thiss!1305)) ((_ sign_extend 32) (currentBit!5010 thiss!1305)) lt!148493))))

(assert (=> b!102076 (= lt!148493 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!83890 () Bool)

(assert (=> start!20338 (=> (not res!83890) (not e!66738))))

(assert (=> start!20338 (= res!83890 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20338 e!66738))

(assert (=> start!20338 true))

(declare-fun inv!12 (BitStream!3838) Bool)

(assert (=> start!20338 (and (inv!12 thiss!1305) e!66737)))

(declare-fun b!102077 () Bool)

(assert (=> b!102077 (= e!66745 (not e!66740))))

(declare-fun res!83899 () Bool)

(assert (=> b!102077 (=> res!83899 e!66740)))

(declare-datatypes ((tuple2!8288 0))(
  ( (tuple2!8289 (_1!4399 BitStream!3838) (_2!4399 BitStream!3838)) )
))
(declare-fun lt!148491 () tuple2!8288)

(assert (=> b!102077 (= res!83899 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2182 (buf!2542 (_1!4399 lt!148491)))) ((_ sign_extend 32) (currentByte!5015 (_1!4399 lt!148491))) ((_ sign_extend 32) (currentBit!5010 (_1!4399 lt!148491))) lt!148493)))))

(assert (=> b!102077 (validate_offset_bits!1 ((_ sign_extend 32) (size!2182 (buf!2542 (_2!4398 lt!148490)))) ((_ sign_extend 32) (currentByte!5015 thiss!1305)) ((_ sign_extend 32) (currentBit!5010 thiss!1305)) lt!148493)))

(declare-fun lt!148492 () Unit!6260)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3838 array!4782 (_ BitVec 64)) Unit!6260)

(assert (=> b!102077 (= lt!148492 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2542 (_2!4398 lt!148490)) lt!148493))))

(assert (=> b!102077 (= lt!148495 (bvand v!199 (bvnot lt!148501)))))

(assert (=> b!102077 (= lt!148501 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!102077 (= (_2!4397 (readBitPure!0 (_1!4399 lt!148491))) lt!148499)))

(declare-fun lt!148504 () tuple2!8288)

(declare-fun reader!0 (BitStream!3838 BitStream!3838) tuple2!8288)

(assert (=> b!102077 (= lt!148504 (reader!0 (_2!4398 lt!148503) (_2!4398 lt!148490)))))

(assert (=> b!102077 (= lt!148491 (reader!0 thiss!1305 (_2!4398 lt!148490)))))

(assert (=> b!102077 e!66746))

(declare-fun res!83894 () Bool)

(assert (=> b!102077 (=> (not res!83894) (not e!66746))))

(assert (=> b!102077 (= res!83894 (= (bitIndex!0 (size!2182 (buf!2542 (_1!4397 lt!148498))) (currentByte!5015 (_1!4397 lt!148498)) (currentBit!5010 (_1!4397 lt!148498))) (bitIndex!0 (size!2182 (buf!2542 (_1!4397 lt!148497))) (currentByte!5015 (_1!4397 lt!148497)) (currentBit!5010 (_1!4397 lt!148497)))))))

(declare-fun lt!148502 () Unit!6260)

(declare-fun lt!148489 () BitStream!3838)

(declare-fun readBitPrefixLemma!0 (BitStream!3838 BitStream!3838) Unit!6260)

(assert (=> b!102077 (= lt!148502 (readBitPrefixLemma!0 lt!148489 (_2!4398 lt!148490)))))

(assert (=> b!102077 (= lt!148497 (readBitPure!0 (BitStream!3839 (buf!2542 (_2!4398 lt!148490)) (currentByte!5015 thiss!1305) (currentBit!5010 thiss!1305))))))

(assert (=> b!102077 (= lt!148498 (readBitPure!0 lt!148489))))

(assert (=> b!102077 (= lt!148489 (BitStream!3839 (buf!2542 (_2!4398 lt!148503)) (currentByte!5015 thiss!1305) (currentBit!5010 thiss!1305)))))

(assert (=> b!102077 e!66743))

(declare-fun res!83898 () Bool)

(assert (=> b!102077 (=> (not res!83898) (not e!66743))))

(assert (=> b!102077 (= res!83898 (isPrefixOf!0 thiss!1305 (_2!4398 lt!148490)))))

(declare-fun lt!148496 () Unit!6260)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3838 BitStream!3838 BitStream!3838) Unit!6260)

(assert (=> b!102077 (= lt!148496 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4398 lt!148503) (_2!4398 lt!148490)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3838 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8286)

(assert (=> b!102077 (= lt!148490 (appendNLeastSignificantBitsLoop!0 (_2!4398 lt!148503) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!102077 e!66739))

(declare-fun res!83891 () Bool)

(assert (=> b!102077 (=> (not res!83891) (not e!66739))))

(assert (=> b!102077 (= res!83891 (= (size!2182 (buf!2542 thiss!1305)) (size!2182 (buf!2542 (_2!4398 lt!148503)))))))

(declare-fun appendBit!0 (BitStream!3838 Bool) tuple2!8286)

(assert (=> b!102077 (= lt!148503 (appendBit!0 thiss!1305 lt!148499))))

(assert (=> b!102077 (= lt!148499 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!20338 res!83890) b!102076))

(assert (= (and b!102076 res!83895) b!102073))

(assert (= (and b!102073 res!83892) b!102077))

(assert (= (and b!102077 res!83891) b!102075))

(assert (= (and b!102075 res!83900) b!102068))

(assert (= (and b!102068 res!83896) b!102067))

(assert (= (and b!102067 res!83893) b!102066))

(assert (= (and b!102077 res!83898) b!102069))

(assert (= (and b!102069 res!83897) b!102074))

(assert (= (and b!102077 res!83894) b!102070))

(assert (= (and b!102077 (not res!83899)) b!102072))

(assert (= start!20338 b!102071))

(declare-fun m!148603 () Bool)

(assert (=> b!102076 m!148603))

(declare-fun m!148605 () Bool)

(assert (=> b!102066 m!148605))

(declare-fun m!148607 () Bool)

(assert (=> b!102067 m!148607))

(assert (=> b!102067 m!148607))

(declare-fun m!148609 () Bool)

(assert (=> b!102067 m!148609))

(declare-fun m!148611 () Bool)

(assert (=> b!102069 m!148611))

(declare-fun m!148613 () Bool)

(assert (=> b!102077 m!148613))

(declare-fun m!148615 () Bool)

(assert (=> b!102077 m!148615))

(declare-fun m!148617 () Bool)

(assert (=> b!102077 m!148617))

(declare-fun m!148619 () Bool)

(assert (=> b!102077 m!148619))

(declare-fun m!148621 () Bool)

(assert (=> b!102077 m!148621))

(declare-fun m!148623 () Bool)

(assert (=> b!102077 m!148623))

(declare-fun m!148625 () Bool)

(assert (=> b!102077 m!148625))

(declare-fun m!148627 () Bool)

(assert (=> b!102077 m!148627))

(declare-fun m!148629 () Bool)

(assert (=> b!102077 m!148629))

(declare-fun m!148631 () Bool)

(assert (=> b!102077 m!148631))

(declare-fun m!148633 () Bool)

(assert (=> b!102077 m!148633))

(declare-fun m!148635 () Bool)

(assert (=> b!102077 m!148635))

(declare-fun m!148637 () Bool)

(assert (=> b!102077 m!148637))

(declare-fun m!148639 () Bool)

(assert (=> b!102077 m!148639))

(declare-fun m!148641 () Bool)

(assert (=> b!102077 m!148641))

(declare-fun m!148643 () Bool)

(assert (=> b!102077 m!148643))

(declare-fun m!148645 () Bool)

(assert (=> b!102068 m!148645))

(declare-fun m!148647 () Bool)

(assert (=> b!102073 m!148647))

(declare-fun m!148649 () Bool)

(assert (=> b!102075 m!148649))

(declare-fun m!148651 () Bool)

(assert (=> b!102075 m!148651))

(declare-fun m!148653 () Bool)

(assert (=> start!20338 m!148653))

(declare-fun m!148655 () Bool)

(assert (=> b!102071 m!148655))

(declare-fun m!148657 () Bool)

(assert (=> b!102074 m!148657))

(push 1)

(assert (not b!102068))

(assert (not b!102074))

(assert (not b!102076))

(assert (not b!102077))

(assert (not b!102075))

(assert (not start!20338))

(assert (not b!102066))

(assert (not b!102069))

(assert (not b!102073))

(assert (not b!102071))

(assert (not b!102067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

