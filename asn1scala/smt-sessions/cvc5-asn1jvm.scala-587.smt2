; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16864 () Bool)

(assert start!16864)

(declare-fun b!82885 () Bool)

(declare-fun e!54910 () Bool)

(declare-datatypes ((array!3767 0))(
  ( (array!3768 (arr!2355 (Array (_ BitVec 32) (_ BitVec 8))) (size!1718 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2998 0))(
  ( (BitStream!2999 (buf!2108 array!3767) (currentByte!4166 (_ BitVec 32)) (currentBit!4161 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2998)

(declare-fun array_inv!1564 (array!3767) Bool)

(assert (=> b!82885 (= e!54910 (array_inv!1564 (buf!2108 b1!98)))))

(declare-fun b!82886 () Bool)

(declare-fun e!54915 () Bool)

(declare-fun b2!98 () BitStream!2998)

(assert (=> b!82886 (= e!54915 (array_inv!1564 (buf!2108 b2!98)))))

(declare-fun b!82887 () Bool)

(declare-fun res!68249 () Bool)

(declare-fun e!54914 () Bool)

(assert (=> b!82887 (=> (not res!68249) (not e!54914))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82887 (= res!68249 (validate_offset_bits!1 ((_ sign_extend 32) (size!1718 (buf!2108 b1!98))) ((_ sign_extend 32) (currentByte!4166 b1!98)) ((_ sign_extend 32) (currentBit!4161 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82888 () Bool)

(declare-fun e!54908 () Bool)

(assert (=> b!82888 (= e!54914 e!54908)))

(declare-fun res!68251 () Bool)

(assert (=> b!82888 (=> (not res!68251) (not e!54908))))

(declare-fun lt!132113 () (_ BitVec 64))

(declare-fun lt!132114 () (_ BitVec 64))

(assert (=> b!82888 (= res!68251 (= lt!132113 lt!132114))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82888 (= lt!132114 (bitIndex!0 (size!1718 (buf!2108 b2!98)) (currentByte!4166 b2!98) (currentBit!4161 b2!98)))))

(declare-fun lt!132118 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!82888 (= lt!132113 (bvadd lt!132118 b1b2Diff!1))))

(assert (=> b!82888 (= lt!132118 (bitIndex!0 (size!1718 (buf!2108 b1!98)) (currentByte!4166 b1!98) (currentBit!4161 b1!98)))))

(declare-fun b!82889 () Bool)

(declare-fun e!54912 () Bool)

(declare-fun e!54913 () Bool)

(assert (=> b!82889 (= e!54912 e!54913)))

(declare-fun res!68250 () Bool)

(assert (=> b!82889 (=> res!68250 e!54913)))

(declare-fun lt!132119 () (_ BitVec 64))

(declare-fun lt!132116 () (_ BitVec 64))

(assert (=> b!82889 (= res!68250 (or (not (= lt!132116 (bvsub lt!132119 lt!132113))) (bvslt lt!132116 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (bvsgt ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4166 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4161 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4166 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4161 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!82889 (= lt!132116 (bvsub lt!132119 lt!132114))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82889 (= lt!132116 (remainingBits!0 ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))) ((_ sign_extend 32) (currentByte!4166 b2!98)) ((_ sign_extend 32) (currentBit!4161 b2!98))))))

(assert (=> b!82889 (= lt!132119 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1718 (buf!2108 b2!98)))))))

(declare-datatypes ((Unit!5545 0))(
  ( (Unit!5546) )
))
(declare-fun lt!132117 () Unit!5545)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2998) Unit!5545)

(assert (=> b!82889 (= lt!132117 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!68248 () Bool)

(assert (=> start!16864 (=> (not res!68248) (not e!54914))))

(assert (=> start!16864 (= res!68248 (and (= (size!1718 (buf!2108 b1!98)) (size!1718 (buf!2108 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16864 e!54914))

(declare-fun inv!12 (BitStream!2998) Bool)

(assert (=> start!16864 (and (inv!12 b1!98) e!54910)))

(assert (=> start!16864 (and (inv!12 b2!98) e!54915)))

(assert (=> start!16864 true))

(declare-fun b!82890 () Bool)

(assert (=> b!82890 (= e!54908 (not e!54912))))

(declare-fun res!68247 () Bool)

(assert (=> b!82890 (=> res!68247 e!54912)))

(declare-fun lt!132115 () (_ BitVec 64))

(assert (=> b!82890 (= res!68247 (bvsgt lt!132118 (bvsub lt!132115 b1ValidateOffsetBits!11)))))

(assert (=> b!82890 (= (remainingBits!0 ((_ sign_extend 32) (size!1718 (buf!2108 b1!98))) ((_ sign_extend 32) (currentByte!4166 b1!98)) ((_ sign_extend 32) (currentBit!4161 b1!98))) (bvsub lt!132115 lt!132118))))

(assert (=> b!82890 (= lt!132115 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1718 (buf!2108 b1!98)))))))

(declare-fun lt!132120 () Unit!5545)

(assert (=> b!82890 (= lt!132120 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82891 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82891 (= e!54913 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4161 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4166 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))))))))

(assert (= (and start!16864 res!68248) b!82887))

(assert (= (and b!82887 res!68249) b!82888))

(assert (= (and b!82888 res!68251) b!82890))

(assert (= (and b!82890 (not res!68247)) b!82889))

(assert (= (and b!82889 (not res!68250)) b!82891))

(assert (= start!16864 b!82885))

(assert (= start!16864 b!82886))

(declare-fun m!129393 () Bool)

(assert (=> b!82886 m!129393))

(declare-fun m!129395 () Bool)

(assert (=> b!82888 m!129395))

(declare-fun m!129397 () Bool)

(assert (=> b!82888 m!129397))

(declare-fun m!129399 () Bool)

(assert (=> b!82887 m!129399))

(declare-fun m!129401 () Bool)

(assert (=> b!82889 m!129401))

(declare-fun m!129403 () Bool)

(assert (=> b!82889 m!129403))

(declare-fun m!129405 () Bool)

(assert (=> start!16864 m!129405))

(declare-fun m!129407 () Bool)

(assert (=> start!16864 m!129407))

(declare-fun m!129409 () Bool)

(assert (=> b!82885 m!129409))

(declare-fun m!129411 () Bool)

(assert (=> b!82891 m!129411))

(declare-fun m!129413 () Bool)

(assert (=> b!82890 m!129413))

(declare-fun m!129415 () Bool)

(assert (=> b!82890 m!129415))

(push 1)

(assert (not b!82891))

(assert (not b!82888))

(assert (not b!82890))

(assert (not b!82889))

(assert (not start!16864))

(assert (not b!82885))

(assert (not b!82886))

(assert (not b!82887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26416 () Bool)

(declare-fun e!54970 () Bool)

(assert (=> d!26416 e!54970))

(declare-fun res!68295 () Bool)

(assert (=> d!26416 (=> (not res!68295) (not e!54970))))

(declare-fun lt!132230 () (_ BitVec 64))

(declare-fun lt!132225 () (_ BitVec 64))

(declare-fun lt!132226 () (_ BitVec 64))

(assert (=> d!26416 (= res!68295 (= lt!132225 (bvsub lt!132226 lt!132230)))))

(assert (=> d!26416 (or (= (bvand lt!132226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132230 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132226 lt!132230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26416 (= lt!132230 (remainingBits!0 ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))) ((_ sign_extend 32) (currentByte!4166 b2!98)) ((_ sign_extend 32) (currentBit!4161 b2!98))))))

(declare-fun lt!132227 () (_ BitVec 64))

(declare-fun lt!132228 () (_ BitVec 64))

(assert (=> d!26416 (= lt!132226 (bvmul lt!132227 lt!132228))))

(assert (=> d!26416 (or (= lt!132227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132228 (bvsdiv (bvmul lt!132227 lt!132228) lt!132227)))))

(assert (=> d!26416 (= lt!132228 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26416 (= lt!132227 ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))))))

(assert (=> d!26416 (= lt!132225 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4166 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4161 b2!98))))))

(assert (=> d!26416 (invariant!0 (currentBit!4161 b2!98) (currentByte!4166 b2!98) (size!1718 (buf!2108 b2!98)))))

(assert (=> d!26416 (= (bitIndex!0 (size!1718 (buf!2108 b2!98)) (currentByte!4166 b2!98) (currentBit!4161 b2!98)) lt!132225)))

(declare-fun b!82947 () Bool)

(declare-fun res!68294 () Bool)

(assert (=> b!82947 (=> (not res!68294) (not e!54970))))

(assert (=> b!82947 (= res!68294 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132225))))

(declare-fun b!82948 () Bool)

(declare-fun lt!132229 () (_ BitVec 64))

(assert (=> b!82948 (= e!54970 (bvsle lt!132225 (bvmul lt!132229 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82948 (or (= lt!132229 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132229 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132229)))))

(assert (=> b!82948 (= lt!132229 ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))))))

