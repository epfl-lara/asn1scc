; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48580 () Bool)

(assert start!48580)

(declare-fun b!230206 () Bool)

(declare-fun res!192978 () Bool)

(declare-fun e!158086 () Bool)

(assert (=> b!230206 (=> (not res!192978) (not e!158086))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11727 0))(
  ( (array!11728 (arr!6128 (Array (_ BitVec 32) (_ BitVec 8))) (size!5141 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9378 0))(
  ( (BitStream!9379 (buf!5682 array!11727) (currentByte!10636 (_ BitVec 32)) (currentBit!10631 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9378)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230206 (= res!192978 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5141 (buf!5682 b1!101))) ((_ sign_extend 32) (currentByte!10636 b1!101)) ((_ sign_extend 32) (currentBit!10631 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230207 () Bool)

(declare-fun res!192976 () Bool)

(assert (=> b!230207 (=> (not res!192976) (not e!158086))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367897 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230207 (= res!192976 (= lt!367897 (bvadd (bitIndex!0 (size!5141 (buf!5682 b1!101)) (currentByte!10636 b1!101) (currentBit!10631 b1!101)) bits!86)))))

(declare-fun b!230208 () Bool)

(declare-fun e!158088 () Bool)

(declare-fun e!158079 () Bool)

(assert (=> b!230208 (= e!158088 e!158079)))

(declare-fun res!192980 () Bool)

(assert (=> b!230208 (=> (not res!192980) (not e!158079))))

(declare-fun lt!367902 () (_ BitVec 64))

(declare-fun lt!367899 () (_ BitVec 64))

(assert (=> b!230208 (= res!192980 (and (= lt!367897 lt!367902) (= (bvsub lt!367897 bits!86) lt!367899)))))

(declare-fun b2!99 () BitStream!9378)

(assert (=> b!230208 (= lt!367902 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10636 b2!99))) ((_ sign_extend 32) (currentBit!10631 b2!99))))))

(declare-fun res!192977 () Bool)

(declare-fun e!158085 () Bool)

(assert (=> start!48580 (=> (not res!192977) (not e!158085))))

(assert (=> start!48580 (= res!192977 (and (= (size!5141 (buf!5682 b1!101)) (size!5141 (buf!5682 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48580 e!158085))

(declare-fun e!158083 () Bool)

(declare-fun inv!12 (BitStream!9378) Bool)

(assert (=> start!48580 (and (inv!12 b1!101) e!158083)))

(declare-fun e!158080 () Bool)

(assert (=> start!48580 (and (inv!12 b2!99) e!158080)))

(assert (=> start!48580 true))

(declare-fun b!230209 () Bool)

(declare-fun e!158082 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230209 (= e!158082 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10631 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10636 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5141 (buf!5682 b2!99)))))))))

(declare-fun b!230210 () Bool)

(declare-fun e!158087 () Bool)

(assert (=> b!230210 (= e!158087 e!158086)))

(declare-fun res!192974 () Bool)

(assert (=> b!230210 (=> (not res!192974) (not e!158086))))

(declare-fun lt!367898 () (_ BitVec 32))

(assert (=> b!230210 (= res!192974 (bvsle lt!367898 bytes!19))))

(declare-fun lt!367901 () (_ BitVec 64))

(assert (=> b!230210 (= lt!367898 ((_ extract 31 0) lt!367901))))

(assert (=> b!230210 (= lt!367901 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!230211 () Bool)

(declare-fun array_inv!4882 (array!11727) Bool)

(assert (=> b!230211 (= e!158080 (array_inv!4882 (buf!5682 b2!99)))))

(declare-fun b!230212 () Bool)

(declare-fun res!192979 () Bool)

(assert (=> b!230212 (=> (not res!192979) (not e!158082))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230212 (= res!192979 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5141 (buf!5682 b2!99))) ((_ sign_extend 32) (currentByte!10636 b2!99)) ((_ sign_extend 32) (currentBit!10631 b2!99)) (bvsub bytes!19 lt!367898)))))

(declare-fun b!230213 () Bool)

(declare-fun res!192973 () Bool)

(assert (=> b!230213 (=> (not res!192973) (not e!158082))))

