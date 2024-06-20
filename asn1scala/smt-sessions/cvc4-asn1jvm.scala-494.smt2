; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14728 () Bool)

(assert start!14728)

(declare-fun res!62651 () Bool)

(declare-fun e!49554 () Bool)

(assert (=> start!14728 (=> (not res!62651) (not e!49554))))

(declare-datatypes ((array!3095 0))(
  ( (array!3096 (arr!2039 (Array (_ BitVec 32) (_ BitVec 8))) (size!1441 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3095)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14728 (= res!62651 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1441 srcBuffer!2))))))))

(assert (=> start!14728 e!49554))

(assert (=> start!14728 true))

(declare-fun array_inv!1287 (array!3095) Bool)

(assert (=> start!14728 (array_inv!1287 srcBuffer!2)))

(declare-datatypes ((BitStream!2456 0))(
  ( (BitStream!2457 (buf!1822 array!3095) (currentByte!3613 (_ BitVec 32)) (currentBit!3608 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2456)

(declare-fun e!49553 () Bool)

(declare-fun inv!12 (BitStream!2456) Bool)

(assert (=> start!14728 (and (inv!12 thiss!1379) e!49553)))

(declare-fun b!75772 () Bool)

(declare-fun res!62652 () Bool)

(assert (=> b!75772 (=> (not res!62652) (not e!49554))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75772 (= res!62652 (validate_offset_bits!1 ((_ sign_extend 32) (size!1441 (buf!1822 thiss!1379))) ((_ sign_extend 32) (currentByte!3613 thiss!1379)) ((_ sign_extend 32) (currentBit!3608 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75773 () Bool)

(declare-fun e!49551 () Bool)

(declare-fun e!49550 () Bool)

(assert (=> b!75773 (= e!49551 e!49550)))

(declare-fun res!62650 () Bool)

(assert (=> b!75773 (=> res!62650 e!49550)))

(assert (=> b!75773 (= res!62650 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6522 0))(
  ( (tuple2!6523 (_1!3392 array!3095) (_2!3392 BitStream!2456)) )
))
(declare-fun lt!121905 () tuple2!6522)

(declare-fun readBits!0 (BitStream!2456 (_ BitVec 64)) tuple2!6522)

(declare-datatypes ((tuple2!6524 0))(
  ( (tuple2!6525 (_1!3393 BitStream!2456) (_2!3393 BitStream!2456)) )
))
(declare-fun reader!0 (BitStream!2456 BitStream!2456) tuple2!6524)

(assert (=> b!75773 (= lt!121905 (readBits!0 (_1!3393 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75774 () Bool)

(assert (=> b!75774 (= e!49553 (array_inv!1287 (buf!1822 thiss!1379)))))

(declare-fun b!75775 () Bool)

(declare-fun res!62653 () Bool)

(assert (=> b!75775 (=> res!62653 e!49551)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75775 (= res!62653 (not (invariant!0 (currentBit!3608 thiss!1379) (currentByte!3613 thiss!1379) (size!1441 (buf!1822 thiss!1379)))))))

(declare-fun b!75776 () Bool)

(assert (=> b!75776 (= e!49554 (not e!49551))))

(declare-fun res!62649 () Bool)

(assert (=> b!75776 (=> res!62649 e!49551)))

(declare-fun lt!121904 () (_ BitVec 64))

(assert (=> b!75776 (= res!62649 (or (bvslt i!635 to!314) (not (= lt!121904 (bvsub (bvadd lt!121904 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2456 BitStream!2456) Bool)

(assert (=> b!75776 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4982 0))(
  ( (Unit!4983) )
))
(declare-fun lt!121903 () Unit!4982)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2456) Unit!4982)

(assert (=> b!75776 (= lt!121903 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75776 (= lt!121904 (bitIndex!0 (size!1441 (buf!1822 thiss!1379)) (currentByte!3613 thiss!1379) (currentBit!3608 thiss!1379)))))

(declare-fun b!75777 () Bool)

(assert (=> b!75777 (= e!49550 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun checkByteArrayBitContent!0 (BitStream!2456 array!3095 array!3095 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75777 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3392 lt!121905) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(assert (= (and start!14728 res!62651) b!75772))

(assert (= (and b!75772 res!62652) b!75776))

(assert (= (and b!75776 (not res!62649)) b!75775))

(assert (= (and b!75775 (not res!62653)) b!75773))

(assert (= (and b!75773 (not res!62650)) b!75777))

(assert (= start!14728 b!75774))

(declare-fun m!120865 () Bool)

(assert (=> b!75772 m!120865))

(declare-fun m!120867 () Bool)

(assert (=> start!14728 m!120867))

(declare-fun m!120869 () Bool)

(assert (=> start!14728 m!120869))

(declare-fun m!120871 () Bool)

(assert (=> b!75773 m!120871))

(declare-fun m!120873 () Bool)

(assert (=> b!75773 m!120873))

(declare-fun m!120875 () Bool)

(assert (=> b!75777 m!120875))

(declare-fun m!120877 () Bool)

(assert (=> b!75774 m!120877))

(declare-fun m!120879 () Bool)

(assert (=> b!75776 m!120879))

(declare-fun m!120881 () Bool)

(assert (=> b!75776 m!120881))

(declare-fun m!120883 () Bool)

(assert (=> b!75776 m!120883))

(declare-fun m!120885 () Bool)

(assert (=> b!75775 m!120885))

(push 1)

(assert (not b!75775))

(assert (not b!75776))

(assert (not b!75773))

(assert (not start!14728))

(assert (not b!75772))

(assert (not b!75774))

(assert (not b!75777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