(assert (= (and d!26416 res!68295) b!82947))

(assert (= (and b!82947 res!68294) b!82948))

(assert (=> d!26416 m!129401))

(declare-fun m!129473 () Bool)

(assert (=> d!26416 m!129473))

(assert (=> b!82888 d!26416))

(declare-fun d!26418 () Bool)

(declare-fun e!54971 () Bool)

(assert (=> d!26418 e!54971))

(declare-fun res!68297 () Bool)

(assert (=> d!26418 (=> (not res!68297) (not e!54971))))

(declare-fun lt!132236 () (_ BitVec 64))

(declare-fun lt!132232 () (_ BitVec 64))

(declare-fun lt!132231 () (_ BitVec 64))

(assert (=> d!26418 (= res!68297 (= lt!132231 (bvsub lt!132232 lt!132236)))))

(assert (=> d!26418 (or (= (bvand lt!132232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132236 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132232 lt!132236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26418 (= lt!132236 (remainingBits!0 ((_ sign_extend 32) (size!1718 (buf!2108 b1!98))) ((_ sign_extend 32) (currentByte!4166 b1!98)) ((_ sign_extend 32) (currentBit!4161 b1!98))))))

(declare-fun lt!132233 () (_ BitVec 64))

(declare-fun lt!132234 () (_ BitVec 64))

(assert (=> d!26418 (= lt!132232 (bvmul lt!132233 lt!132234))))

(assert (=> d!26418 (or (= lt!132233 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132234 (bvsdiv (bvmul lt!132233 lt!132234) lt!132233)))))

(assert (=> d!26418 (= lt!132234 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26418 (= lt!132233 ((_ sign_extend 32) (size!1718 (buf!2108 b1!98))))))

(assert (=> d!26418 (= lt!132231 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4166 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4161 b1!98))))))

(assert (=> d!26418 (invariant!0 (currentBit!4161 b1!98) (currentByte!4166 b1!98) (size!1718 (buf!2108 b1!98)))))

(assert (=> d!26418 (= (bitIndex!0 (size!1718 (buf!2108 b1!98)) (currentByte!4166 b1!98) (currentBit!4161 b1!98)) lt!132231)))

(declare-fun b!82949 () Bool)

(declare-fun res!68296 () Bool)

(assert (=> b!82949 (=> (not res!68296) (not e!54971))))

(assert (=> b!82949 (= res!68296 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132231))))