(assert (=> b!230213 (= res!192973 (and (bvsle ((_ sign_extend 32) (size!5141 (buf!5682 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10636 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10631 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5141 (buf!5682 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10636 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10631 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!230214 () Bool)

(assert (=> b!230214 (= e!158079 e!158082)))

(declare-fun res!192971 () Bool)

(assert (=> b!230214 (=> (not res!192971) (not e!158082))))

(declare-fun lt!367900 () (_ BitVec 64))

(assert (=> b!230214 (= res!192971 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367900 (bvsub lt!367902 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367900 lt!367902) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367901))))))

(assert (=> b!230214 (= lt!367900 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5141 (buf!5682 b2!99)))))))

(declare-fun b!230215 () Bool)

(assert (=> b!230215 (= e!158085 e!158087)))

(declare-fun res!192970 () Bool)

(assert (=> b!230215 (=> (not res!192970) (not e!158087))))

(assert (=> b!230215 (= res!192970 (bvsle bits!86 lt!367897))))

(assert (=> b!230215 (= lt!367897 (bitIndex!0 (size!5141 (buf!5682 b2!99)) (currentByte!10636 b2!99) (currentBit!10631 b2!99)))))

(declare-fun b!230216 () Bool)

(assert (=> b!230216 (= e!158083 (array_inv!4882 (buf!5682 b1!101)))))

(declare-fun b!230217 () Bool)

(assert (=> b!230217 (= e!158086 e!158088)))

(declare-fun res!192975 () Bool)

(assert (=> b!230217 (=> (not res!192975) (not e!158088))))

(assert (=> b!230217 (= res!192975 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5141 (buf!5682 b1!101)))) lt!367899) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230217 (= lt!367899 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10636 b1!101))) ((_ sign_extend 32) (currentBit!10631 b1!101))))))

(declare-fun b!230218 () Bool)

(declare-fun res!192972 () Bool)

(assert (=> b!230218 (=> (not res!192972) (not e!158086))))

(assert (=> b!230218 (= res!192972 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5141 (buf!5682 b1!101))) ((_ sign_extend 32) (currentByte!10636 b1!101)) ((_ sign_extend 32) (currentBit!10631 b1!101)) bytes!19))))

(assert (= (and start!48580 res!192977) b!230215))

(assert (= (and b!230215 res!192970) b!230210))

(assert (= (and b!230210 res!192974) b!230218))

(assert (= (and b!230218 res!192972) b!230207))

(assert (= (and b!230207 res!192976) b!230206))

(assert (= (and b!230206 res!192978) b!230217))

(assert (= (and b!230217 res!192975) b!230208))

(assert (= (and b!230208 res!192980) b!230214))

(assert (= (and b!230214 res!192971) b!230212))

(assert (= (and b!230212 res!192979) b!230213))

(assert (= (and b!230213 res!192973) b!230209))

(assert (= start!48580 b!230216))

(assert (= start!48580 b!230211))

(declare-fun m!353589 () Bool)

(assert (=> b!230218 m!353589))

(declare-fun m!353591 () Bool)

(assert (=> b!230215 m!353591))

(declare-fun m!353593 () Bool)

(assert (=> b!230212 m!353593))

(declare-fun m!353595 () Bool)

(assert (=> b!230209 m!353595))

(declare-fun m!353597 () Bool)

(assert (=> b!230207 m!353597))

(declare-fun m!353599 () Bool)

(assert (=> start!48580 m!353599))

(declare-fun m!353601 () Bool)

(assert (=> start!48580 m!353601))

(declare-fun m!353603 () Bool)

(assert (=> b!230206 m!353603))

(declare-fun m!353605 () Bool)

(assert (=> b!230211 m!353605))

(declare-fun m!353607 () Bool)

(assert (=> b!230216 m!353607))

(check-sat (not b!230206) (not b!230216) (not b!230211) (not b!230207) (not b!230215) (not b!230209) (not b!230212) (not start!48580) (not b!230218))
(check-sat)
(get-model)

(declare-fun d!78096 () Bool)

