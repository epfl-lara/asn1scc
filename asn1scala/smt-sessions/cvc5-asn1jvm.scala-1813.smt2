; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48990 () Bool)

(assert start!48990)

(declare-fun b!232367 () Bool)

(declare-fun res!194507 () Bool)

(declare-fun e!159951 () Bool)

(assert (=> b!232367 (=> (not res!194507) (not e!159951))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11959 0))(
  ( (array!11960 (arr!6232 (Array (_ BitVec 32) (_ BitVec 8))) (size!5245 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9586 0))(
  ( (BitStream!9587 (buf!5786 array!11959) (currentByte!10793 (_ BitVec 32)) (currentBit!10788 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9586)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232367 (= res!194507 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5245 (buf!5786 b1!101))) ((_ sign_extend 32) (currentByte!10793 b1!101)) ((_ sign_extend 32) (currentBit!10788 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232368 () Bool)

(declare-fun res!194508 () Bool)

(assert (=> b!232368 (=> (not res!194508) (not e!159951))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368918 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232368 (= res!194508 (= lt!368918 (bvadd (bitIndex!0 (size!5245 (buf!5786 b1!101)) (currentByte!10793 b1!101) (currentBit!10788 b1!101)) bits!86)))))

(declare-fun b!232369 () Bool)

(declare-fun e!159948 () Bool)

(declare-fun b2!99 () BitStream!9586)

(declare-fun array_inv!4986 (array!11959) Bool)

(assert (=> b!232369 (= e!159948 (array_inv!4986 (buf!5786 b2!99)))))

(declare-fun b!232371 () Bool)

(declare-fun lt!368919 () (_ BitVec 64))

(assert (=> b!232371 (= e!159951 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5245 (buf!5786 b1!101)))) lt!368919) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14361 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10793 b2!99))))) (let ((bdg!14362 (bvadd bdg!14361 ((_ sign_extend 32) (currentBit!10788 b2!99))))) (and (= lt!368918 bdg!14362) (= (bvsub lt!368918 bits!86) lt!368919) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5245 (buf!5786 b2!99)))) (bvsub bdg!14362 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= ((_ sign_extend 32) (currentByte!10793 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!14361 ((_ sign_extend 32) (currentByte!10793 b2!99))))))))))))

(assert (=> b!232371 (= lt!368919 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10793 b1!101))) ((_ sign_extend 32) (currentBit!10788 b1!101))))))

(declare-fun b!232372 () Bool)

(declare-fun e!159952 () Bool)

(assert (=> b!232372 (= e!159952 e!159951)))

(declare-fun res!194511 () Bool)

(assert (=> b!232372 (=> (not res!194511) (not e!159951))))

(assert (=> b!232372 (= res!194511 (and (bvsle bits!86 lt!368918) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!232372 (= lt!368918 (bitIndex!0 (size!5245 (buf!5786 b2!99)) (currentByte!10793 b2!99) (currentBit!10788 b2!99)))))

(declare-fun b!232373 () Bool)

(declare-fun res!194509 () Bool)

(assert (=> b!232373 (=> (not res!194509) (not e!159951))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232373 (= res!194509 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5245 (buf!5786 b1!101))) ((_ sign_extend 32) (currentByte!10793 b1!101)) ((_ sign_extend 32) (currentBit!10788 b1!101)) bytes!19))))

(declare-fun res!194510 () Bool)

(assert (=> start!48990 (=> (not res!194510) (not e!159952))))

(assert (=> start!48990 (= res!194510 (and (= (size!5245 (buf!5786 b1!101)) (size!5245 (buf!5786 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48990 e!159952))

(declare-fun e!159950 () Bool)

(declare-fun inv!12 (BitStream!9586) Bool)

(assert (=> start!48990 (and (inv!12 b1!101) e!159950)))

(assert (=> start!48990 (and (inv!12 b2!99) e!159948)))

(assert (=> start!48990 true))

(declare-fun b!232370 () Bool)

(assert (=> b!232370 (= e!159950 (array_inv!4986 (buf!5786 b1!101)))))

(assert (= (and start!48990 res!194510) b!232372))

(assert (= (and b!232372 res!194511) b!232373))

(assert (= (and b!232373 res!194509) b!232368))

(assert (= (and b!232368 res!194508) b!232367))

(assert (= (and b!232367 res!194507) b!232371))

(assert (= start!48990 b!232370))

(assert (= start!48990 b!232369))

(declare-fun m!355271 () Bool)

(assert (=> b!232368 m!355271))

(declare-fun m!355273 () Bool)

(assert (=> b!232370 m!355273))

(declare-fun m!355275 () Bool)

(assert (=> b!232369 m!355275))

(declare-fun m!355277 () Bool)

(assert (=> b!232373 m!355277))

(declare-fun m!355279 () Bool)

(assert (=> b!232367 m!355279))

(declare-fun m!355281 () Bool)

(assert (=> start!48990 m!355281))

(declare-fun m!355283 () Bool)

(assert (=> start!48990 m!355283))

(declare-fun m!355285 () Bool)

(assert (=> b!232372 m!355285))

(push 1)

(assert (not b!232370))

(assert (not start!48990))

(assert (not b!232368))

(assert (not b!232373))

(assert (not b!232372))

(assert (not b!232367))

(assert (not b!232369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

