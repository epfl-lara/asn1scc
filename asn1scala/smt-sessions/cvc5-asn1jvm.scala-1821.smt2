; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49038 () Bool)

(assert start!49038)

(declare-fun b!232837 () Bool)

(declare-fun res!194835 () Bool)

(declare-fun e!160350 () Bool)

(assert (=> b!232837 (=> (not res!194835) (not e!160350))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!12007 0))(
  ( (array!12008 (arr!6256 (Array (_ BitVec 32) (_ BitVec 8))) (size!5269 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9634 0))(
  ( (BitStream!9635 (buf!5810 array!12007) (currentByte!10817 (_ BitVec 32)) (currentBit!10812 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9634)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232837 (= res!194835 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5269 (buf!5810 b1!101))) ((_ sign_extend 32) (currentByte!10817 b1!101)) ((_ sign_extend 32) (currentBit!10812 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232838 () Bool)

(declare-fun e!160347 () Bool)

(declare-fun array_inv!5010 (array!12007) Bool)

(assert (=> b!232838 (= e!160347 (array_inv!5010 (buf!5810 b1!101)))))

(declare-fun b!232839 () Bool)

(declare-fun res!194836 () Bool)

(assert (=> b!232839 (=> (not res!194836) (not e!160350))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232839 (= res!194836 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5269 (buf!5810 b1!101))) ((_ sign_extend 32) (currentByte!10817 b1!101)) ((_ sign_extend 32) (currentBit!10812 b1!101)) bytes!19))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b!232840 () Bool)

(declare-fun lt!369029 () (_ BitVec 64))

(declare-fun lt!369028 () (_ BitVec 64))

(declare-fun lt!369030 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9634)

(assert (=> b!232840 (= e!160350 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5269 (buf!5810 b1!101)))) lt!369029) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14383 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10817 b2!99))) ((_ sign_extend 32) (currentBit!10812 b2!99))))) (and (= lt!369030 bdg!14383) (= (bvsub lt!369030 bits!86) lt!369029) (let ((bdg!14384 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5269 (buf!5810 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14384 (bvsub bdg!14383 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14385 (bvsdiv (bvsub bdg!14384 bdg!14383) #b0000000000000000000000000000000000000000000000000000000000001000))) (let ((bdg!14386 (bvand bdg!14385 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14386 (bvand lt!369028 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14386 (bvand (bvadd bdg!14385 lt!369028) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))))

(assert (=> b!232840 (= lt!369029 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10817 b1!101))) ((_ sign_extend 32) (currentBit!10812 b1!101))))))

(declare-fun b!232841 () Bool)

(declare-fun e!160351 () Bool)

(declare-fun e!160346 () Bool)

(assert (=> b!232841 (= e!160351 e!160346)))

(declare-fun res!194833 () Bool)

(assert (=> b!232841 (=> (not res!194833) (not e!160346))))

(assert (=> b!232841 (= res!194833 (bvsle bits!86 lt!369030))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232841 (= lt!369030 (bitIndex!0 (size!5269 (buf!5810 b2!99)) (currentByte!10817 b2!99) (currentBit!10812 b2!99)))))

(declare-fun b!232842 () Bool)

(assert (=> b!232842 (= e!160346 e!160350)))

(declare-fun res!194838 () Bool)

(assert (=> b!232842 (=> (not res!194838) (not e!160350))))

(assert (=> b!232842 (= res!194838 (bvsle ((_ extract 31 0) lt!369028) bytes!19))))

(assert (=> b!232842 (= lt!369028 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun res!194834 () Bool)

(assert (=> start!49038 (=> (not res!194834) (not e!160351))))

(assert (=> start!49038 (= res!194834 (and (= (size!5269 (buf!5810 b1!101)) (size!5269 (buf!5810 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49038 e!160351))

(declare-fun inv!12 (BitStream!9634) Bool)

(assert (=> start!49038 (and (inv!12 b1!101) e!160347)))

(declare-fun e!160348 () Bool)

(assert (=> start!49038 (and (inv!12 b2!99) e!160348)))

(assert (=> start!49038 true))

(declare-fun b!232843 () Bool)

(declare-fun res!194837 () Bool)

(assert (=> b!232843 (=> (not res!194837) (not e!160350))))

(assert (=> b!232843 (= res!194837 (= lt!369030 (bvadd (bitIndex!0 (size!5269 (buf!5810 b1!101)) (currentByte!10817 b1!101) (currentBit!10812 b1!101)) bits!86)))))

(declare-fun b!232844 () Bool)

(assert (=> b!232844 (= e!160348 (array_inv!5010 (buf!5810 b2!99)))))

(assert (= (and start!49038 res!194834) b!232841))

(assert (= (and b!232841 res!194833) b!232842))

(assert (= (and b!232842 res!194838) b!232839))

(assert (= (and b!232839 res!194836) b!232843))

(assert (= (and b!232843 res!194837) b!232837))

(assert (= (and b!232837 res!194835) b!232840))

(assert (= start!49038 b!232838))

(assert (= start!49038 b!232844))

(declare-fun m!355631 () Bool)

(assert (=> b!232841 m!355631))

(declare-fun m!355633 () Bool)

(assert (=> b!232837 m!355633))

(declare-fun m!355635 () Bool)

(assert (=> b!232839 m!355635))

(declare-fun m!355637 () Bool)

(assert (=> b!232844 m!355637))

(declare-fun m!355639 () Bool)

(assert (=> start!49038 m!355639))

(declare-fun m!355641 () Bool)

(assert (=> start!49038 m!355641))

(declare-fun m!355643 () Bool)

(assert (=> b!232843 m!355643))

(declare-fun m!355645 () Bool)

(assert (=> b!232838 m!355645))

(push 1)

(assert (not b!232843))

(assert (not b!232841))

(assert (not start!49038))

(assert (not b!232844))

(assert (not b!232838))

(assert (not b!232837))

(assert (not b!232839))

(check-sat)

(pop 1)

(push 1)

(check-sat)