(assert (=> d!78096 (= (array_inv!4882 (buf!5682 b1!101)) (bvsge (size!5141 (buf!5682 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230216 d!78096))

(declare-fun d!78098 () Bool)

(assert (=> d!78098 (= (remainingBits!0 ((_ sign_extend 32) (size!5141 (buf!5682 b1!101))) ((_ sign_extend 32) (currentByte!10636 b1!101)) ((_ sign_extend 32) (currentBit!10631 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5141 (buf!5682 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10636 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10631 b1!101)))))))

(assert (=> b!230206 d!78098))

(declare-fun d!78100 () Bool)

(assert (=> d!78100 (= (array_inv!4882 (buf!5682 b2!99)) (bvsge (size!5141 (buf!5682 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230211 d!78100))

(declare-fun d!78102 () Bool)

(assert (=> d!78102 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5141 (buf!5682 b2!99))) ((_ sign_extend 32) (currentByte!10636 b2!99)) ((_ sign_extend 32) (currentBit!10631 b2!99)) (bvsub bytes!19 lt!367898)) (bvsle ((_ sign_extend 32) (bvsub bytes!19 lt!367898)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5141 (buf!5682 b2!99))) ((_ sign_extend 32) (currentByte!10636 b2!99)) ((_ sign_extend 32) (currentBit!10631 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19136 () Bool)

(assert (= bs!19136 d!78102))

(declare-fun m!353629 () Bool)

(assert (=> bs!19136 m!353629))

(assert (=> b!230212 d!78102))

(declare-fun d!78104 () Bool)

(assert (=> d!78104 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5141 (buf!5682 b1!101))) ((_ sign_extend 32) (currentByte!10636 b1!101)) ((_ sign_extend 32) (currentBit!10631 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5141 (buf!5682 b1!101))) ((_ sign_extend 32) (currentByte!10636 b1!101)) ((_ sign_extend 32) (currentBit!10631 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19137 () Bool)

(assert (= bs!19137 d!78104))

(assert (=> bs!19137 m!353603))

(assert (=> b!230218 d!78104))

(declare-fun d!78106 () Bool)

(declare-fun e!158121 () Bool)

(assert (=> d!78106 e!158121))

(declare-fun res!193019 () Bool)

(assert (=> d!78106 (=> (not res!193019) (not e!158121))))

(declare-fun lt!367938 () (_ BitVec 64))

(declare-fun lt!367934 () (_ BitVec 64))

(declare-fun lt!367937 () (_ BitVec 64))

(assert (=> d!78106 (= res!193019 (= lt!367938 (bvsub lt!367934 lt!367937)))))

(assert (=> d!78106 (or (= (bvand lt!367934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367937 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367934 lt!367937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78106 (= lt!367937 (remainingBits!0 ((_ sign_extend 32) (size!5141 (buf!5682 b1!101))) ((_ sign_extend 32) (currentByte!10636 b1!101)) ((_ sign_extend 32) (currentBit!10631 b1!101))))))

(declare-fun lt!367935 () (_ BitVec 64))

(declare-fun lt!367936 () (_ BitVec 64))

(assert (=> d!78106 (= lt!367934 (bvmul lt!367935 lt!367936))))

(assert (=> d!78106 (or (= lt!367935 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367936 (bvsdiv (bvmul lt!367935 lt!367936) lt!367935)))))

(assert (=> d!78106 (= lt!367936 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78106 (= lt!367935 ((_ sign_extend 32) (size!5141 (buf!5682 b1!101))))))

(assert (=> d!78106 (= lt!367938 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10636 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10631 b1!101))))))

(assert (=> d!78106 (invariant!0 (currentBit!10631 b1!101) (currentByte!10636 b1!101) (size!5141 (buf!5682 b1!101)))))

(assert (=> d!78106 (= (bitIndex!0 (size!5141 (buf!5682 b1!101)) (currentByte!10636 b1!101) (currentBit!10631 b1!101)) lt!367938)))

(declare-fun b!230262 () Bool)

(declare-fun res!193018 () Bool)

(assert (=> b!230262 (=> (not res!193018) (not e!158121))))

(assert (=> b!230262 (= res!193018 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367938))))

(declare-fun b!230263 () Bool)

(declare-fun lt!367933 () (_ BitVec 64))

(assert (=> b!230263 (= e!158121 (bvsle lt!367938 (bvmul lt!367933 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230263 (or (= lt!367933 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367933 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367933)))))

(assert (=> b!230263 (= lt!367933 ((_ sign_extend 32) (size!5141 (buf!5682 b1!101))))))

(assert (= (and d!78106 res!193019) b!230262))

(assert (= (and b!230262 res!193018) b!230263))

(assert (=> d!78106 m!353603))

(declare-fun m!353631 () Bool)

(assert (=> d!78106 m!353631))

(assert (=> b!230207 d!78106))

(declare-fun d!78108 () Bool)

(assert (=> d!78108 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10631 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10636 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5141 (buf!5682 b2!99))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10631 b2!99))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10631 b2!99))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10636 b2!99))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10636 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5141 (buf!5682 b2!99))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10631 b2!99))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10636 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5141 (buf!5682 b2!99)))))))))))

