; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17864 () Bool)

(assert start!17864)

(declare-fun b!87566 () Bool)

(declare-fun e!58047 () Bool)

(declare-fun e!58053 () Bool)

(assert (=> b!87566 (= e!58047 e!58053)))

(declare-fun res!72033 () Bool)

(assert (=> b!87566 (=> (not res!72033) (not e!58053))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun lt!135681 () (_ BitVec 64))

(declare-fun lt!135679 () (_ BitVec 64))

(assert (=> b!87566 (= res!72033 (= lt!135679 (bvadd lt!135681 ((_ sign_extend 32) i!576))))))

(declare-datatypes ((array!4132 0))(
  ( (array!4133 (arr!2504 (Array (_ BitVec 32) (_ BitVec 8))) (size!1867 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3296 0))(
  ( (BitStream!3297 (buf!2257 array!4132) (currentByte!4472 (_ BitVec 32)) (currentBit!4467 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3296)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87566 (= lt!135679 (bitIndex!0 (size!1867 (buf!2257 thiss!1152)) (currentByte!4472 thiss!1152) (currentBit!4467 thiss!1152)))))

(declare-fun thiss!1151 () BitStream!3296)

(assert (=> b!87566 (= lt!135681 (bitIndex!0 (size!1867 (buf!2257 thiss!1151)) (currentByte!4472 thiss!1151) (currentBit!4467 thiss!1151)))))

(declare-fun b!87568 () Bool)

(declare-fun e!58051 () Bool)

(assert (=> b!87568 (= e!58053 (not e!58051))))

(declare-fun res!72025 () Bool)

(assert (=> b!87568 (=> res!72025 e!58051)))

(declare-datatypes ((Unit!5753 0))(
  ( (Unit!5754) )
))
(declare-datatypes ((tuple2!7404 0))(
  ( (tuple2!7405 (_1!3935 Unit!5753) (_2!3935 BitStream!3296)) )
))
(declare-fun lt!135677 () tuple2!7404)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87568 (= res!72025 (not (invariant!0 (currentBit!4467 (_2!3935 lt!135677)) (currentByte!4472 (_2!3935 lt!135677)) (size!1867 (buf!2257 (_2!3935 lt!135677))))))))

(declare-fun e!58049 () Bool)

(assert (=> b!87568 e!58049))

(declare-fun res!72024 () Bool)

(assert (=> b!87568 (=> (not res!72024) (not e!58049))))

(assert (=> b!87568 (= res!72024 (= (size!1867 (buf!2257 thiss!1152)) (size!1867 (buf!2257 (_2!3935 lt!135677)))))))

(declare-fun lt!135680 () Bool)

(declare-fun appendBit!0 (BitStream!3296 Bool) tuple2!7404)

(assert (=> b!87568 (= lt!135677 (appendBit!0 thiss!1152 lt!135680))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87568 (= lt!135680 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87569 () Bool)

(declare-fun res!72026 () Bool)

(assert (=> b!87569 (=> (not res!72026) (not e!58047))))

(assert (=> b!87569 (= res!72026 (invariant!0 (currentBit!4467 thiss!1151) (currentByte!4472 thiss!1151) (size!1867 (buf!2257 thiss!1151))))))

(declare-fun b!87570 () Bool)

(declare-fun e!58052 () Bool)

(declare-fun array_inv!1713 (array!4132) Bool)

(assert (=> b!87570 (= e!58052 (array_inv!1713 (buf!2257 thiss!1152)))))

(declare-fun b!87571 () Bool)

(declare-fun res!72034 () Bool)

(assert (=> b!87571 (=> (not res!72034) (not e!58047))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87571 (= res!72034 (validate_offset_bits!1 ((_ sign_extend 32) (size!1867 (buf!2257 thiss!1151))) ((_ sign_extend 32) (currentByte!4472 thiss!1151)) ((_ sign_extend 32) (currentBit!4467 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87572 () Bool)

(assert (=> b!87572 (= e!58051 (and (bvsle ((_ sign_extend 32) (size!1867 (buf!2257 (_2!3935 lt!135677)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4472 (_2!3935 lt!135677))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4467 (_2!3935 lt!135677))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!87573 () Bool)

(declare-fun res!72023 () Bool)

(assert (=> b!87573 (=> res!72023 e!58051)))

(assert (=> b!87573 (= res!72023 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1867 (buf!2257 (_2!3935 lt!135677))) (size!1867 (buf!2257 thiss!1151))))))))

(declare-fun b!87574 () Bool)

(declare-fun e!58054 () Bool)

(declare-datatypes ((tuple2!7406 0))(
  ( (tuple2!7407 (_1!3936 BitStream!3296) (_2!3936 Bool)) )
))
(declare-fun lt!135678 () tuple2!7406)

(declare-fun lt!135676 () (_ BitVec 64))

(assert (=> b!87574 (= e!58054 (= (bitIndex!0 (size!1867 (buf!2257 (_1!3936 lt!135678))) (currentByte!4472 (_1!3936 lt!135678)) (currentBit!4467 (_1!3936 lt!135678))) lt!135676))))

(declare-fun b!87575 () Bool)

(declare-fun res!72031 () Bool)

(assert (=> b!87575 (=> (not res!72031) (not e!58047))))

(assert (=> b!87575 (= res!72031 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87576 () Bool)

(declare-fun e!58048 () Bool)

(assert (=> b!87576 (= e!58048 e!58054)))

(declare-fun res!72027 () Bool)

(assert (=> b!87576 (=> (not res!72027) (not e!58054))))

(assert (=> b!87576 (= res!72027 (and (= (_2!3936 lt!135678) lt!135680) (= (_1!3936 lt!135678) (_2!3935 lt!135677))))))

(declare-fun readBitPure!0 (BitStream!3296) tuple2!7406)

(declare-fun readerFrom!0 (BitStream!3296 (_ BitVec 32) (_ BitVec 32)) BitStream!3296)

(assert (=> b!87576 (= lt!135678 (readBitPure!0 (readerFrom!0 (_2!3935 lt!135677) (currentBit!4467 thiss!1152) (currentByte!4472 thiss!1152))))))

(declare-fun b!87577 () Bool)

(declare-fun res!72021 () Bool)

(assert (=> b!87577 (=> (not res!72021) (not e!58053))))

(assert (=> b!87577 (= res!72021 (validate_offset_bits!1 ((_ sign_extend 32) (size!1867 (buf!2257 thiss!1152))) ((_ sign_extend 32) (currentByte!4472 thiss!1152)) ((_ sign_extend 32) (currentBit!4467 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87578 () Bool)

(declare-fun res!72020 () Bool)

(assert (=> b!87578 (=> (not res!72020) (not e!58053))))

(assert (=> b!87578 (= res!72020 (bvslt i!576 nBits!336))))

(declare-fun b!87579 () Bool)

(declare-fun res!72022 () Bool)

(assert (=> b!87579 (=> (not res!72022) (not e!58048))))

(declare-fun isPrefixOf!0 (BitStream!3296 BitStream!3296) Bool)

(assert (=> b!87579 (= res!72022 (isPrefixOf!0 thiss!1152 (_2!3935 lt!135677)))))

(declare-fun b!87580 () Bool)

(declare-fun res!72032 () Bool)

(assert (=> b!87580 (=> (not res!72032) (not e!58047))))

(assert (=> b!87580 (= res!72032 (invariant!0 (currentBit!4467 thiss!1152) (currentByte!4472 thiss!1152) (size!1867 (buf!2257 thiss!1152))))))

(declare-fun b!87581 () Bool)

(declare-fun res!72029 () Bool)

(assert (=> b!87581 (=> (not res!72029) (not e!58047))))

(assert (=> b!87581 (= res!72029 (and (bvsle i!576 nBits!336) (= (size!1867 (buf!2257 thiss!1152)) (size!1867 (buf!2257 thiss!1151)))))))

(declare-fun res!72030 () Bool)

(assert (=> start!17864 (=> (not res!72030) (not e!58047))))

(assert (=> start!17864 (= res!72030 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17864 e!58047))

(declare-fun inv!12 (BitStream!3296) Bool)

(assert (=> start!17864 (and (inv!12 thiss!1152) e!58052)))

(declare-fun e!58050 () Bool)

(assert (=> start!17864 (and (inv!12 thiss!1151) e!58050)))

(assert (=> start!17864 true))

(declare-fun b!87567 () Bool)

(declare-fun res!72028 () Bool)

(assert (=> b!87567 (=> res!72028 e!58051)))

(assert (=> b!87567 (= res!72028 (not (= (bitIndex!0 (size!1867 (buf!2257 (_2!3935 lt!135677))) (currentByte!4472 (_2!3935 lt!135677)) (currentBit!4467 (_2!3935 lt!135677))) (bvadd lt!135681 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!87582 () Bool)

(assert (=> b!87582 (= e!58050 (array_inv!1713 (buf!2257 thiss!1151)))))

(declare-fun b!87583 () Bool)

(assert (=> b!87583 (= e!58049 e!58048)))

(declare-fun res!72019 () Bool)

(assert (=> b!87583 (=> (not res!72019) (not e!58048))))

(assert (=> b!87583 (= res!72019 (= lt!135676 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135679)))))

(assert (=> b!87583 (= lt!135676 (bitIndex!0 (size!1867 (buf!2257 (_2!3935 lt!135677))) (currentByte!4472 (_2!3935 lt!135677)) (currentBit!4467 (_2!3935 lt!135677))))))

(assert (= (and start!17864 res!72030) b!87571))

(assert (= (and b!87571 res!72034) b!87569))

(assert (= (and b!87569 res!72026) b!87575))

(assert (= (and b!87575 res!72031) b!87580))

(assert (= (and b!87580 res!72032) b!87581))

(assert (= (and b!87581 res!72029) b!87566))

(assert (= (and b!87566 res!72033) b!87577))

(assert (= (and b!87577 res!72021) b!87578))

(assert (= (and b!87578 res!72020) b!87568))

(assert (= (and b!87568 res!72024) b!87583))

(assert (= (and b!87583 res!72019) b!87579))

(assert (= (and b!87579 res!72022) b!87576))

(assert (= (and b!87576 res!72027) b!87574))

(assert (= (and b!87568 (not res!72025)) b!87573))

(assert (= (and b!87573 (not res!72023)) b!87567))

(assert (= (and b!87567 (not res!72028)) b!87572))

(assert (= start!17864 b!87570))

(assert (= start!17864 b!87582))

(declare-fun m!133003 () Bool)

(assert (=> start!17864 m!133003))

(declare-fun m!133005 () Bool)

(assert (=> start!17864 m!133005))

(declare-fun m!133007 () Bool)

(assert (=> b!87567 m!133007))

(declare-fun m!133009 () Bool)

(assert (=> b!87566 m!133009))

(declare-fun m!133011 () Bool)

(assert (=> b!87566 m!133011))

(declare-fun m!133013 () Bool)

(assert (=> b!87574 m!133013))

(declare-fun m!133015 () Bool)

(assert (=> b!87582 m!133015))

(declare-fun m!133017 () Bool)

(assert (=> b!87580 m!133017))

(declare-fun m!133019 () Bool)

(assert (=> b!87570 m!133019))

(declare-fun m!133021 () Bool)

(assert (=> b!87571 m!133021))

(declare-fun m!133023 () Bool)

(assert (=> b!87569 m!133023))

(declare-fun m!133025 () Bool)

(assert (=> b!87568 m!133025))

(declare-fun m!133027 () Bool)

(assert (=> b!87568 m!133027))

(declare-fun m!133029 () Bool)

(assert (=> b!87579 m!133029))

(declare-fun m!133031 () Bool)

(assert (=> b!87577 m!133031))

(declare-fun m!133033 () Bool)

(assert (=> b!87576 m!133033))

(assert (=> b!87576 m!133033))

(declare-fun m!133035 () Bool)

(assert (=> b!87576 m!133035))

(assert (=> b!87583 m!133007))

(push 1)

(assert (not b!87568))

(assert (not b!87574))

(assert (not b!87580))

(assert (not b!87583))

(assert (not b!87576))

(assert (not b!87570))

(assert (not b!87577))

(assert (not b!87579))

(assert (not b!87582))

(assert (not b!87566))

(assert (not start!17864))

(assert (not b!87567))

(assert (not b!87571))

(assert (not b!87569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

