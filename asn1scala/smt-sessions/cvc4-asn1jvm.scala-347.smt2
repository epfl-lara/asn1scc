; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8198 () Bool)

(assert start!8198)

(declare-fun b!41022 () Bool)

(declare-fun e!27121 () Bool)

(declare-fun e!27119 () Bool)

(assert (=> b!41022 (= e!27121 (not e!27119))))

(declare-fun res!34917 () Bool)

(assert (=> b!41022 (=> res!34917 e!27119)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!62194 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!41022 (= res!34917 (or (bvslt i!635 to!314) (not (= lt!62194 (bvsub (bvadd lt!62194 to!314) i!635)))))))

(declare-datatypes ((array!2046 0))(
  ( (array!2047 (arr!1423 (Array (_ BitVec 32) (_ BitVec 8))) (size!924 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1592 0))(
  ( (BitStream!1593 (buf!1252 array!2046) (currentByte!2686 (_ BitVec 32)) (currentBit!2681 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1592)

(declare-fun isPrefixOf!0 (BitStream!1592 BitStream!1592) Bool)

(assert (=> b!41022 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2893 0))(
  ( (Unit!2894) )
))
(declare-fun lt!62192 () Unit!2893)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1592) Unit!2893)

(assert (=> b!41022 (= lt!62192 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41022 (= lt!62194 (bitIndex!0 (size!924 (buf!1252 thiss!1379)) (currentByte!2686 thiss!1379) (currentBit!2681 thiss!1379)))))

(declare-fun b!41023 () Bool)

(declare-fun e!27118 () Bool)

(declare-fun array_inv!849 (array!2046) Bool)

(assert (=> b!41023 (= e!27118 (array_inv!849 (buf!1252 thiss!1379)))))

(declare-fun b!41024 () Bool)

(declare-fun res!34914 () Bool)

(assert (=> b!41024 (=> res!34914 e!27119)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41024 (= res!34914 (not (invariant!0 (currentBit!2681 thiss!1379) (currentByte!2686 thiss!1379) (size!924 (buf!1252 thiss!1379)))))))

(declare-fun b!41025 () Bool)

(declare-fun res!34916 () Bool)

(assert (=> b!41025 (=> (not res!34916) (not e!27121))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41025 (= res!34916 (validate_offset_bits!1 ((_ sign_extend 32) (size!924 (buf!1252 thiss!1379))) ((_ sign_extend 32) (currentByte!2686 thiss!1379)) ((_ sign_extend 32) (currentBit!2681 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41026 () Bool)

(assert (=> b!41026 (= e!27119 (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-datatypes ((tuple2!3926 0))(
  ( (tuple2!3927 (_1!2050 BitStream!1592) (_2!2050 BitStream!1592)) )
))
(declare-fun lt!62193 () tuple2!3926)

(declare-fun reader!0 (BitStream!1592 BitStream!1592) tuple2!3926)

(assert (=> b!41026 (= lt!62193 (reader!0 thiss!1379 thiss!1379))))

(declare-fun res!34915 () Bool)

(assert (=> start!8198 (=> (not res!34915) (not e!27121))))

(declare-fun srcBuffer!2 () array!2046)

(assert (=> start!8198 (= res!34915 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!924 srcBuffer!2))))))))

(assert (=> start!8198 e!27121))

(assert (=> start!8198 true))

(assert (=> start!8198 (array_inv!849 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1592) Bool)

(assert (=> start!8198 (and (inv!12 thiss!1379) e!27118)))

(assert (= (and start!8198 res!34915) b!41025))

(assert (= (and b!41025 res!34916) b!41022))

(assert (= (and b!41022 (not res!34917)) b!41024))

(assert (= (and b!41024 (not res!34914)) b!41026))

(assert (= start!8198 b!41023))

(declare-fun m!62665 () Bool)

(assert (=> b!41022 m!62665))

(declare-fun m!62667 () Bool)

(assert (=> b!41022 m!62667))

(declare-fun m!62669 () Bool)

(assert (=> b!41022 m!62669))

(declare-fun m!62671 () Bool)

(assert (=> b!41023 m!62671))

(declare-fun m!62673 () Bool)

(assert (=> start!8198 m!62673))

(declare-fun m!62675 () Bool)

(assert (=> start!8198 m!62675))

(declare-fun m!62677 () Bool)

(assert (=> b!41026 m!62677))

(declare-fun m!62679 () Bool)

(assert (=> b!41025 m!62679))

(declare-fun m!62681 () Bool)

(assert (=> b!41024 m!62681))

(push 1)

(assert (not b!41025))

(assert (not b!41022))

(assert (not start!8198))

(assert (not b!41024))

(assert (not b!41026))

(assert (not b!41023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

