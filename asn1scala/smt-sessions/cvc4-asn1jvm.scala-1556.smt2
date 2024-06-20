; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43636 () Bool)

(assert start!43636)

(declare-fun b!207206 () Bool)

(declare-fun e!141645 () Bool)

(declare-datatypes ((array!10419 0))(
  ( (array!10420 (arr!5511 (Array (_ BitVec 32) (_ BitVec 8))) (size!4581 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8270 0))(
  ( (BitStream!8271 (buf!5086 array!10419) (currentByte!9604 (_ BitVec 32)) (currentBit!9599 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8270)

(declare-fun array_inv!4322 (array!10419) Bool)

(assert (=> b!207206 (= e!141645 (array_inv!4322 (buf!5086 thiss!1204)))))

(declare-fun b!207208 () Bool)

(declare-fun res!173827 () Bool)

(declare-fun e!141644 () Bool)

(assert (=> b!207208 (=> res!173827 e!141644)))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((Unit!14756 0))(
  ( (Unit!14757) )
))
(declare-datatypes ((tuple2!17754 0))(
  ( (tuple2!17755 (_1!9532 Unit!14756) (_2!9532 BitStream!8270)) )
))
(declare-fun lt!323470 () tuple2!17754)

(declare-fun lt!323478 () (_ BitVec 64))

(declare-fun lt!323475 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!207208 (= res!173827 (or (not (= (size!4581 (buf!5086 (_2!9532 lt!323470))) (size!4581 (buf!5086 thiss!1204)))) (not (= lt!323478 (bvsub (bvadd lt!323475 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207209 () Bool)

(declare-fun e!141651 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207209 (= e!141651 (invariant!0 (currentBit!9599 thiss!1204) (currentByte!9604 thiss!1204) (size!4581 (buf!5086 (_2!9532 lt!323470)))))))

(declare-fun b!207210 () Bool)

(declare-fun e!141641 () Bool)

(declare-datatypes ((tuple2!17756 0))(
  ( (tuple2!17757 (_1!9533 BitStream!8270) (_2!9533 Bool)) )
))
(declare-fun lt!323477 () tuple2!17756)

(declare-fun lt!323476 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207210 (= e!141641 (= (bitIndex!0 (size!4581 (buf!5086 (_1!9533 lt!323477))) (currentByte!9604 (_1!9533 lt!323477)) (currentBit!9599 (_1!9533 lt!323477))) lt!323476))))

(declare-fun b!207211 () Bool)

(declare-fun res!173819 () Bool)

(assert (=> b!207211 (=> res!173819 e!141644)))

(declare-fun lt!323472 () tuple2!17754)

(declare-fun isPrefixOf!0 (BitStream!8270 BitStream!8270) Bool)

(assert (=> b!207211 (= res!173819 (not (isPrefixOf!0 (_2!9532 lt!323472) (_2!9532 lt!323470))))))

(declare-fun b!207212 () Bool)

(declare-fun res!173828 () Bool)

(declare-fun e!141648 () Bool)

(assert (=> b!207212 (=> (not res!173828) (not e!141648))))

(assert (=> b!207212 (= res!173828 (not (= i!590 nBits!348)))))

(declare-fun b!207213 () Bool)

(assert (=> b!207213 (= e!141644 (= (size!4581 (buf!5086 (_2!9532 lt!323472))) (size!4581 (buf!5086 (_2!9532 lt!323470)))))))

(declare-datatypes ((tuple2!17758 0))(
  ( (tuple2!17759 (_1!9534 BitStream!8270) (_2!9534 (_ BitVec 64))) )
))
(declare-fun lt!323481 () tuple2!17758)

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((tuple2!17760 0))(
  ( (tuple2!17761 (_1!9535 BitStream!8270) (_2!9535 BitStream!8270)) )
))
(declare-fun lt!323468 () tuple2!17760)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17758)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207213 (= lt!323481 (readNBitsLSBFirstsLoopPure!0 (_1!9535 lt!323468) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!323465 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207213 (validate_offset_bits!1 ((_ sign_extend 32) (size!4581 (buf!5086 (_2!9532 lt!323470)))) ((_ sign_extend 32) (currentByte!9604 thiss!1204)) ((_ sign_extend 32) (currentBit!9599 thiss!1204)) lt!323465)))

(declare-fun lt!323467 () Unit!14756)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8270 array!10419 (_ BitVec 64)) Unit!14756)

(assert (=> b!207213 (= lt!323467 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5086 (_2!9532 lt!323470)) lt!323465))))

(declare-fun lt!323474 () Bool)

(declare-fun readBitPure!0 (BitStream!8270) tuple2!17756)

(assert (=> b!207213 (= (_2!9533 (readBitPure!0 (_1!9535 lt!323468))) lt!323474)))

(declare-fun lt!323480 () tuple2!17760)

(declare-fun reader!0 (BitStream!8270 BitStream!8270) tuple2!17760)

(assert (=> b!207213 (= lt!323480 (reader!0 (_2!9532 lt!323472) (_2!9532 lt!323470)))))

(assert (=> b!207213 (= lt!323468 (reader!0 thiss!1204 (_2!9532 lt!323470)))))

(declare-fun e!141649 () Bool)

(assert (=> b!207213 e!141649))

(declare-fun res!173826 () Bool)

(assert (=> b!207213 (=> (not res!173826) (not e!141649))))

(declare-fun lt!323479 () tuple2!17756)

(declare-fun lt!323473 () tuple2!17756)

(assert (=> b!207213 (= res!173826 (= (bitIndex!0 (size!4581 (buf!5086 (_1!9533 lt!323479))) (currentByte!9604 (_1!9533 lt!323479)) (currentBit!9599 (_1!9533 lt!323479))) (bitIndex!0 (size!4581 (buf!5086 (_1!9533 lt!323473))) (currentByte!9604 (_1!9533 lt!323473)) (currentBit!9599 (_1!9533 lt!323473)))))))

(declare-fun lt!323466 () Unit!14756)

(declare-fun lt!323482 () BitStream!8270)

(declare-fun readBitPrefixLemma!0 (BitStream!8270 BitStream!8270) Unit!14756)

(assert (=> b!207213 (= lt!323466 (readBitPrefixLemma!0 lt!323482 (_2!9532 lt!323470)))))

(assert (=> b!207213 (= lt!323473 (readBitPure!0 (BitStream!8271 (buf!5086 (_2!9532 lt!323470)) (currentByte!9604 thiss!1204) (currentBit!9599 thiss!1204))))))

(assert (=> b!207213 (= lt!323479 (readBitPure!0 lt!323482))))

(assert (=> b!207213 e!141651))

(declare-fun res!173825 () Bool)

(assert (=> b!207213 (=> (not res!173825) (not e!141651))))

(assert (=> b!207213 (= res!173825 (invariant!0 (currentBit!9599 thiss!1204) (currentByte!9604 thiss!1204) (size!4581 (buf!5086 (_2!9532 lt!323472)))))))

(assert (=> b!207213 (= lt!323482 (BitStream!8271 (buf!5086 (_2!9532 lt!323472)) (currentByte!9604 thiss!1204) (currentBit!9599 thiss!1204)))))

(declare-fun b!207214 () Bool)

(declare-fun e!141643 () Bool)

(assert (=> b!207214 (= e!141648 (not e!141643))))

(declare-fun res!173823 () Bool)

(assert (=> b!207214 (=> res!173823 e!141643)))

(declare-fun lt!323469 () (_ BitVec 64))

(assert (=> b!207214 (= res!173823 (not (= lt!323469 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323475))))))

(assert (=> b!207214 (= lt!323469 (bitIndex!0 (size!4581 (buf!5086 (_2!9532 lt!323472))) (currentByte!9604 (_2!9532 lt!323472)) (currentBit!9599 (_2!9532 lt!323472))))))

(assert (=> b!207214 (= lt!323475 (bitIndex!0 (size!4581 (buf!5086 thiss!1204)) (currentByte!9604 thiss!1204) (currentBit!9599 thiss!1204)))))

(declare-fun e!141650 () Bool)

(assert (=> b!207214 e!141650))

(declare-fun res!173824 () Bool)

(assert (=> b!207214 (=> (not res!173824) (not e!141650))))

(assert (=> b!207214 (= res!173824 (= (size!4581 (buf!5086 thiss!1204)) (size!4581 (buf!5086 (_2!9532 lt!323472)))))))

(declare-fun appendBit!0 (BitStream!8270 Bool) tuple2!17754)

(assert (=> b!207214 (= lt!323472 (appendBit!0 thiss!1204 lt!323474))))

(assert (=> b!207214 (= lt!323474 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!207215 () Bool)

(declare-fun e!141642 () Bool)

(assert (=> b!207215 (= e!141642 e!141641)))

(declare-fun res!173821 () Bool)

(assert (=> b!207215 (=> (not res!173821) (not e!141641))))

(assert (=> b!207215 (= res!173821 (and (= (_2!9533 lt!323477) lt!323474) (= (_1!9533 lt!323477) (_2!9532 lt!323472))))))

(declare-fun readerFrom!0 (BitStream!8270 (_ BitVec 32) (_ BitVec 32)) BitStream!8270)

(assert (=> b!207215 (= lt!323477 (readBitPure!0 (readerFrom!0 (_2!9532 lt!323472) (currentBit!9599 thiss!1204) (currentByte!9604 thiss!1204))))))

(declare-fun b!207216 () Bool)

(assert (=> b!207216 (= e!141650 e!141642)))

(declare-fun res!173833 () Bool)

(assert (=> b!207216 (=> (not res!173833) (not e!141642))))

(declare-fun lt!323483 () (_ BitVec 64))

(assert (=> b!207216 (= res!173833 (= lt!323476 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323483)))))

(assert (=> b!207216 (= lt!323476 (bitIndex!0 (size!4581 (buf!5086 (_2!9532 lt!323472))) (currentByte!9604 (_2!9532 lt!323472)) (currentBit!9599 (_2!9532 lt!323472))))))

(assert (=> b!207216 (= lt!323483 (bitIndex!0 (size!4581 (buf!5086 thiss!1204)) (currentByte!9604 thiss!1204) (currentBit!9599 thiss!1204)))))

(declare-fun b!207217 () Bool)

(assert (=> b!207217 (= e!141649 (= (_2!9533 lt!323479) (_2!9533 lt!323473)))))

(declare-fun b!207218 () Bool)

(assert (=> b!207218 (= e!141643 e!141644)))

(declare-fun res!173832 () Bool)

(assert (=> b!207218 (=> res!173832 e!141644)))

(assert (=> b!207218 (= res!173832 (not (= lt!323478 (bvsub (bvsub (bvadd lt!323469 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!207218 (= lt!323478 (bitIndex!0 (size!4581 (buf!5086 (_2!9532 lt!323470))) (currentByte!9604 (_2!9532 lt!323470)) (currentBit!9599 (_2!9532 lt!323470))))))

(assert (=> b!207218 (isPrefixOf!0 thiss!1204 (_2!9532 lt!323470))))

(declare-fun lt!323471 () Unit!14756)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8270 BitStream!8270 BitStream!8270) Unit!14756)

(assert (=> b!207218 (= lt!323471 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9532 lt!323472) (_2!9532 lt!323470)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8270 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17754)

(assert (=> b!207218 (= lt!323470 (appendBitsLSBFirstLoopTR!0 (_2!9532 lt!323472) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!173822 () Bool)

(declare-fun e!141646 () Bool)

(assert (=> start!43636 (=> (not res!173822) (not e!141646))))

(assert (=> start!43636 (= res!173822 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43636 e!141646))

(assert (=> start!43636 true))

(declare-fun inv!12 (BitStream!8270) Bool)

(assert (=> start!43636 (and (inv!12 thiss!1204) e!141645)))

(declare-fun b!207207 () Bool)

(assert (=> b!207207 (= e!141646 e!141648)))

(declare-fun res!173830 () Bool)

(assert (=> b!207207 (=> (not res!173830) (not e!141648))))

(assert (=> b!207207 (= res!173830 (validate_offset_bits!1 ((_ sign_extend 32) (size!4581 (buf!5086 thiss!1204))) ((_ sign_extend 32) (currentByte!9604 thiss!1204)) ((_ sign_extend 32) (currentBit!9599 thiss!1204)) lt!323465))))

(assert (=> b!207207 (= lt!323465 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207219 () Bool)

(declare-fun res!173829 () Bool)

(assert (=> b!207219 (=> (not res!173829) (not e!141642))))

(assert (=> b!207219 (= res!173829 (isPrefixOf!0 thiss!1204 (_2!9532 lt!323472)))))

(declare-fun b!207220 () Bool)

(declare-fun res!173834 () Bool)

(assert (=> b!207220 (=> (not res!173834) (not e!141648))))

(assert (=> b!207220 (= res!173834 (invariant!0 (currentBit!9599 thiss!1204) (currentByte!9604 thiss!1204) (size!4581 (buf!5086 thiss!1204))))))

(declare-fun b!207221 () Bool)

(declare-fun res!173831 () Bool)

(assert (=> b!207221 (=> res!173831 e!141644)))

(assert (=> b!207221 (= res!173831 (not (isPrefixOf!0 thiss!1204 (_2!9532 lt!323472))))))

(declare-fun b!207222 () Bool)

(declare-fun res!173820 () Bool)

(assert (=> b!207222 (=> res!173820 e!141644)))

(assert (=> b!207222 (= res!173820 (not (invariant!0 (currentBit!9599 (_2!9532 lt!323470)) (currentByte!9604 (_2!9532 lt!323470)) (size!4581 (buf!5086 (_2!9532 lt!323470))))))))

(assert (= (and start!43636 res!173822) b!207207))

(assert (= (and b!207207 res!173830) b!207220))

(assert (= (and b!207220 res!173834) b!207212))

(assert (= (and b!207212 res!173828) b!207214))

(assert (= (and b!207214 res!173824) b!207216))

(assert (= (and b!207216 res!173833) b!207219))

(assert (= (and b!207219 res!173829) b!207215))

(assert (= (and b!207215 res!173821) b!207210))

(assert (= (and b!207214 (not res!173823)) b!207218))

(assert (= (and b!207218 (not res!173832)) b!207222))

(assert (= (and b!207222 (not res!173820)) b!207208))

(assert (= (and b!207208 (not res!173827)) b!207211))

(assert (= (and b!207211 (not res!173819)) b!207221))

(assert (= (and b!207221 (not res!173831)) b!207213))

(assert (= (and b!207213 res!173825) b!207209))

(assert (= (and b!207213 res!173826) b!207217))

(assert (= start!43636 b!207206))

(declare-fun m!318901 () Bool)

(assert (=> b!207209 m!318901))

(declare-fun m!318903 () Bool)

(assert (=> b!207215 m!318903))

(assert (=> b!207215 m!318903))

(declare-fun m!318905 () Bool)

(assert (=> b!207215 m!318905))

(declare-fun m!318907 () Bool)

(assert (=> b!207206 m!318907))

(declare-fun m!318909 () Bool)

(assert (=> b!207218 m!318909))

(declare-fun m!318911 () Bool)

(assert (=> b!207218 m!318911))

(declare-fun m!318913 () Bool)

(assert (=> b!207218 m!318913))

(declare-fun m!318915 () Bool)

(assert (=> b!207218 m!318915))

(declare-fun m!318917 () Bool)

(assert (=> b!207219 m!318917))

(declare-fun m!318919 () Bool)

(assert (=> b!207216 m!318919))

(declare-fun m!318921 () Bool)

(assert (=> b!207216 m!318921))

(declare-fun m!318923 () Bool)

(assert (=> b!207210 m!318923))

(declare-fun m!318925 () Bool)

(assert (=> start!43636 m!318925))

(declare-fun m!318927 () Bool)

(assert (=> b!207211 m!318927))

(assert (=> b!207214 m!318919))

(assert (=> b!207214 m!318921))

(declare-fun m!318929 () Bool)

(assert (=> b!207214 m!318929))

(declare-fun m!318931 () Bool)

(assert (=> b!207213 m!318931))

(declare-fun m!318933 () Bool)

(assert (=> b!207213 m!318933))

(declare-fun m!318935 () Bool)

(assert (=> b!207213 m!318935))

(declare-fun m!318937 () Bool)

(assert (=> b!207213 m!318937))

(declare-fun m!318939 () Bool)

(assert (=> b!207213 m!318939))

(declare-fun m!318941 () Bool)

(assert (=> b!207213 m!318941))

(declare-fun m!318943 () Bool)

(assert (=> b!207213 m!318943))

(declare-fun m!318945 () Bool)

(assert (=> b!207213 m!318945))

(declare-fun m!318947 () Bool)

(assert (=> b!207213 m!318947))

(declare-fun m!318949 () Bool)

(assert (=> b!207213 m!318949))

(declare-fun m!318951 () Bool)

(assert (=> b!207213 m!318951))

(declare-fun m!318953 () Bool)

(assert (=> b!207213 m!318953))

(declare-fun m!318955 () Bool)

(assert (=> b!207213 m!318955))

(assert (=> b!207221 m!318917))

(declare-fun m!318957 () Bool)

(assert (=> b!207220 m!318957))

(declare-fun m!318959 () Bool)

(assert (=> b!207222 m!318959))

(declare-fun m!318961 () Bool)

(assert (=> b!207207 m!318961))

(push 1)

