; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16668 () Bool)

(assert start!16668)

(declare-fun b!82476 () Bool)

(declare-fun e!54513 () Bool)

(declare-datatypes ((array!3723 0))(
  ( (array!3724 (arr!2339 (Array (_ BitVec 32) (_ BitVec 8))) (size!1702 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2966 0))(
  ( (BitStream!2967 (buf!2092 array!3723) (currentByte!4106 (_ BitVec 32)) (currentBit!4101 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2966)

(declare-fun array_inv!1548 (array!3723) Bool)

(assert (=> b!82476 (= e!54513 (array_inv!1548 (buf!2092 b2!98)))))

(declare-fun b!82477 () Bool)

(declare-fun e!54516 () Bool)

(declare-fun e!54518 () Bool)

(assert (=> b!82477 (= e!54516 e!54518)))

(declare-fun res!67950 () Bool)

(assert (=> b!82477 (=> (not res!67950) (not e!54518))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!131205 () (_ BitVec 64))

(declare-fun lt!131204 () (_ BitVec 64))

(assert (=> b!82477 (= res!67950 (= (bvadd lt!131204 b1b2Diff!1) lt!131205))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82477 (= lt!131205 (bitIndex!0 (size!1702 (buf!2092 b2!98)) (currentByte!4106 b2!98) (currentBit!4101 b2!98)))))

(declare-fun b1!98 () BitStream!2966)

(assert (=> b!82477 (= lt!131204 (bitIndex!0 (size!1702 (buf!2092 b1!98)) (currentByte!4106 b1!98) (currentBit!4101 b1!98)))))

(declare-fun b!82478 () Bool)

(declare-fun e!54515 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82478 (= e!54515 (invariant!0 (currentBit!4101 b1!98) (currentByte!4106 b1!98) (size!1702 (buf!2092 b1!98))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82478 (= (remainingBits!0 ((_ sign_extend 32) (size!1702 (buf!2092 b2!98))) ((_ sign_extend 32) (currentByte!4106 b2!98)) ((_ sign_extend 32) (currentBit!4101 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1702 (buf!2092 b2!98)))) lt!131205))))

(declare-datatypes ((Unit!5513 0))(
  ( (Unit!5514) )
))
(declare-fun lt!131208 () Unit!5513)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2966) Unit!5513)

(assert (=> b!82478 (= lt!131208 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82479 () Bool)

(declare-fun e!54519 () Bool)

(assert (=> b!82479 (= e!54519 (array_inv!1548 (buf!2092 b1!98)))))

(declare-fun b!82480 () Bool)

(declare-fun res!67949 () Bool)

(assert (=> b!82480 (=> (not res!67949) (not e!54516))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82480 (= res!67949 (validate_offset_bits!1 ((_ sign_extend 32) (size!1702 (buf!2092 b1!98))) ((_ sign_extend 32) (currentByte!4106 b1!98)) ((_ sign_extend 32) (currentBit!4101 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun res!67951 () Bool)

(assert (=> start!16668 (=> (not res!67951) (not e!54516))))

(assert (=> start!16668 (= res!67951 (and (= (size!1702 (buf!2092 b1!98)) (size!1702 (buf!2092 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16668 e!54516))

(declare-fun inv!12 (BitStream!2966) Bool)

(assert (=> start!16668 (and (inv!12 b1!98) e!54519)))

(assert (=> start!16668 (and (inv!12 b2!98) e!54513)))

(assert (=> start!16668 true))

(declare-fun b!82481 () Bool)

(assert (=> b!82481 (= e!54518 (not e!54515))))

(declare-fun res!67948 () Bool)

(assert (=> b!82481 (=> res!67948 e!54515)))

(declare-fun lt!131206 () (_ BitVec 64))

(assert (=> b!82481 (= res!67948 (bvsgt lt!131204 (bvsub lt!131206 b1ValidateOffsetBits!11)))))

(assert (=> b!82481 (= (remainingBits!0 ((_ sign_extend 32) (size!1702 (buf!2092 b1!98))) ((_ sign_extend 32) (currentByte!4106 b1!98)) ((_ sign_extend 32) (currentBit!4101 b1!98))) (bvsub lt!131206 lt!131204))))

(assert (=> b!82481 (= lt!131206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1702 (buf!2092 b1!98)))))))

(declare-fun lt!131207 () Unit!5513)

(assert (=> b!82481 (= lt!131207 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!16668 res!67951) b!82480))

(assert (= (and b!82480 res!67949) b!82477))

(assert (= (and b!82477 res!67950) b!82481))

(assert (= (and b!82481 (not res!67948)) b!82478))

(assert (= start!16668 b!82479))

(assert (= start!16668 b!82476))

(declare-fun m!128943 () Bool)

(assert (=> b!82477 m!128943))

(declare-fun m!128945 () Bool)

(assert (=> b!82477 m!128945))

(declare-fun m!128947 () Bool)

(assert (=> b!82476 m!128947))

(declare-fun m!128949 () Bool)

(assert (=> start!16668 m!128949))

(declare-fun m!128951 () Bool)

(assert (=> start!16668 m!128951))

(declare-fun m!128953 () Bool)

(assert (=> b!82480 m!128953))

(declare-fun m!128955 () Bool)

(assert (=> b!82479 m!128955))

(declare-fun m!128957 () Bool)

(assert (=> b!82481 m!128957))

(declare-fun m!128959 () Bool)

(assert (=> b!82481 m!128959))

(declare-fun m!128961 () Bool)

(assert (=> b!82478 m!128961))

(declare-fun m!128963 () Bool)

(assert (=> b!82478 m!128963))

(declare-fun m!128965 () Bool)

(assert (=> b!82478 m!128965))

(push 1)

(assert (not b!82477))

(assert (not b!82479))

(assert (not b!82476))

(assert (not b!82478))

(assert (not b!82480))

(assert (not start!16668))

(assert (not b!82481))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26114 () Bool)

(declare-fun e!54530 () Bool)

(assert (=> d!26114 e!54530))

(declare-fun res!67973 () Bool)

(assert (=> d!26114 (=> (not res!67973) (not e!54530))))

(declare-fun lt!131290 () (_ BitVec 64))

(declare-fun lt!131293 () (_ BitVec 64))

(declare-fun lt!131294 () (_ BitVec 64))

(assert (=> d!26114 (= res!67973 (= lt!131293 (bvsub lt!131290 lt!131294)))))

(assert (=> d!26114 (or (= (bvand lt!131290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131294 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131290 lt!131294) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26114 (= lt!131294 (remainingBits!0 ((_ sign_extend 32) (size!1702 (buf!2092 b2!98))) ((_ sign_extend 32) (currentByte!4106 b2!98)) ((_ sign_extend 32) (currentBit!4101 b2!98))))))

(declare-fun lt!131289 () (_ BitVec 64))

(declare-fun lt!131292 () (_ BitVec 64))

(assert (=> d!26114 (= lt!131290 (bvmul lt!131289 lt!131292))))

(assert (=> d!26114 (or (= lt!131289 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131292 (bvsdiv (bvmul lt!131289 lt!131292) lt!131289)))))

(assert (=> d!26114 (= lt!131292 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26114 (= lt!131289 ((_ sign_extend 32) (size!1702 (buf!2092 b2!98))))))

(assert (=> d!26114 (= lt!131293 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4106 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4101 b2!98))))))

(assert (=> d!26114 (invariant!0 (currentBit!4101 b2!98) (currentByte!4106 b2!98) (size!1702 (buf!2092 b2!98)))))

(assert (=> d!26114 (= (bitIndex!0 (size!1702 (buf!2092 b2!98)) (currentByte!4106 b2!98) (currentBit!4101 b2!98)) lt!131293)))

(declare-fun b!82503 () Bool)

(declare-fun res!67972 () Bool)

(assert (=> b!82503 (=> (not res!67972) (not e!54530))))

(assert (=> b!82503 (= res!67972 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131293))))

(declare-fun b!82504 () Bool)

(declare-fun lt!131291 () (_ BitVec 64))

(assert (=> b!82504 (= e!54530 (bvsle lt!131293 (bvmul lt!131291 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82504 (or (= lt!131291 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131291 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131291)))))

(assert (=> b!82504 (= lt!131291 ((_ sign_extend 32) (size!1702 (buf!2092 b2!98))))))

(assert (= (and d!26114 res!67973) b!82503))

(assert (= (and b!82503 res!67972) b!82504))

(assert (=> d!26114 m!128963))

(declare-fun m!128975 () Bool)

(assert (=> d!26114 m!128975))

(assert (=> b!82477 d!26114))

(declare-fun d!26122 () Bool)

(declare-fun e!54531 () Bool)

(assert (=> d!26122 e!54531))

(declare-fun res!67975 () Bool)

(assert (=> d!26122 (=> (not res!67975) (not e!54531))))

(declare-fun lt!131299 () (_ BitVec 64))

(declare-fun lt!131296 () (_ BitVec 64))

(declare-fun lt!131300 () (_ BitVec 64))

(assert (=> d!26122 (= res!67975 (= lt!131299 (bvsub lt!131296 lt!131300)))))

(assert (=> d!26122 (or (= (bvand lt!131296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131300 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131296 lt!131300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26122 (= lt!131300 (remainingBits!0 ((_ sign_extend 32) (size!1702 (buf!2092 b1!98))) ((_ sign_extend 32) (currentByte!4106 b1!98)) ((_ sign_extend 32) (currentBit!4101 b1!98))))))

(declare-fun lt!131295 () (_ BitVec 64))

(declare-fun lt!131298 () (_ BitVec 64))

(assert (=> d!26122 (= lt!131296 (bvmul lt!131295 lt!131298))))

(assert (=> d!26122 (or (= lt!131295 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131298 (bvsdiv (bvmul lt!131295 lt!131298) lt!131295)))))

(assert (=> d!26122 (= lt!131298 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26122 (= lt!131295 ((_ sign_extend 32) (size!1702 (buf!2092 b1!98))))))

(assert (=> d!26122 (= lt!131299 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4106 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4101 b1!98))))))

(assert (=> d!26122 (invariant!0 (currentBit!4101 b1!98) (currentByte!4106 b1!98) (size!1702 (buf!2092 b1!98)))))

(assert (=> d!26122 (= (bitIndex!0 (size!1702 (buf!2092 b1!98)) (currentByte!4106 b1!98) (currentBit!4101 b1!98)) lt!131299)))

(declare-fun b!82505 () Bool)

(declare-fun res!67974 () Bool)

(assert (=> b!82505 (=> (not res!67974) (not e!54531))))

(assert (=> b!82505 (= res!67974 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131299))))

(declare-fun b!82506 () Bool)

(declare-fun lt!131297 () (_ BitVec 64))

(assert (=> b!82506 (= e!54531 (bvsle lt!131299 (bvmul lt!131297 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82506 (or (= lt!131297 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131297 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131297)))))

(assert (=> b!82506 (= lt!131297 ((_ sign_extend 32) (size!1702 (buf!2092 b1!98))))))

(assert (= (and d!26122 res!67975) b!82505))

(assert (= (and b!82505 res!67974) b!82506))

(assert (=> d!26122 m!128957))

(assert (=> d!26122 m!128961))

(assert (=> b!82477 d!26122))

(declare-fun d!26124 () Bool)

(assert (=> d!26124 (= (array_inv!1548 (buf!2092 b2!98)) (bvsge (size!1702 (buf!2092 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82476 d!26124))

(declare-fun d!26126 () Bool)

(assert (=> d!26126 (= (remainingBits!0 ((_ sign_extend 32) (size!1702 (buf!2092 b1!98))) ((_ sign_extend 32) (currentByte!4106 b1!98)) ((_ sign_extend 32) (currentBit!4101 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1702 (buf!2092 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4106 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4101 b1!98)))))))

(assert (=> b!82481 d!26126))

(declare-fun d!26130 () Bool)

(declare-fun lt!131328 () (_ BitVec 64))

(declare-fun lt!131329 () (_ BitVec 64))

(assert (=> d!26130 (= (remainingBits!0 ((_ sign_extend 32) (size!1702 (buf!2092 b1!98))) ((_ sign_extend 32) (currentByte!4106 b1!98)) ((_ sign_extend 32) (currentBit!4101 b1!98))) (bvsub lt!131328 lt!131329))))

(assert (=> d!26130 (or (= (bvand lt!131328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131329 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131328 lt!131329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26130 (= lt!131329 (bitIndex!0 (size!1702 (buf!2092 b1!98)) (currentByte!4106 b1!98) (currentBit!4101 b1!98)))))

(declare-fun lt!131326 () (_ BitVec 64))

(declare-fun lt!131330 () (_ BitVec 64))

(assert (=> d!26130 (= lt!131328 (bvmul lt!131326 lt!131330))))

(assert (=> d!26130 (or (= lt!131326 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131330 (bvsdiv (bvmul lt!131326 lt!131330) lt!131326)))))

(assert (=> d!26130 (= lt!131330 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26130 (= lt!131326 ((_ sign_extend 32) (size!1702 (buf!2092 b1!98))))))

(declare-fun lt!131327 () Unit!5513)

(declare-fun choose!23 (BitStream!2966) Unit!5513)

(assert (=> d!26130 (= lt!131327 (choose!23 b1!98))))

(assert (=> d!26130 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131327)))

(declare-fun bs!6403 () Bool)

(assert (= bs!6403 d!26130))

(assert (=> bs!6403 m!128957))

(assert (=> bs!6403 m!128945))

(declare-fun m!128979 () Bool)

(assert (=> bs!6403 m!128979))

(assert (=> b!82481 d!26130))

(declare-fun d!26136 () Bool)

(assert (=> d!26136 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1702 (buf!2092 b1!98))) ((_ sign_extend 32) (currentByte!4106 b1!98)) ((_ sign_extend 32) (currentBit!4101 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1702 (buf!2092 b1!98))) ((_ sign_extend 32) (currentByte!4106 b1!98)) ((_ sign_extend 32) (currentBit!4101 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6406 () Bool)

(assert (= bs!6406 d!26136))

(assert (=> bs!6406 m!128957))

(assert (=> b!82480 d!26136))

(declare-fun d!26142 () Bool)

(assert (=> d!26142 (= (array_inv!1548 (buf!2092 b1!98)) (bvsge (size!1702 (buf!2092 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82479 d!26142))

(declare-fun d!26144 () Bool)

(assert (=> d!26144 (= (inv!12 b1!98) (invariant!0 (currentBit!4101 b1!98) (currentByte!4106 b1!98) (size!1702 (buf!2092 b1!98))))))

(declare-fun bs!6407 () Bool)

(assert (= bs!6407 d!26144))

(assert (=> bs!6407 m!128961))

(assert (=> start!16668 d!26144))

(declare-fun d!26148 () Bool)

(assert (=> d!26148 (= (inv!12 b2!98) (invariant!0 (currentBit!4101 b2!98) (currentByte!4106 b2!98) (size!1702 (buf!2092 b2!98))))))

(declare-fun bs!6408 () Bool)

(assert (= bs!6408 d!26148))

(assert (=> bs!6408 m!128975))

(assert (=> start!16668 d!26148))

(declare-fun d!26152 () Bool)

(assert (=> d!26152 (= (invariant!0 (currentBit!4101 b1!98) (currentByte!4106 b1!98) (size!1702 (buf!2092 b1!98))) (and (bvsge (currentBit!4101 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4101 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4106 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4106 b1!98) (size!1702 (buf!2092 b1!98))) (and (= (currentBit!4101 b1!98) #b00000000000000000000000000000000) (= (currentByte!4106 b1!98) (size!1702 (buf!2092 b1!98)))))))))

(assert (=> b!82478 d!26152))

(declare-fun d!26156 () Bool)

(assert (=> d!26156 (= (remainingBits!0 ((_ sign_extend 32) (size!1702 (buf!2092 b2!98))) ((_ sign_extend 32) (currentByte!4106 b2!98)) ((_ sign_extend 32) (currentBit!4101 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1702 (buf!2092 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4106 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4101 b2!98)))))))

(assert (=> b!82478 d!26156))

(declare-fun d!26158 () Bool)

(declare-fun lt!131338 () (_ BitVec 64))

(declare-fun lt!131339 () (_ BitVec 64))

(assert (=> d!26158 (= (remainingBits!0 ((_ sign_extend 32) (size!1702 (buf!2092 b2!98))) ((_ sign_extend 32) (currentByte!4106 b2!98)) ((_ sign_extend 32) (currentBit!4101 b2!98))) (bvsub lt!131338 lt!131339))))

(assert (=> d!26158 (or (= (bvand lt!131338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131339 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131338 lt!131339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26158 (= lt!131339 (bitIndex!0 (size!1702 (buf!2092 b2!98)) (currentByte!4106 b2!98) (currentBit!4101 b2!98)))))

(declare-fun lt!131336 () (_ BitVec 64))

(declare-fun lt!131340 () (_ BitVec 64))

(assert (=> d!26158 (= lt!131338 (bvmul lt!131336 lt!131340))))

(assert (=> d!26158 (or (= lt!131336 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131340 (bvsdiv (bvmul lt!131336 lt!131340) lt!131336)))))

(assert (=> d!26158 (= lt!131340 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26158 (= lt!131336 ((_ sign_extend 32) (size!1702 (buf!2092 b2!98))))))

(declare-fun lt!131337 () Unit!5513)

(assert (=> d!26158 (= lt!131337 (choose!23 b2!98))))

(assert (=> d!26158 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131337)))

(declare-fun bs!6410 () Bool)

(assert (= bs!6410 d!26158))

(assert (=> bs!6410 m!128963))

(assert (=> bs!6410 m!128943))

(declare-fun m!128983 () Bool)

(assert (=> bs!6410 m!128983))

(assert (=> b!82478 d!26158))

(push 1)

(assert (not d!26122))

(assert (not d!26130))

(assert (not d!26158))

(assert (not d!26136))

(assert (not d!26148))

(assert (not d!26114))

(assert (not d!26144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

