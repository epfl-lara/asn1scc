; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14734 () Bool)

(assert start!14734)

(declare-fun b!75826 () Bool)

(declare-fun res!62698 () Bool)

(declare-fun e!49606 () Bool)

(assert (=> b!75826 (=> (not res!62698) (not e!49606))))

(declare-datatypes ((array!3101 0))(
  ( (array!3102 (arr!2042 (Array (_ BitVec 32) (_ BitVec 8))) (size!1444 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2462 0))(
  ( (BitStream!2463 (buf!1825 array!3101) (currentByte!3616 (_ BitVec 32)) (currentBit!3611 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2462)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75826 (= res!62698 (validate_offset_bits!1 ((_ sign_extend 32) (size!1444 (buf!1825 thiss!1379))) ((_ sign_extend 32) (currentByte!3616 thiss!1379)) ((_ sign_extend 32) (currentBit!3611 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75827 () Bool)

(declare-fun e!49603 () Bool)

(declare-fun array_inv!1290 (array!3101) Bool)

(assert (=> b!75827 (= e!49603 (array_inv!1290 (buf!1825 thiss!1379)))))

(declare-fun res!62696 () Bool)

(assert (=> start!14734 (=> (not res!62696) (not e!49606))))

(declare-fun srcBuffer!2 () array!3101)

(assert (=> start!14734 (= res!62696 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1444 srcBuffer!2))))))))

(assert (=> start!14734 e!49606))

(assert (=> start!14734 true))

(assert (=> start!14734 (array_inv!1290 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2462) Bool)

(assert (=> start!14734 (and (inv!12 thiss!1379) e!49603)))

(declare-fun b!75828 () Bool)

(declare-fun e!49605 () Bool)

(assert (=> b!75828 (= e!49606 (not e!49605))))

(declare-fun res!62697 () Bool)

(assert (=> b!75828 (=> res!62697 e!49605)))

(declare-fun lt!121930 () (_ BitVec 64))

(assert (=> b!75828 (= res!62697 (or (bvslt i!635 to!314) (not (= lt!121930 (bvsub (bvadd lt!121930 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2462 BitStream!2462) Bool)

(assert (=> b!75828 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4988 0))(
  ( (Unit!4989) )
))
(declare-fun lt!121932 () Unit!4988)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2462) Unit!4988)

(assert (=> b!75828 (= lt!121932 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75828 (= lt!121930 (bitIndex!0 (size!1444 (buf!1825 thiss!1379)) (currentByte!3616 thiss!1379) (currentBit!3611 thiss!1379)))))

(declare-fun b!75829 () Bool)

(declare-fun e!49607 () Bool)

(assert (=> b!75829 (= e!49607 true)))

(declare-datatypes ((tuple2!6534 0))(
  ( (tuple2!6535 (_1!3398 array!3101) (_2!3398 BitStream!2462)) )
))
(declare-fun lt!121931 () tuple2!6534)

(declare-fun checkByteArrayBitContent!0 (BitStream!2462 array!3101 array!3101 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75829 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3398 lt!121931) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75830 () Bool)

(declare-fun res!62694 () Bool)

(assert (=> b!75830 (=> res!62694 e!49605)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75830 (= res!62694 (not (invariant!0 (currentBit!3611 thiss!1379) (currentByte!3616 thiss!1379) (size!1444 (buf!1825 thiss!1379)))))))

(declare-fun b!75831 () Bool)

(assert (=> b!75831 (= e!49605 e!49607)))

(declare-fun res!62695 () Bool)

(assert (=> b!75831 (=> res!62695 e!49607)))

(assert (=> b!75831 (= res!62695 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2462 (_ BitVec 64)) tuple2!6534)

(declare-datatypes ((tuple2!6536 0))(
  ( (tuple2!6537 (_1!3399 BitStream!2462) (_2!3399 BitStream!2462)) )
))
(declare-fun reader!0 (BitStream!2462 BitStream!2462) tuple2!6536)

(assert (=> b!75831 (= lt!121931 (readBits!0 (_1!3399 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14734 res!62696) b!75826))

(assert (= (and b!75826 res!62698) b!75828))

(assert (= (and b!75828 (not res!62697)) b!75830))

(assert (= (and b!75830 (not res!62694)) b!75831))

(assert (= (and b!75831 (not res!62695)) b!75829))

(assert (= start!14734 b!75827))

(declare-fun m!120931 () Bool)

(assert (=> b!75828 m!120931))

(declare-fun m!120933 () Bool)

(assert (=> b!75828 m!120933))

(declare-fun m!120935 () Bool)

(assert (=> b!75828 m!120935))

(declare-fun m!120937 () Bool)

(assert (=> b!75831 m!120937))

(declare-fun m!120939 () Bool)

(assert (=> b!75831 m!120939))

(declare-fun m!120941 () Bool)

(assert (=> b!75830 m!120941))

(declare-fun m!120943 () Bool)

(assert (=> b!75827 m!120943))

(declare-fun m!120945 () Bool)

(assert (=> start!14734 m!120945))

(declare-fun m!120947 () Bool)

(assert (=> start!14734 m!120947))

(declare-fun m!120949 () Bool)

(assert (=> b!75829 m!120949))

(declare-fun m!120951 () Bool)

(assert (=> b!75826 m!120951))

(push 1)

(assert (not b!75831))

(assert (not b!75829))

(assert (not b!75827))

(assert (not b!75828))

(assert (not b!75826))

(assert (not b!75830))

(assert (not start!14734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

