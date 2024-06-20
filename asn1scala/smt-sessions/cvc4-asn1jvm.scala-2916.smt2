; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69620 () Bool)

(assert start!69620)

(declare-fun b!313186 () Bool)

(declare-fun res!256401 () Bool)

(declare-fun e!225335 () Bool)

(assert (=> b!313186 (=> (not res!256401) (not e!225335))))

(declare-datatypes ((array!19220 0))(
  ( (array!19221 (arr!9417 (Array (_ BitVec 32) (_ BitVec 8))) (size!8337 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13778 0))(
  ( (BitStream!13779 (buf!7950 array!19220) (currentByte!14669 (_ BitVec 32)) (currentBit!14664 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13778)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313186 (= res!256401 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8337 (buf!7950 b1!97))) ((_ sign_extend 32) (currentByte!14669 b1!97)) ((_ sign_extend 32) (currentBit!14664 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun lt!442142 () (_ BitVec 64))

(declare-fun b!313187 () Bool)

(declare-fun lt!442141 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13778)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> b!313187 (= e!225335 (and (bvsge (bvsub lt!442142 lt!442141) b1ValidateOffsetBits!10) (let ((bdg!18646 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14669 b2!97))) ((_ sign_extend 32) (currentBit!14664 b2!97))))) (and (bvsle bdg!18646 (bvadd lt!442141 advancedAtMostBits!9)) (bvsge (bvsub lt!442142 bdg!18646) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!313187 (= lt!442141 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14669 b1!97))) ((_ sign_extend 32) (currentBit!14664 b1!97))))))

(assert (=> b!313187 (= lt!442142 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8337 (buf!7950 b1!97)))))))

(declare-fun res!256400 () Bool)

(assert (=> start!69620 (=> (not res!256400) (not e!225335))))

(assert (=> start!69620 (= res!256400 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8337 (buf!7950 b1!97)) (size!8337 (buf!7950 b2!97)))))))

(assert (=> start!69620 e!225335))

(assert (=> start!69620 true))

(declare-fun e!225337 () Bool)

(declare-fun inv!12 (BitStream!13778) Bool)

(assert (=> start!69620 (and (inv!12 b1!97) e!225337)))

(declare-fun e!225336 () Bool)

(assert (=> start!69620 (and (inv!12 b2!97) e!225336)))

(declare-fun b!313188 () Bool)

(declare-fun array_inv!7889 (array!19220) Bool)

(assert (=> b!313188 (= e!225336 (array_inv!7889 (buf!7950 b2!97)))))

(declare-fun b!313189 () Bool)

(declare-fun res!256402 () Bool)

(assert (=> b!313189 (=> (not res!256402) (not e!225335))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313189 (= res!256402 (validate_offset_bits!1 ((_ sign_extend 32) (size!8337 (buf!7950 b1!97))) ((_ sign_extend 32) (currentByte!14669 b1!97)) ((_ sign_extend 32) (currentBit!14664 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313190 () Bool)

(declare-fun res!256403 () Bool)

(assert (=> b!313190 (=> (not res!256403) (not e!225335))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313190 (= res!256403 (bvsle (bitIndex!0 (size!8337 (buf!7950 b2!97)) (currentByte!14669 b2!97) (currentBit!14664 b2!97)) (bvadd (bitIndex!0 (size!8337 (buf!7950 b1!97)) (currentByte!14669 b1!97) (currentBit!14664 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313191 () Bool)

(assert (=> b!313191 (= e!225337 (array_inv!7889 (buf!7950 b1!97)))))

(assert (= (and start!69620 res!256400) b!313189))

(assert (= (and b!313189 res!256402) b!313190))

(assert (= (and b!313190 res!256403) b!313186))

(assert (= (and b!313186 res!256401) b!313187))

(assert (= start!69620 b!313191))

(assert (= start!69620 b!313188))

(declare-fun m!450769 () Bool)

(assert (=> b!313188 m!450769))

(declare-fun m!450771 () Bool)

(assert (=> b!313190 m!450771))

(declare-fun m!450773 () Bool)

(assert (=> b!313190 m!450773))

(declare-fun m!450775 () Bool)

(assert (=> start!69620 m!450775))

(declare-fun m!450777 () Bool)

(assert (=> start!69620 m!450777))

(declare-fun m!450779 () Bool)

(assert (=> b!313191 m!450779))

(declare-fun m!450781 () Bool)

(assert (=> b!313189 m!450781))

(declare-fun m!450783 () Bool)

(assert (=> b!313186 m!450783))

(push 1)

(assert (not b!313189))

(assert (not b!313188))

(assert (not start!69620))

(assert (not b!313186))

(assert (not b!313190))

(assert (not b!313191))

(check-sat)

(pop 1)

(push 1)

(check-sat)

