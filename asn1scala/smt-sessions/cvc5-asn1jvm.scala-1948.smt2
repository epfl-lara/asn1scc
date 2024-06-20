; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50768 () Bool)

(assert start!50768)

(declare-fun b!237372 () Bool)

(declare-fun e!164089 () Bool)

(declare-datatypes ((array!12613 0))(
  ( (array!12614 (arr!6523 (Array (_ BitVec 32) (_ BitVec 8))) (size!5536 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10036 0))(
  ( (BitStream!10037 (buf!6011 array!12613) (currentByte!11191 (_ BitVec 32)) (currentBit!11186 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10036)

(declare-fun array_inv!5277 (array!12613) Bool)

(assert (=> b!237372 (= e!164089 (array_inv!5277 (buf!6011 thiss!1830)))))

(declare-fun b!237373 () Bool)

(declare-fun e!164087 () Bool)

(declare-fun e!164090 () Bool)

(assert (=> b!237373 (= e!164087 e!164090)))

(declare-fun res!198401 () Bool)

(assert (=> b!237373 (=> (not res!198401) (not e!164090))))

(declare-fun lt!372809 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237373 (= res!198401 (validate_offset_bits!1 ((_ sign_extend 32) (size!5536 (buf!6011 thiss!1830))) ((_ sign_extend 32) (currentByte!11191 thiss!1830)) ((_ sign_extend 32) (currentBit!11186 thiss!1830)) lt!372809))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237373 (= lt!372809 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237374 () Bool)

(declare-fun res!198405 () Bool)

(assert (=> b!237374 (=> (not res!198405) (not e!164090))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237374 (= res!198405 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237376 () Bool)

(declare-fun res!198404 () Bool)

(assert (=> b!237376 (=> (not res!198404) (not e!164090))))

(assert (=> b!237376 (= res!198404 (= nBits!581 i!752))))

(declare-fun b!237377 () Bool)

(declare-fun lt!372810 () (_ BitVec 64))

(assert (=> b!237377 (= e!164090 (and (= lt!372810 (bvadd lt!372810 lt!372809)) (bvsgt lt!372809 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237377 (= lt!372810 (bitIndex!0 (size!5536 (buf!6011 thiss!1830)) (currentByte!11191 thiss!1830) (currentBit!11186 thiss!1830)))))

(declare-fun res!198403 () Bool)

(assert (=> start!50768 (=> (not res!198403) (not e!164087))))

(assert (=> start!50768 (= res!198403 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50768 e!164087))

(assert (=> start!50768 true))

(declare-fun inv!12 (BitStream!10036) Bool)

(assert (=> start!50768 (and (inv!12 thiss!1830) e!164089)))

(declare-fun b!237375 () Bool)

(declare-fun res!198402 () Bool)

(assert (=> b!237375 (=> (not res!198402) (not e!164090))))

(assert (=> b!237375 (= res!198402 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50768 res!198403) b!237373))

(assert (= (and b!237373 res!198401) b!237374))

(assert (= (and b!237374 res!198405) b!237375))

(assert (= (and b!237375 res!198402) b!237376))

(assert (= (and b!237376 res!198404) b!237377))

(assert (= start!50768 b!237372))

(declare-fun m!359847 () Bool)

(assert (=> start!50768 m!359847))

(declare-fun m!359849 () Bool)

(assert (=> b!237373 m!359849))

(declare-fun m!359851 () Bool)

(assert (=> b!237375 m!359851))

(declare-fun m!359853 () Bool)

(assert (=> b!237377 m!359853))

(declare-fun m!359855 () Bool)

(assert (=> b!237372 m!359855))

(declare-fun m!359857 () Bool)

(assert (=> b!237374 m!359857))

(push 1)

(assert (not b!237374))

(assert (not b!237375))

(assert (not b!237373))

(assert (not b!237377))

(assert (not b!237372))

(assert (not start!50768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