(assert (=> b!230209 d!78108))

(declare-fun d!78110 () Bool)

(assert (=> d!78110 (= (inv!12 b1!101) (invariant!0 (currentBit!10631 b1!101) (currentByte!10636 b1!101) (size!5141 (buf!5682 b1!101))))))

(declare-fun bs!19138 () Bool)

(assert (= bs!19138 d!78110))

(assert (=> bs!19138 m!353631))

(assert (=> start!48580 d!78110))

(declare-fun d!78112 () Bool)

(assert (=> d!78112 (= (inv!12 b2!99) (invariant!0 (currentBit!10631 b2!99) (currentByte!10636 b2!99) (size!5141 (buf!5682 b2!99))))))

(declare-fun bs!19139 () Bool)

(assert (= bs!19139 d!78112))

(declare-fun m!353633 () Bool)

(assert (=> bs!19139 m!353633))

(assert (=> start!48580 d!78112))

(declare-fun d!78114 () Bool)

(declare-fun e!158122 () Bool)

(assert (=> d!78114 e!158122))

(declare-fun res!193021 () Bool)

(assert (=> d!78114 (=> (not res!193021) (not e!158122))))

(declare-fun lt!367944 () (_ BitVec 64))

(declare-fun lt!367940 () (_ BitVec 64))

(declare-fun lt!367943 () (_ BitVec 64))

(assert (=> d!78114 (= res!193021 (= lt!367944 (bvsub lt!367940 lt!367943)))))

(assert (=> d!78114 (or (= (bvand lt!367940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367943 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367940 lt!367943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78114 (= lt!367943 (remainingBits!0 ((_ sign_extend 32) (size!5141 (buf!5682 b2!99))) ((_ sign_extend 32) (currentByte!10636 b2!99)) ((_ sign_extend 32) (currentBit!10631 b2!99))))))

(declare-fun lt!367941 () (_ BitVec 64))

(declare-fun lt!367942 () (_ BitVec 64))

(assert (=> d!78114 (= lt!367940 (bvmul lt!367941 lt!367942))))

(assert (=> d!78114 (or (= lt!367941 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367942 (bvsdiv (bvmul lt!367941 lt!367942) lt!367941)))))

(assert (=> d!78114 (= lt!367942 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78114 (= lt!367941 ((_ sign_extend 32) (size!5141 (buf!5682 b2!99))))))

(assert (=> d!78114 (= lt!367944 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10636 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10631 b2!99))))))

(assert (=> d!78114 (invariant!0 (currentBit!10631 b2!99) (currentByte!10636 b2!99) (size!5141 (buf!5682 b2!99)))))

(assert (=> d!78114 (= (bitIndex!0 (size!5141 (buf!5682 b2!99)) (currentByte!10636 b2!99) (currentBit!10631 b2!99)) lt!367944)))

(declare-fun b!230264 () Bool)

(declare-fun res!193020 () Bool)

(assert (=> b!230264 (=> (not res!193020) (not e!158122))))

(assert (=> b!230264 (= res!193020 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367944))))

(declare-fun b!230265 () Bool)

(declare-fun lt!367939 () (_ BitVec 64))

(assert (=> b!230265 (= e!158122 (bvsle lt!367944 (bvmul lt!367939 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230265 (or (= lt!367939 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367939 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367939)))))

(assert (=> b!230265 (= lt!367939 ((_ sign_extend 32) (size!5141 (buf!5682 b2!99))))))

(assert (= (and d!78114 res!193021) b!230264))

(assert (= (and b!230264 res!193020) b!230265))

(assert (=> d!78114 m!353629))

(assert (=> d!78114 m!353633))

(assert (=> b!230215 d!78114))

(check-sat (not d!78114) (not d!78104) (not d!78112) (not d!78102) (not d!78106) (not d!78110))