(declare-fun b!82950 () Bool)

(declare-fun lt!132235 () (_ BitVec 64))

(assert (=> b!82950 (= e!54971 (bvsle lt!132231 (bvmul lt!132235 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82950 (or (= lt!132235 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132235 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132235)))))

(assert (=> b!82950 (= lt!132235 ((_ sign_extend 32) (size!1718 (buf!2108 b1!98))))))

(assert (= (and d!26418 res!68297) b!82949))

(assert (= (and b!82949 res!68296) b!82950))

(assert (=> d!26418 m!129413))

(declare-fun m!129475 () Bool)

(assert (=> d!26418 m!129475))

(assert (=> b!82888 d!26418))

(declare-fun d!26420 () Bool)

(assert (=> d!26420 (= (remainingBits!0 ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))) ((_ sign_extend 32) (currentByte!4166 b2!98)) ((_ sign_extend 32) (currentBit!4161 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4166 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4161 b2!98)))))))

(assert (=> b!82889 d!26420))

(declare-fun d!26422 () Bool)

(declare-fun lt!132250 () (_ BitVec 64))

(declare-fun lt!132251 () (_ BitVec 64))

(assert (=> d!26422 (= (remainingBits!0 ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))) ((_ sign_extend 32) (currentByte!4166 b2!98)) ((_ sign_extend 32) (currentBit!4161 b2!98))) (bvsub lt!132250 lt!132251))))

(assert (=> d!26422 (or (= (bvand lt!132250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132251 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132250 lt!132251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26422 (= lt!132251 (bitIndex!0 (size!1718 (buf!2108 b2!98)) (currentByte!4166 b2!98) (currentBit!4161 b2!98)))))

(declare-fun lt!132247 () (_ BitVec 64))

(declare-fun lt!132249 () (_ BitVec 64))

(assert (=> d!26422 (= lt!132250 (bvmul lt!132247 lt!132249))))

(assert (=> d!26422 (or (= lt!132247 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132249 (bvsdiv (bvmul lt!132247 lt!132249) lt!132247)))))

(assert (=> d!26422 (= lt!132249 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26422 (= lt!132247 ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))))))

(declare-fun lt!132248 () Unit!5545)

(declare-fun choose!23 (BitStream!2998) Unit!5545)

(assert (=> d!26422 (= lt!132248 (choose!23 b2!98))))

(assert (=> d!26422 (= (remainingBitsBitIndexLemma!0 b2!98) lt!132248)))

(declare-fun bs!6483 () Bool)

(assert (= bs!6483 d!26422))

(assert (=> bs!6483 m!129401))

(assert (=> bs!6483 m!129395))

(declare-fun m!129477 () Bool)

(assert (=> bs!6483 m!129477))

(assert (=> b!82889 d!26422))

(declare-fun d!26424 () Bool)

(assert (=> d!26424 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4161 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4166 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4161 b2!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4161 b2!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4166 b2!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4166 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1718 (buf!2108 b2!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4161 b2!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4166 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1718 (buf!2108 b2!98)))))))))))

