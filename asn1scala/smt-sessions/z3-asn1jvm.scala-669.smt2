; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18784 () Bool)

(assert start!18784)

(declare-fun b!93423 () Bool)

(declare-fun res!77090 () Bool)

(declare-fun e!61356 () Bool)

(assert (=> b!93423 (=> (not res!77090) (not e!61356))))

(declare-datatypes ((array!4376 0))(
  ( (array!4377 (arr!2602 (Array (_ BitVec 32) (_ BitVec 8))) (size!1985 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3492 0))(
  ( (BitStream!3493 (buf!2355 array!4376) (currentByte!4697 (_ BitVec 32)) (currentBit!4692 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3492)

(declare-fun base!8 () BitStream!3492)

(declare-fun isPrefixOf!0 (BitStream!3492 BitStream!3492) Bool)

(assert (=> b!93423 (= res!77090 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93424 () Bool)

(declare-fun res!77094 () Bool)

(assert (=> b!93424 (=> (not res!77094) (not e!61356))))

(declare-fun bitStream2!8 () BitStream!3492)

(assert (=> b!93424 (= res!77094 (and (= (buf!2355 bitStream1!8) (buf!2355 bitStream2!8)) (= (buf!2355 bitStream1!8) (buf!2355 base!8))))))

(declare-fun b!93425 () Bool)

(declare-fun res!77089 () Bool)

(assert (=> b!93425 (=> (not res!77089) (not e!61356))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93425 (= res!77089 (bvslt (bitIndex!0 (size!1985 (buf!2355 base!8)) (currentByte!4697 base!8) (currentBit!4692 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93426 () Bool)

(declare-fun e!61352 () Bool)

(declare-fun array_inv!1811 (array!4376) Bool)

(assert (=> b!93426 (= e!61352 (array_inv!1811 (buf!2355 base!8)))))

(declare-fun b!93427 () Bool)

(declare-fun res!77092 () Bool)

(assert (=> b!93427 (=> (not res!77092) (not e!61356))))

(assert (=> b!93427 (= res!77092 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93428 () Bool)

(declare-fun res!77088 () Bool)

(assert (=> b!93428 (=> (not res!77088) (not e!61356))))

(assert (=> b!93428 (= res!77088 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93429 () Bool)

(declare-fun e!61353 () Bool)

(assert (=> b!93429 (= e!61353 (array_inv!1811 (buf!2355 bitStream1!8)))))

(declare-fun b!93422 () Bool)

(declare-fun res!77093 () Bool)

(assert (=> b!93422 (=> (not res!77093) (not e!61356))))

(declare-datatypes ((List!852 0))(
  ( (Nil!849) (Cons!848 (h!967 Bool) (t!1602 List!852)) )
))
(declare-fun listBits!13 () List!852)

(declare-fun length!443 (List!852) Int)

(assert (=> b!93422 (= res!77093 (> (length!443 listBits!13) 0))))

(declare-fun res!77091 () Bool)

(assert (=> start!18784 (=> (not res!77091) (not e!61356))))

(assert (=> start!18784 (= res!77091 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18784 e!61356))

(assert (=> start!18784 true))

(declare-fun inv!12 (BitStream!3492) Bool)

(assert (=> start!18784 (and (inv!12 bitStream1!8) e!61353)))

(declare-fun e!61354 () Bool)

(assert (=> start!18784 (and (inv!12 bitStream2!8) e!61354)))

(assert (=> start!18784 (and (inv!12 base!8) e!61352)))

(declare-fun b!93430 () Bool)

(assert (=> b!93430 (= e!61356 false)))

(declare-fun lt!138456 () (_ BitVec 64))

(assert (=> b!93430 (= lt!138456 (bitIndex!0 (size!1985 (buf!2355 bitStream2!8)) (currentByte!4697 bitStream2!8) (currentBit!4692 bitStream2!8)))))

(declare-fun lt!138455 () (_ BitVec 64))

(assert (=> b!93430 (= lt!138455 (bitIndex!0 (size!1985 (buf!2355 bitStream1!8)) (currentByte!4697 bitStream1!8) (currentBit!4692 bitStream1!8)))))

(declare-fun b!93431 () Bool)

(assert (=> b!93431 (= e!61354 (array_inv!1811 (buf!2355 bitStream2!8)))))

(assert (= (and start!18784 res!77091) b!93422))

(assert (= (and b!93422 res!77093) b!93423))

(assert (= (and b!93423 res!77090) b!93428))

(assert (= (and b!93428 res!77088) b!93427))

(assert (= (and b!93427 res!77092) b!93424))

(assert (= (and b!93424 res!77094) b!93425))

(assert (= (and b!93425 res!77089) b!93430))

(assert (= start!18784 b!93429))

(assert (= start!18784 b!93431))

(assert (= start!18784 b!93426))

(declare-fun m!137209 () Bool)

(assert (=> start!18784 m!137209))

(declare-fun m!137211 () Bool)

(assert (=> start!18784 m!137211))

(declare-fun m!137213 () Bool)

(assert (=> start!18784 m!137213))

(declare-fun m!137215 () Bool)

(assert (=> b!93427 m!137215))

(declare-fun m!137217 () Bool)

(assert (=> b!93431 m!137217))

(declare-fun m!137219 () Bool)

(assert (=> b!93422 m!137219))

(declare-fun m!137221 () Bool)

(assert (=> b!93428 m!137221))

(declare-fun m!137223 () Bool)

(assert (=> b!93426 m!137223))

(declare-fun m!137225 () Bool)

(assert (=> b!93430 m!137225))

(declare-fun m!137227 () Bool)

(assert (=> b!93430 m!137227))

(declare-fun m!137229 () Bool)

(assert (=> b!93429 m!137229))

(declare-fun m!137231 () Bool)

(assert (=> b!93423 m!137231))

(declare-fun m!137233 () Bool)

(assert (=> b!93425 m!137233))

(check-sat (not b!93430) (not b!93427) (not b!93422) (not b!93425) (not b!93426) (not start!18784) (not b!93423) (not b!93431) (not b!93428) (not b!93429))
