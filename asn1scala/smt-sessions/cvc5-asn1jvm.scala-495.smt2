; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14730 () Bool)

(assert start!14730)

(declare-fun b!75790 () Bool)

(declare-fun res!62664 () Bool)

(declare-fun e!49569 () Bool)

(assert (=> b!75790 (=> (not res!62664) (not e!49569))))

(declare-datatypes ((array!3097 0))(
  ( (array!3098 (arr!2040 (Array (_ BitVec 32) (_ BitVec 8))) (size!1442 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2458 0))(
  ( (BitStream!2459 (buf!1823 array!3097) (currentByte!3614 (_ BitVec 32)) (currentBit!3609 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2458)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75790 (= res!62664 (validate_offset_bits!1 ((_ sign_extend 32) (size!1442 (buf!1823 thiss!1379))) ((_ sign_extend 32) (currentByte!3614 thiss!1379)) ((_ sign_extend 32) (currentBit!3609 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!62665 () Bool)

(assert (=> start!14730 (=> (not res!62665) (not e!49569))))

(declare-fun srcBuffer!2 () array!3097)

(assert (=> start!14730 (= res!62665 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1442 srcBuffer!2))))))))

(assert (=> start!14730 e!49569))

(assert (=> start!14730 true))

(declare-fun array_inv!1288 (array!3097) Bool)

(assert (=> start!14730 (array_inv!1288 srcBuffer!2)))

(declare-fun e!49572 () Bool)

(declare-fun inv!12 (BitStream!2458) Bool)

(assert (=> start!14730 (and (inv!12 thiss!1379) e!49572)))

(declare-fun b!75791 () Bool)

(declare-fun res!62667 () Bool)

(declare-fun e!49568 () Bool)

(assert (=> b!75791 (=> res!62667 e!49568)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75791 (= res!62667 (not (invariant!0 (currentBit!3609 thiss!1379) (currentByte!3614 thiss!1379) (size!1442 (buf!1823 thiss!1379)))))))

(declare-fun b!75792 () Bool)

(declare-fun e!49570 () Bool)

(assert (=> b!75792 (= e!49568 e!49570)))

(declare-fun res!62666 () Bool)

(assert (=> b!75792 (=> res!62666 e!49570)))

(assert (=> b!75792 (= res!62666 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6526 0))(
  ( (tuple2!6527 (_1!3394 array!3097) (_2!3394 BitStream!2458)) )
))
(declare-fun lt!121913 () tuple2!6526)

(declare-fun readBits!0 (BitStream!2458 (_ BitVec 64)) tuple2!6526)

(declare-datatypes ((tuple2!6528 0))(
  ( (tuple2!6529 (_1!3395 BitStream!2458) (_2!3395 BitStream!2458)) )
))
(declare-fun reader!0 (BitStream!2458 BitStream!2458) tuple2!6528)

(assert (=> b!75792 (= lt!121913 (readBits!0 (_1!3395 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75793 () Bool)

(assert (=> b!75793 (= e!49570 true)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2458 array!3097 array!3097 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75793 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3394 lt!121913) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75794 () Bool)

(assert (=> b!75794 (= e!49572 (array_inv!1288 (buf!1823 thiss!1379)))))

(declare-fun b!75795 () Bool)

(assert (=> b!75795 (= e!49569 (not e!49568))))

(declare-fun res!62668 () Bool)

(assert (=> b!75795 (=> res!62668 e!49568)))

(declare-fun lt!121914 () (_ BitVec 64))

(assert (=> b!75795 (= res!62668 (or (bvslt i!635 to!314) (not (= lt!121914 (bvsub (bvadd lt!121914 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2458 BitStream!2458) Bool)

(assert (=> b!75795 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4984 0))(
  ( (Unit!4985) )
))
(declare-fun lt!121912 () Unit!4984)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2458) Unit!4984)

(assert (=> b!75795 (= lt!121912 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75795 (= lt!121914 (bitIndex!0 (size!1442 (buf!1823 thiss!1379)) (currentByte!3614 thiss!1379) (currentBit!3609 thiss!1379)))))

(assert (= (and start!14730 res!62665) b!75790))

(assert (= (and b!75790 res!62664) b!75795))

(assert (= (and b!75795 (not res!62668)) b!75791))

(assert (= (and b!75791 (not res!62667)) b!75792))

(assert (= (and b!75792 (not res!62666)) b!75793))

(assert (= start!14730 b!75794))

(declare-fun m!120887 () Bool)

(assert (=> b!75793 m!120887))

(declare-fun m!120889 () Bool)

(assert (=> b!75795 m!120889))

(declare-fun m!120891 () Bool)

(assert (=> b!75795 m!120891))

(declare-fun m!120893 () Bool)

(assert (=> b!75795 m!120893))

(declare-fun m!120895 () Bool)

(assert (=> start!14730 m!120895))

(declare-fun m!120897 () Bool)

(assert (=> start!14730 m!120897))

(declare-fun m!120899 () Bool)

(assert (=> b!75790 m!120899))

(declare-fun m!120901 () Bool)

(assert (=> b!75792 m!120901))

(declare-fun m!120903 () Bool)

(assert (=> b!75792 m!120903))

(declare-fun m!120905 () Bool)

(assert (=> b!75791 m!120905))

(declare-fun m!120907 () Bool)

(assert (=> b!75794 m!120907))

(push 1)

(assert (not start!14730))

(assert (not b!75794))

(assert (not b!75792))

(assert (not b!75791))

(assert (not b!75795))

(assert (not b!75793))

(assert (not b!75790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