(assert (=> b!82891 d!26424))

(declare-fun d!26428 () Bool)

(assert (=> d!26428 (= (remainingBits!0 ((_ sign_extend 32) (size!1718 (buf!2108 b1!98))) ((_ sign_extend 32) (currentByte!4166 b1!98)) ((_ sign_extend 32) (currentBit!4161 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1718 (buf!2108 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4166 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4161 b1!98)))))))

(assert (=> b!82890 d!26428))

(declare-fun d!26430 () Bool)

(declare-fun lt!132255 () (_ BitVec 64))

(declare-fun lt!132256 () (_ BitVec 64))

(assert (=> d!26430 (= (remainingBits!0 ((_ sign_extend 32) (size!1718 (buf!2108 b1!98))) ((_ sign_extend 32) (currentByte!4166 b1!98)) ((_ sign_extend 32) (currentBit!4161 b1!98))) (bvsub lt!132255 lt!132256))))

(assert (=> d!26430 (or (= (bvand lt!132255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132255 lt!132256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26430 (= lt!132256 (bitIndex!0 (size!1718 (buf!2108 b1!98)) (currentByte!4166 b1!98) (currentBit!4161 b1!98)))))

(declare-fun lt!132252 () (_ BitVec 64))

(declare-fun lt!132254 () (_ BitVec 64))

(assert (=> d!26430 (= lt!132255 (bvmul lt!132252 lt!132254))))

(assert (=> d!26430 (or (= lt!132252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132254 (bvsdiv (bvmul lt!132252 lt!132254) lt!132252)))))

(assert (=> d!26430 (= lt!132254 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26430 (= lt!132252 ((_ sign_extend 32) (size!1718 (buf!2108 b1!98))))))

(declare-fun lt!132253 () Unit!5545)

(assert (=> d!26430 (= lt!132253 (choose!23 b1!98))))

(assert (=> d!26430 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132253)))

(declare-fun bs!6484 () Bool)

(assert (= bs!6484 d!26430))

(assert (=> bs!6484 m!129413))

(assert (=> bs!6484 m!129397))

(declare-fun m!129479 () Bool)

(assert (=> bs!6484 m!129479))

(assert (=> b!82890 d!26430))

(declare-fun d!26432 () Bool)

(assert (=> d!26432 (= (array_inv!1564 (buf!2108 b1!98)) (bvsge (size!1718 (buf!2108 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82885 d!26432))

(declare-fun d!26434 () Bool)

(assert (=> d!26434 (= (inv!12 b1!98) (invariant!0 (currentBit!4161 b1!98) (currentByte!4166 b1!98) (size!1718 (buf!2108 b1!98))))))

(declare-fun bs!6485 () Bool)

(assert (= bs!6485 d!26434))

(assert (=> bs!6485 m!129475))

(assert (=> start!16864 d!26434))

(declare-fun d!26436 () Bool)

(assert (=> d!26436 (= (inv!12 b2!98) (invariant!0 (currentBit!4161 b2!98) (currentByte!4166 b2!98) (size!1718 (buf!2108 b2!98))))))

(declare-fun bs!6486 () Bool)

(assert (= bs!6486 d!26436))

(assert (=> bs!6486 m!129473))

(assert (=> start!16864 d!26436))

(declare-fun d!26438 () Bool)

(assert (=> d!26438 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1718 (buf!2108 b1!98))) ((_ sign_extend 32) (currentByte!4166 b1!98)) ((_ sign_extend 32) (currentBit!4161 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1718 (buf!2108 b1!98))) ((_ sign_extend 32) (currentByte!4166 b1!98)) ((_ sign_extend 32) (currentBit!4161 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6487 () Bool)

(assert (= bs!6487 d!26438))

(assert (=> bs!6487 m!129413))

(assert (=> b!82887 d!26438))

(declare-fun d!26440 () Bool)

(assert (=> d!26440 (= (array_inv!1564 (buf!2108 b2!98)) (bvsge (size!1718 (buf!2108 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82886 d!26440))

(push 1)

(assert (not d!26436))

(assert (not d!26422))

(assert (not d!26434))

(assert (not d!26418))

(assert (not d!26438))

(assert (not d!26430))

(assert (not d!26416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

