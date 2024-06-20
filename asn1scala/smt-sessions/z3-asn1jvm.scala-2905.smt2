; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69552 () Bool)

(assert start!69552)

(declare-fun b!312574 () Bool)

(declare-fun e!224824 () Bool)

(declare-datatypes ((array!19152 0))(
  ( (array!19153 (arr!9383 (Array (_ BitVec 32) (_ BitVec 8))) (size!8303 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13710 0))(
  ( (BitStream!13711 (buf!7916 array!19152) (currentByte!14635 (_ BitVec 32)) (currentBit!14630 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13710)

(declare-fun array_inv!7855 (array!19152) Bool)

(assert (=> b!312574 (= e!224824 (array_inv!7855 (buf!7916 b1!97)))))

(declare-fun b!312575 () Bool)

(declare-fun res!255993 () Bool)

(declare-fun e!224826 () Bool)

(assert (=> b!312575 (=> (not res!255993) (not e!224826))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312575 (= res!255993 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8303 (buf!7916 b1!97))) ((_ sign_extend 32) (currentByte!14635 b1!97)) ((_ sign_extend 32) (currentBit!14630 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!255994 () Bool)

(assert (=> start!69552 (=> (not res!255994) (not e!224826))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13710)

(assert (=> start!69552 (= res!255994 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8303 (buf!7916 b1!97)) (size!8303 (buf!7916 b2!97)))))))

(assert (=> start!69552 e!224826))

(assert (=> start!69552 true))

(declare-fun inv!12 (BitStream!13710) Bool)

(assert (=> start!69552 (and (inv!12 b1!97) e!224824)))

(declare-fun e!224823 () Bool)

(assert (=> start!69552 (and (inv!12 b2!97) e!224823)))

(declare-fun b!312576 () Bool)

(assert (=> b!312576 (= e!224823 (array_inv!7855 (buf!7916 b2!97)))))

(declare-fun b!312577 () Bool)

(declare-fun res!255995 () Bool)

(assert (=> b!312577 (=> (not res!255995) (not e!224826))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312577 (= res!255995 (bvsle (bitIndex!0 (size!8303 (buf!7916 b2!97)) (currentByte!14635 b2!97) (currentBit!14630 b2!97)) (bvadd (bitIndex!0 (size!8303 (buf!7916 b1!97)) (currentByte!14635 b1!97) (currentBit!14630 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312578 () Bool)

(declare-fun res!255992 () Bool)

(assert (=> b!312578 (=> (not res!255992) (not e!224826))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312578 (= res!255992 (validate_offset_bits!1 ((_ sign_extend 32) (size!8303 (buf!7916 b1!97))) ((_ sign_extend 32) (currentByte!14635 b1!97)) ((_ sign_extend 32) (currentBit!14630 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun lt!442014 () (_ BitVec 64))

(declare-fun lt!442015 () (_ BitVec 64))

(declare-fun b!312579 () Bool)

(declare-fun lt!442016 () (_ BitVec 64))

(assert (=> b!312579 (= e!224826 (and (not (= lt!442015 (bvand lt!442014 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!442015 (bvand (bvsub lt!442016 lt!442014) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!312579 (= lt!442015 (bvand lt!442016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!312579 (= lt!442014 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14635 b1!97))) ((_ sign_extend 32) (currentBit!14630 b1!97))))))

(assert (=> b!312579 (= lt!442016 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8303 (buf!7916 b1!97)))))))

(assert (= (and start!69552 res!255994) b!312578))

(assert (= (and b!312578 res!255992) b!312577))

(assert (= (and b!312577 res!255995) b!312575))

(assert (= (and b!312575 res!255993) b!312579))

(assert (= start!69552 b!312574))

(assert (= start!69552 b!312576))

(declare-fun m!450225 () Bool)

(assert (=> b!312576 m!450225))

(declare-fun m!450227 () Bool)

(assert (=> b!312575 m!450227))

(declare-fun m!450229 () Bool)

(assert (=> b!312577 m!450229))

(declare-fun m!450231 () Bool)

(assert (=> b!312577 m!450231))

(declare-fun m!450233 () Bool)

(assert (=> b!312578 m!450233))

(declare-fun m!450235 () Bool)

(assert (=> b!312574 m!450235))

(declare-fun m!450237 () Bool)

(assert (=> start!69552 m!450237))

(declare-fun m!450239 () Bool)

(assert (=> start!69552 m!450239))

(check-sat (not b!312574) (not start!69552) (not b!312576) (not b!312578) (not b!312577) (not b!312575))
(check-sat)
