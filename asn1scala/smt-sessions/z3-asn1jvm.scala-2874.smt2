; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68806 () Bool)

(assert start!68806)

(declare-fun b!310620 () Bool)

(declare-fun e!223163 () Bool)

(declare-datatypes ((array!18913 0))(
  ( (array!18914 (arr!9290 (Array (_ BitVec 32) (_ BitVec 8))) (size!8207 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13524 0))(
  ( (BitStream!13525 (buf!7823 array!18913) (currentByte!14390 (_ BitVec 32)) (currentBit!14385 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13524)

(declare-fun array_inv!7762 (array!18913) Bool)

(assert (=> b!310620 (= e!223163 (array_inv!7762 (buf!7823 bitStream!19)))))

(declare-fun res!254646 () Bool)

(declare-fun e!223162 () Bool)

(assert (=> start!68806 (=> (not res!254646) (not e!223162))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> start!68806 (= res!254646 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68806 e!223162))

(assert (=> start!68806 true))

(declare-fun inv!12 (BitStream!13524) Bool)

(assert (=> start!68806 (and (inv!12 bitStream!19) e!223163)))

(declare-fun b!310617 () Bool)

(declare-fun res!254645 () Bool)

(assert (=> b!310617 (=> (not res!254645) (not e!223162))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310617 (= res!254645 (validate_offset_bits!1 ((_ sign_extend 32) (size!8207 (buf!7823 bitStream!19))) ((_ sign_extend 32) (currentByte!14390 bitStream!19)) ((_ sign_extend 32) (currentBit!14385 bitStream!19)) nBits!480))))

(declare-fun b!310619 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310619 (= e!223162 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!8207 (buf!7823 bitStream!19))) ((_ sign_extend 32) (currentByte!14390 bitStream!19)) ((_ sign_extend 32) (currentBit!14385 bitStream!19)))))))

(declare-fun b!310618 () Bool)

(declare-fun res!254647 () Bool)

(assert (=> b!310618 (=> (not res!254647) (not e!223162))))

(assert (=> b!310618 (= res!254647 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!68806 res!254646) b!310617))

(assert (= (and b!310617 res!254645) b!310618))

(assert (= (and b!310618 res!254647) b!310619))

(assert (= start!68806 b!310620))

(declare-fun m!448407 () Bool)

(assert (=> b!310620 m!448407))

(declare-fun m!448409 () Bool)

(assert (=> start!68806 m!448409))

(declare-fun m!448411 () Bool)

(assert (=> b!310617 m!448411))

(declare-fun m!448413 () Bool)

(assert (=> b!310619 m!448413))

(check-sat (not b!310620) (not b!310617) (not start!68806) (not b!310619))
(check-sat)
(get-model)

(declare-fun d!102810 () Bool)

(assert (=> d!102810 (= (array_inv!7762 (buf!7823 bitStream!19)) (bvsge (size!8207 (buf!7823 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310620 d!102810))

(declare-fun d!102816 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!102816 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8207 (buf!7823 bitStream!19))) ((_ sign_extend 32) (currentByte!14390 bitStream!19)) ((_ sign_extend 32) (currentBit!14385 bitStream!19)) nBits!480) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8207 (buf!7823 bitStream!19))) ((_ sign_extend 32) (currentByte!14390 bitStream!19)) ((_ sign_extend 32) (currentBit!14385 bitStream!19))) nBits!480))))

(declare-fun bs!26608 () Bool)

(assert (= bs!26608 d!102816))

(declare-fun m!448429 () Bool)

(assert (=> bs!26608 m!448429))

(assert (=> b!310617 d!102816))

(declare-fun d!102824 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!102824 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14385 bitStream!19) (currentByte!14390 bitStream!19) (size!8207 (buf!7823 bitStream!19))))))

(declare-fun bs!26611 () Bool)

(assert (= bs!26611 d!102824))

(declare-fun m!448431 () Bool)

(assert (=> bs!26611 m!448431))

(assert (=> start!68806 d!102824))

(declare-fun d!102830 () Bool)

(assert (=> d!102830 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8207 (buf!7823 bitStream!19))) ((_ sign_extend 32) (currentByte!14390 bitStream!19)) ((_ sign_extend 32) (currentBit!14385 bitStream!19))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8207 (buf!7823 bitStream!19))) ((_ sign_extend 32) (currentByte!14390 bitStream!19)) ((_ sign_extend 32) (currentBit!14385 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!26613 () Bool)

(assert (= bs!26613 d!102830))

(assert (=> bs!26613 m!448429))

(assert (=> b!310619 d!102830))

(check-sat (not d!102830) (not d!102824) (not d!102816))
(check-sat)
