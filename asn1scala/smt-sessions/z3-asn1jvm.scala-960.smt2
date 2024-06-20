; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27088 () Bool)

(assert start!27088)

(declare-fun res!116182 () Bool)

(declare-fun e!92856 () Bool)

(assert (=> start!27088 (=> (not res!116182) (not e!92856))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6353 0))(
  ( (array!6354 (arr!3571 (Array (_ BitVec 32) (_ BitVec 8))) (size!2876 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6353)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27088 (= res!116182 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2876 arr!237))))))

(assert (=> start!27088 e!92856))

(assert (=> start!27088 true))

(declare-fun array_inv!2665 (array!6353) Bool)

(assert (=> start!27088 (array_inv!2665 arr!237)))

(declare-datatypes ((BitStream!5016 0))(
  ( (BitStream!5017 (buf!3292 array!6353) (currentByte!6122 (_ BitVec 32)) (currentBit!6117 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5016)

(declare-fun e!92853 () Bool)

(declare-fun inv!12 (BitStream!5016) Bool)

(assert (=> start!27088 (and (inv!12 thiss!1634) e!92853)))

(declare-fun b!139385 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139385 (= e!92856 (not (invariant!0 (currentBit!6117 thiss!1634) (currentByte!6122 thiss!1634) (size!2876 (buf!3292 thiss!1634)))))))

(declare-fun b!139386 () Bool)

(assert (=> b!139386 (= e!92853 (array_inv!2665 (buf!3292 thiss!1634)))))

(declare-fun b!139383 () Bool)

(declare-fun res!116183 () Bool)

(assert (=> b!139383 (=> (not res!116183) (not e!92856))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139383 (= res!116183 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2876 (buf!3292 thiss!1634))) ((_ sign_extend 32) (currentByte!6122 thiss!1634)) ((_ sign_extend 32) (currentBit!6117 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139384 () Bool)

(declare-fun res!116184 () Bool)

(assert (=> b!139384 (=> (not res!116184) (not e!92856))))

(assert (=> b!139384 (= res!116184 (bvslt from!447 to!404))))

(assert (= (and start!27088 res!116182) b!139383))

(assert (= (and b!139383 res!116183) b!139384))

(assert (= (and b!139384 res!116184) b!139385))

(assert (= start!27088 b!139386))

(declare-fun m!214415 () Bool)

(assert (=> start!27088 m!214415))

(declare-fun m!214417 () Bool)

(assert (=> start!27088 m!214417))

(declare-fun m!214419 () Bool)

(assert (=> b!139385 m!214419))

(declare-fun m!214421 () Bool)

(assert (=> b!139386 m!214421))

(declare-fun m!214423 () Bool)

(assert (=> b!139383 m!214423))

(check-sat (not b!139383) (not start!27088) (not b!139385) (not b!139386))
(check-sat)
(get-model)

(declare-fun d!44773 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44773 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2876 (buf!3292 thiss!1634))) ((_ sign_extend 32) (currentByte!6122 thiss!1634)) ((_ sign_extend 32) (currentBit!6117 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2876 (buf!3292 thiss!1634))) ((_ sign_extend 32) (currentByte!6122 thiss!1634)) ((_ sign_extend 32) (currentBit!6117 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10971 () Bool)

(assert (= bs!10971 d!44773))

(declare-fun m!214435 () Bool)

(assert (=> bs!10971 m!214435))

(assert (=> b!139383 d!44773))

(declare-fun d!44775 () Bool)

(assert (=> d!44775 (= (array_inv!2665 arr!237) (bvsge (size!2876 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27088 d!44775))

(declare-fun d!44779 () Bool)

(assert (=> d!44779 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6117 thiss!1634) (currentByte!6122 thiss!1634) (size!2876 (buf!3292 thiss!1634))))))

(declare-fun bs!10972 () Bool)

(assert (= bs!10972 d!44779))

(assert (=> bs!10972 m!214419))

(assert (=> start!27088 d!44779))

(declare-fun d!44783 () Bool)

(assert (=> d!44783 (= (invariant!0 (currentBit!6117 thiss!1634) (currentByte!6122 thiss!1634) (size!2876 (buf!3292 thiss!1634))) (and (bvsge (currentBit!6117 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6117 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6122 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6122 thiss!1634) (size!2876 (buf!3292 thiss!1634))) (and (= (currentBit!6117 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6122 thiss!1634) (size!2876 (buf!3292 thiss!1634)))))))))

(assert (=> b!139385 d!44783))

(declare-fun d!44791 () Bool)

(assert (=> d!44791 (= (array_inv!2665 (buf!3292 thiss!1634)) (bvsge (size!2876 (buf!3292 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!139386 d!44791))

(check-sat (not d!44773) (not d!44779))
