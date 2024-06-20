; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30814 () Bool)

(assert start!30814)

(declare-fun b!156190 () Bool)

(declare-fun res!130563 () Bool)

(declare-fun e!105465 () Bool)

(assert (=> b!156190 (=> (not res!130563) (not e!105465))))

(declare-datatypes ((array!7149 0))(
  ( (array!7150 (arr!4058 (Array (_ BitVec 32) (_ BitVec 8))) (size!3208 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5674 0))(
  ( (BitStream!5675 (buf!3711 array!7149) (currentByte!6811 (_ BitVec 32)) (currentBit!6806 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5674)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156190 (= res!130563 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3208 (buf!3711 bs!65))) ((_ sign_extend 32) (currentByte!6811 bs!65)) ((_ sign_extend 32) (currentBit!6806 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156193 () Bool)

(declare-fun e!105463 () Bool)

(declare-fun array_inv!2997 (array!7149) Bool)

(assert (=> b!156193 (= e!105463 (array_inv!2997 (buf!3711 bs!65)))))

(declare-fun b!156192 () Bool)

(declare-fun e!105464 () Bool)

(declare-fun moveByteIndexPrecond!0 (BitStream!5674 (_ BitVec 32)) Bool)

(assert (=> b!156192 (= e!105464 (not (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun res!130565 () Bool)

(assert (=> start!30814 (=> (not res!130565) (not e!105465))))

(declare-fun arr!153 () array!7149)

(assert (=> start!30814 (= res!130565 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3208 arr!153))))))

(assert (=> start!30814 e!105465))

(assert (=> start!30814 true))

(assert (=> start!30814 (array_inv!2997 arr!153)))

(declare-fun inv!12 (BitStream!5674) Bool)

(assert (=> start!30814 (and (inv!12 bs!65) e!105463)))

(declare-fun b!156191 () Bool)

(assert (=> b!156191 (= e!105465 e!105464)))

(declare-fun res!130564 () Bool)

(assert (=> b!156191 (=> (not res!130564) (not e!105464))))

(assert (=> b!156191 (= res!130564 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!13924 0))(
  ( (tuple2!13925 (_1!7397 BitStream!5674) (_2!7397 array!7149)) )
))
(declare-fun lt!244005 () tuple2!13924)

(declare-fun readByteArrayLoopPure!0 (BitStream!5674 array!7149 (_ BitVec 32) (_ BitVec 32)) tuple2!13924)

(declare-fun withMovedByteIndex!0 (BitStream!5674 (_ BitVec 32)) BitStream!5674)

(declare-datatypes ((tuple2!13926 0))(
  ( (tuple2!13927 (_1!7398 BitStream!5674) (_2!7398 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5674) tuple2!13926)

(assert (=> b!156191 (= lt!244005 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!244006 () tuple2!13924)

(assert (=> b!156191 (= lt!244006 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!30814 res!130565) b!156190))

(assert (= (and b!156190 res!130563) b!156191))

(assert (= (and b!156191 res!130564) b!156192))

(assert (= start!30814 b!156193))

(declare-fun m!243165 () Bool)

(assert (=> b!156191 m!243165))

(declare-fun m!243167 () Bool)

(assert (=> b!156191 m!243167))

(assert (=> b!156191 m!243167))

(declare-fun m!243169 () Bool)

(assert (=> b!156191 m!243169))

(declare-fun m!243171 () Bool)

(assert (=> b!156191 m!243171))

(declare-fun m!243173 () Bool)

(assert (=> b!156191 m!243173))

(declare-fun m!243175 () Bool)

(assert (=> b!156190 m!243175))

(declare-fun m!243177 () Bool)

(assert (=> start!30814 m!243177))

(declare-fun m!243179 () Bool)

(assert (=> start!30814 m!243179))

(declare-fun m!243181 () Bool)

(assert (=> b!156192 m!243181))

(declare-fun m!243183 () Bool)

(assert (=> b!156193 m!243183))

(push 1)

(assert (not b!156190))

(assert (not start!30814))

(assert (not b!156191))

(assert (not b!156193))

(assert (not b!156192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51876 () Bool)

(assert (=> d!51876 (= (array_inv!2997 (buf!3711 bs!65)) (bvsge (size!3208 (buf!3711 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156193 d!51876))

(declare-fun d!51878 () Bool)

(assert (=> d!51878 (= (array_inv!2997 arr!153) (bvsge (size!3208 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30814 d!51878))

(declare-fun d!51880 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51880 (= (inv!12 bs!65) (invariant!0 (currentBit!6806 bs!65) (currentByte!6811 bs!65) (size!3208 (buf!3711 bs!65))))))

(declare-fun bs!12696 () Bool)

(assert (= bs!12696 d!51880))

(declare-fun m!243225 () Bool)

(assert (=> bs!12696 m!243225))

(assert (=> start!30814 d!51880))

(declare-fun d!51884 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51884 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3208 (buf!3711 bs!65))) ((_ sign_extend 32) (currentByte!6811 bs!65)) ((_ sign_extend 32) (currentBit!6806 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3208 (buf!3711 bs!65))) ((_ sign_extend 32) (currentByte!6811 bs!65)) ((_ sign_extend 32) (currentBit!6806 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12698 () Bool)

(assert (= bs!12698 d!51884))

(declare-fun m!243229 () Bool)

(assert (=> bs!12698 m!243229))

(assert (=> b!156190 d!51884))

(declare-datatypes ((Unit!10014 0))(
  ( (Unit!10015) )
))
(declare-datatypes ((tuple3!638 0))(
  ( (tuple3!639 (_1!7404 Unit!10014) (_2!7404 BitStream!5674) (_3!436 array!7149)) )
))
(declare-fun lt!244024 () tuple3!638)

(declare-fun d!51888 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5674 array!7149 (_ BitVec 32) (_ BitVec 32)) tuple3!638)

(assert (=> d!51888 (= lt!244024 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51888 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13925 (_2!7404 lt!244024) (_3!436 lt!244024)))))

(declare-fun bs!12700 () Bool)

(assert (= bs!12700 d!51888))

(assert (=> bs!12700 m!243167))

(declare-fun m!243233 () Bool)

(assert (=> bs!12700 m!243233))

(assert (=> b!156191 d!51888))

(declare-fun d!51892 () Bool)

(declare-datatypes ((tuple2!13936 0))(
  ( (tuple2!13937 (_1!7405 Unit!10014) (_2!7405 BitStream!5674)) )
))
(declare-fun moveByteIndex!0 (BitStream!5674 (_ BitVec 32)) tuple2!13936)

(assert (=> d!51892 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7405 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12702 () Bool)

(assert (= bs!12702 d!51892))

(declare-fun m!243237 () Bool)

(assert (=> bs!12702 m!243237))

(assert (=> b!156191 d!51892))

(declare-fun d!51896 () Bool)

(declare-datatypes ((tuple2!13940 0))(
  ( (tuple2!13941 (_1!7407 (_ BitVec 8)) (_2!7407 BitStream!5674)) )
))
(declare-fun lt!244031 () tuple2!13940)

(declare-fun readByte!0 (BitStream!5674) tuple2!13940)

(assert (=> d!51896 (= lt!244031 (readByte!0 bs!65))))

(assert (=> d!51896 (= (readBytePure!0 bs!65) (tuple2!13927 (_2!7407 lt!244031) (_1!7407 lt!244031)))))

(declare-fun bs!12705 () Bool)

(assert (= bs!12705 d!51896))

(declare-fun m!243243 () Bool)

(assert (=> bs!12705 m!243243))

(assert (=> b!156191 d!51896))

(declare-fun lt!244032 () tuple3!638)

(declare-fun d!51902 () Bool)

(assert (=> d!51902 (= lt!244032 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51902 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13925 (_2!7404 lt!244032) (_3!436 lt!244032)))))

(declare-fun bs!12706 () Bool)

(assert (= bs!12706 d!51902))

(declare-fun m!243245 () Bool)

(assert (=> bs!12706 m!243245))

(assert (=> b!156191 d!51902))

(declare-fun d!51904 () Bool)

(assert (=> d!51904 (= (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001) (and (bvsle (bvneg (size!3208 (buf!3711 bs!65))) #b00000000000000000000000000000001) (bvsle #b00000000000000000000000000000001 (size!3208 (buf!3711 bs!65))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!6811 bs!65)) ((_ sign_extend 32) #b00000000000000000000000000000001)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!3208 (buf!3711 bs!65))))) (and (= (currentBit!6806 bs!65) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!3208 (buf!3711 bs!65)))))))))))

(assert (=> b!156192 d!51904))

(push 1)

(assert (not d!51880))

(assert (not d!51888))

(assert (not d!51892))

(assert (not d!51902))

(assert (not d!51896))

(assert (not d!51884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51934 () Bool)

(declare-fun lt!244060 () (_ BitVec 8))

(declare-fun lt!244055 () (_ BitVec 8))

(assert (=> d!51934 (= lt!244060 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4058 (buf!3711 bs!65)) (currentByte!6811 bs!65))) ((_ sign_extend 24) lt!244055))))))

(assert (=> d!51934 (= lt!244055 ((_ extract 7 0) (currentBit!6806 bs!65)))))

(declare-fun e!105503 () Bool)

(assert (=> d!51934 e!105503))

(declare-fun res!130589 () Bool)

(assert (=> d!51934 (=> (not res!130589) (not e!105503))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51934 (= res!130589 (validate_offset_bits!1 ((_ sign_extend 32) (size!3208 (buf!3711 bs!65))) ((_ sign_extend 32) (currentByte!6811 bs!65)) ((_ sign_extend 32) (currentBit!6806 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13948 0))(
  ( (tuple2!13949 (_1!7412 Unit!10014) (_2!7412 (_ BitVec 8))) )
))
(declare-fun Unit!10026 () Unit!10014)

(declare-fun Unit!10027 () Unit!10014)

(assert (=> d!51934 (= (readByte!0 bs!65) (tuple2!13941 (_2!7412 (ite (bvsgt ((_ sign_extend 24) lt!244055) #b00000000000000000000000000000000) (tuple2!13949 Unit!10026 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!244060) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4058 (buf!3711 bs!65)) (bvadd (currentByte!6811 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!244055)))))))) (tuple2!13949 Unit!10027 lt!244060))) (BitStream!5675 (buf!3711 bs!65) (bvadd (currentByte!6811 bs!65) #b00000000000000000000000000000001) (currentBit!6806 bs!65))))))

(declare-fun b!156225 () Bool)

(declare-fun e!105502 () Bool)

(assert (=> b!156225 (= e!105503 e!105502)))

(declare-fun res!130590 () Bool)

(assert (=> b!156225 (=> (not res!130590) (not e!105502))))

(declare-fun lt!244058 () tuple2!13940)

(assert (=> b!156225 (= res!130590 (= (buf!3711 (_2!7407 lt!244058)) (buf!3711 bs!65)))))

(declare-fun lt!244057 () (_ BitVec 8))

(declare-fun lt!244054 () (_ BitVec 8))

(declare-fun Unit!10028 () Unit!10014)

(declare-fun Unit!10029 () Unit!10014)

(assert (=> b!156225 (= lt!244058 (tuple2!13941 (_2!7412 (ite (bvsgt ((_ sign_extend 24) lt!244054) #b00000000000000000000000000000000) (tuple2!13949 Unit!10028 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!244057) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4058 (buf!3711 bs!65)) (bvadd (currentByte!6811 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!244054)))))))) (tuple2!13949 Unit!10029 lt!244057))) (BitStream!5675 (buf!3711 bs!65) (bvadd (currentByte!6811 bs!65) #b00000000000000000000000000000001) (currentBit!6806 bs!65))))))

(assert (=> b!156225 (= lt!244057 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4058 (buf!3711 bs!65)) (currentByte!6811 bs!65))) ((_ sign_extend 24) lt!244054))))))

(assert (=> b!156225 (= lt!244054 ((_ extract 7 0) (currentBit!6806 bs!65)))))

(declare-fun lt!244056 () (_ BitVec 64))

(declare-fun lt!244059 () (_ BitVec 64))

(declare-fun b!156226 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156226 (= e!105502 (= (bitIndex!0 (size!3208 (buf!3711 (_2!7407 lt!244058))) (currentByte!6811 (_2!7407 lt!244058)) (currentBit!6806 (_2!7407 lt!244058))) (bvadd lt!244059 lt!244056)))))

(assert (=> b!156226 (or (not (= (bvand lt!244059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244056 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244059 lt!244056) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156226 (= lt!244056 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156226 (= lt!244059 (bitIndex!0 (size!3208 (buf!3711 bs!65)) (currentByte!6811 bs!65) (currentBit!6806 bs!65)))))

(assert (= (and d!51934 res!130589) b!156225))

(assert (= (and b!156225 res!130590) b!156226))

(declare-fun m!243261 () Bool)

(assert (=> d!51934 m!243261))

(declare-fun m!243263 () Bool)

(assert (=> d!51934 m!243263))

(declare-fun m!243265 () Bool)

(assert (=> d!51934 m!243265))

(assert (=> b!156225 m!243265))

(assert (=> b!156225 m!243261))

(declare-fun m!243267 () Bool)

(assert (=> b!156226 m!243267))

(declare-fun m!243269 () Bool)

(assert (=> b!156226 m!243269))

(assert (=> d!51896 d!51934))

(declare-fun e!105541 () Bool)

(declare-fun b!156281 () Bool)

(declare-fun lt!244406 () tuple3!638)

(assert (=> b!156281 (= e!105541 (= (select (arr!4058 (_3!436 lt!244406)) from!240) (_2!7398 (readBytePure!0 bs!65))))))

(assert (=> b!156281 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3208 (_3!436 lt!244406))))))

(declare-fun b!156282 () Bool)

(declare-fun e!105540 () tuple3!638)

(declare-fun lt!244441 () Unit!10014)

(declare-fun lt!244422 () tuple3!638)

(assert (=> b!156282 (= e!105540 (tuple3!639 lt!244441 (_2!7404 lt!244422) (_3!436 lt!244422)))))

(declare-fun lt!244421 () tuple2!13940)

(assert (=> b!156282 (= lt!244421 (readByte!0 bs!65))))

(declare-fun lt!244412 () array!7149)

(assert (=> b!156282 (= lt!244412 (array!7150 (store (arr!4058 arr!153) from!240 (_1!7407 lt!244421)) (size!3208 arr!153)))))

(declare-fun lt!244417 () (_ BitVec 64))

(assert (=> b!156282 (= lt!244417 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!244429 () (_ BitVec 32))

(assert (=> b!156282 (= lt!244429 (bvsub to!236 from!240))))

(declare-fun lt!244426 () Unit!10014)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5674 BitStream!5674 (_ BitVec 64) (_ BitVec 32)) Unit!10014)

(assert (=> b!156282 (= lt!244426 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7407 lt!244421) lt!244417 lt!244429))))

(assert (=> b!156282 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3208 (buf!3711 (_2!7407 lt!244421)))) ((_ sign_extend 32) (currentByte!6811 (_2!7407 lt!244421))) ((_ sign_extend 32) (currentBit!6806 (_2!7407 lt!244421))) (bvsub lt!244429 ((_ extract 31 0) (bvsdiv (bvadd lt!244417 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!244414 () Unit!10014)

(assert (=> b!156282 (= lt!244414 lt!244426)))

(assert (=> b!156282 (= lt!244422 (readByteArrayLoop!0 (_2!7407 lt!244421) lt!244412 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2412 () (_ BitVec 64))

(assert (=> b!156282 (= (bitIndex!0 (size!3208 (buf!3711 (_2!7407 lt!244421))) (currentByte!6811 (_2!7407 lt!244421)) (currentBit!6806 (_2!7407 lt!244421))) (bvadd call!2412 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!244439 () Unit!10014)

(declare-fun Unit!10034 () Unit!10014)

(assert (=> b!156282 (= lt!244439 Unit!10034)))

(assert (=> b!156282 (= (bvadd (bitIndex!0 (size!3208 (buf!3711 (_2!7407 lt!244421))) (currentByte!6811 (_2!7407 lt!244421)) (currentBit!6806 (_2!7407 lt!244421))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3208 (buf!3711 (_2!7404 lt!244422))) (currentByte!6811 (_2!7404 lt!244422)) (currentBit!6806 (_2!7404 lt!244422))))))

(declare-fun lt!244420 () Unit!10014)

(declare-fun Unit!10035 () Unit!10014)

(assert (=> b!156282 (= lt!244420 Unit!10035)))

(assert (=> b!156282 (= (bvadd call!2412 (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3208 (buf!3711 (_2!7404 lt!244422))) (currentByte!6811 (_2!7404 lt!244422)) (currentBit!6806 (_2!7404 lt!244422))))))

(declare-fun lt!244407 () Unit!10014)

(declare-fun Unit!10036 () Unit!10014)

(assert (=> b!156282 (= lt!244407 Unit!10036)))

(assert (=> b!156282 (and (= (buf!3711 bs!65) (buf!3711 (_2!7404 lt!244422))) (= (size!3208 arr!153) (size!3208 (_3!436 lt!244422))))))

(declare-fun lt!244432 () Unit!10014)

(declare-fun Unit!10037 () Unit!10014)

(assert (=> b!156282 (= lt!244432 Unit!10037)))

(declare-fun lt!244410 () Unit!10014)

(declare-fun arrayUpdatedAtPrefixLemma!34 (array!7149 (_ BitVec 32) (_ BitVec 8)) Unit!10014)

(assert (=> b!156282 (= lt!244410 (arrayUpdatedAtPrefixLemma!34 arr!153 from!240 (_1!7407 lt!244421)))))

(declare-fun arrayRangesEq!423 (array!7149 array!7149 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!156282 (arrayRangesEq!423 arr!153 (array!7150 (store (arr!4058 arr!153) from!240 (_1!7407 lt!244421)) (size!3208 arr!153)) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!244427 () Unit!10014)

(assert (=> b!156282 (= lt!244427 lt!244410)))

(declare-fun lt!244440 () (_ BitVec 32))

(assert (=> b!156282 (= lt!244440 #b00000000000000000000000000000000)))

(declare-fun lt!244425 () Unit!10014)

(declare-fun arrayRangesEqTransitive!99 (array!7149 array!7149 array!7149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10014)

(assert (=> b!156282 (= lt!244425 (arrayRangesEqTransitive!99 arr!153 lt!244412 (_3!436 lt!244422) lt!244440 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2413 () Bool)

(assert (=> b!156282 call!2413))

(declare-fun lt!244437 () Unit!10014)

(assert (=> b!156282 (= lt!244437 lt!244425)))

(declare-fun call!2414 () Bool)

(assert (=> b!156282 call!2414))

(declare-fun lt!244409 () Unit!10014)

(declare-fun Unit!10038 () Unit!10014)

(assert (=> b!156282 (= lt!244409 Unit!10038)))

(declare-fun lt!244419 () Unit!10014)

(declare-fun arrayRangesEqImpliesEq!43 (array!7149 array!7149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10014)

(assert (=> b!156282 (= lt!244419 (arrayRangesEqImpliesEq!43 lt!244412 (_3!436 lt!244422) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156282 (= (select (store (arr!4058 arr!153) from!240 (_1!7407 lt!244421)) from!240) (select (arr!4058 (_3!436 lt!244422)) from!240))))

(declare-fun lt!244435 () Unit!10014)

(assert (=> b!156282 (= lt!244435 lt!244419)))

(declare-fun lt!244428 () Bool)

(assert (=> b!156282 (= lt!244428 (= (select (arr!4058 (_3!436 lt!244422)) from!240) (_1!7407 lt!244421)))))

(declare-fun Unit!10039 () Unit!10014)

(assert (=> b!156282 (= lt!244441 Unit!10039)))

(assert (=> b!156282 lt!244428))

(declare-fun bm!2409 () Bool)

(assert (=> bm!2409 (= call!2412 (bitIndex!0 (size!3208 (buf!3711 bs!65)) (currentByte!6811 bs!65) (currentBit!6806 bs!65)))))

(declare-fun e!105542 () Bool)

(declare-fun b!156283 () Bool)

(assert (=> b!156283 (= e!105542 (arrayRangesEq!423 arr!153 (_3!436 lt!244406) #b00000000000000000000000000000000 from!240))))

(declare-fun b!156284 () Bool)

(declare-fun lt!244433 () Unit!10014)

(assert (=> b!156284 (= e!105540 (tuple3!639 lt!244433 bs!65 arr!153))))

(assert (=> b!156284 (= call!2412 call!2412)))

(declare-fun lt!244415 () Unit!10014)

(declare-fun Unit!10042 () Unit!10014)

(assert (=> b!156284 (= lt!244415 Unit!10042)))

(declare-fun lt!244431 () Unit!10014)

(declare-fun arrayRangesEqReflexiveLemma!35 (array!7149) Unit!10014)

(assert (=> b!156284 (= lt!244431 (arrayRangesEqReflexiveLemma!35 arr!153))))

(assert (=> b!156284 call!2414))

(declare-fun lt!244424 () Unit!10014)

(assert (=> b!156284 (= lt!244424 lt!244431)))

(declare-fun lt!244413 () array!7149)

(assert (=> b!156284 (= lt!244413 arr!153)))

(declare-fun lt!244434 () array!7149)

(assert (=> b!156284 (= lt!244434 arr!153)))

(declare-fun lt!244438 () (_ BitVec 32))

(assert (=> b!156284 (= lt!244438 #b00000000000000000000000000000000)))

(declare-fun lt!244416 () (_ BitVec 32))

(assert (=> b!156284 (= lt!244416 (size!3208 arr!153))))

(declare-fun lt!244430 () (_ BitVec 32))

(assert (=> b!156284 (= lt!244430 #b00000000000000000000000000000000)))

(declare-fun lt!244411 () (_ BitVec 32))

(assert (=> b!156284 (= lt!244411 from!240)))

(declare-fun arrayRangesEqSlicedLemma!35 (array!7149 array!7149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10014)

(assert (=> b!156284 (= lt!244433 (arrayRangesEqSlicedLemma!35 lt!244413 lt!244434 lt!244438 lt!244416 lt!244430 lt!244411))))

(assert (=> b!156284 call!2413))

(declare-fun bm!2411 () Bool)

(declare-fun c!8326 () Bool)

(assert (=> bm!2411 (= call!2413 (arrayRangesEq!423 (ite c!8326 arr!153 lt!244413) (ite c!8326 (_3!436 lt!244422) lt!244434) (ite c!8326 lt!244440 lt!244430) (ite c!8326 from!240 lt!244411)))))

(declare-fun b!156285 () Bool)

(declare-fun res!130630 () Bool)

(assert (=> b!156285 (=> (not res!130630) (not e!105542))))

(assert (=> b!156285 (= res!130630 (and (= (buf!3711 bs!65) (buf!3711 (_2!7404 lt!244406))) (= (size!3208 arr!153) (size!3208 (_3!436 lt!244406)))))))

(declare-fun bm!2410 () Bool)

(assert (=> bm!2410 (= call!2414 (arrayRangesEq!423 arr!153 (ite c!8326 (_3!436 lt!244422) arr!153) #b00000000000000000000000000000000 (ite c!8326 from!240 (size!3208 arr!153))))))

(declare-fun d!51940 () Bool)

(assert (=> d!51940 e!105541))

(declare-fun res!130629 () Bool)

(assert (=> d!51940 (=> res!130629 e!105541)))

(assert (=> d!51940 (= res!130629 (bvsge from!240 to!236))))

(declare-fun lt!244418 () Bool)

(assert (=> d!51940 (= lt!244418 e!105542)))

(declare-fun res!130631 () Bool)

(assert (=> d!51940 (=> (not res!130631) (not e!105542))))

(declare-fun lt!244423 () (_ BitVec 64))

(declare-fun lt!244436 () (_ BitVec 64))

(assert (=> d!51940 (= res!130631 (= (bvadd lt!244423 lt!244436) (bitIndex!0 (size!3208 (buf!3711 (_2!7404 lt!244406))) (currentByte!6811 (_2!7404 lt!244406)) (currentBit!6806 (_2!7404 lt!244406)))))))

(assert (=> d!51940 (or (not (= (bvand lt!244423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244436 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244423 lt!244436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!244408 () (_ BitVec 64))

(assert (=> d!51940 (= lt!244436 (bvmul lt!244408 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51940 (or (= lt!244408 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!244408 #b0000000000000000000000000000000000000000000000000000000000001000) lt!244408)))))

(assert (=> d!51940 (= lt!244408 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51940 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51940 (= lt!244423 (bitIndex!0 (size!3208 (buf!3711 bs!65)) (currentByte!6811 bs!65) (currentBit!6806 bs!65)))))

(assert (=> d!51940 (= lt!244406 e!105540)))

(assert (=> d!51940 (= c!8326 (bvslt from!240 to!236))))

(assert (=> d!51940 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3208 arr!153)))))

(assert (=> d!51940 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!244406)))

(assert (= (and d!51940 c!8326) b!156282))

(assert (= (and d!51940 (not c!8326)) b!156284))

(assert (= (or b!156282 b!156284) bm!2411))

(assert (= (or b!156282 b!156284) bm!2410))

(assert (= (or b!156282 b!156284) bm!2409))

(assert (= (and d!51940 res!130631) b!156285))

(assert (= (and b!156285 res!130630) b!156283))

(assert (= (and d!51940 (not res!130629)) b!156281))

(declare-fun m!243407 () Bool)

(assert (=> bm!2411 m!243407))

(declare-fun m!243409 () Bool)

(assert (=> b!156283 m!243409))

(declare-fun m!243411 () Bool)

(assert (=> d!51940 m!243411))

(assert (=> d!51940 m!243269))

(declare-fun m!243413 () Bool)

(assert (=> bm!2410 m!243413))

(declare-fun m!243415 () Bool)

(assert (=> b!156281 m!243415))

(assert (=> b!156281 m!243165))

(declare-fun m!243417 () Bool)

(assert (=> b!156284 m!243417))

(declare-fun m!243419 () Bool)

(assert (=> b!156284 m!243419))

(declare-fun m!243421 () Bool)

(assert (=> b!156282 m!243421))

(declare-fun m!243423 () Bool)

(assert (=> b!156282 m!243423))

(declare-fun m!243425 () Bool)

(assert (=> b!156282 m!243425))

(declare-fun m!243427 () Bool)

(assert (=> b!156282 m!243427))

(declare-fun m!243429 () Bool)

(assert (=> b!156282 m!243429))

(declare-fun m!243431 () Bool)

(assert (=> b!156282 m!243431))

(assert (=> b!156282 m!243243))

(declare-fun m!243433 () Bool)

(assert (=> b!156282 m!243433))

(declare-fun m!243435 () Bool)

(assert (=> b!156282 m!243435))

(declare-fun m!243437 () Bool)

(assert (=> b!156282 m!243437))

(declare-fun m!243439 () Bool)

(assert (=> b!156282 m!243439))

(declare-fun m!243441 () Bool)

(assert (=> b!156282 m!243441))

(declare-fun m!243443 () Bool)

(assert (=> b!156282 m!243443))

(assert (=> bm!2409 m!243269))

(assert (=> d!51902 d!51940))

(declare-fun d!51952 () Bool)

(declare-fun e!105545 () Bool)

(assert (=> d!51952 e!105545))

(declare-fun res!130634 () Bool)

(assert (=> d!51952 (=> (not res!130634) (not e!105545))))

(assert (=> d!51952 (= res!130634 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10048 () Unit!10014)

(assert (=> d!51952 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13937 Unit!10048 (BitStream!5675 (buf!3711 bs!65) (bvadd (currentByte!6811 bs!65) #b00000000000000000000000000000001) (currentBit!6806 bs!65))))))

(declare-fun b!156288 () Bool)

(assert (=> b!156288 (= e!105545 (and (or (not (= (bvand (currentByte!6811 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6811 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6811 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6811 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6811 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51952 res!130634) b!156288))

(assert (=> d!51952 m!243181))

(assert (=> d!51892 d!51952))

(declare-fun b!156289 () Bool)

(declare-fun e!105547 () Bool)

(declare-fun lt!244442 () tuple3!638)

(assert (=> b!156289 (= e!105547 (= (select (arr!4058 (_3!436 lt!244442)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7398 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!156289 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3208 (_3!436 lt!244442))))))

(declare-fun b!156290 () Bool)

(declare-fun e!105546 () tuple3!638)

(declare-fun lt!244477 () Unit!10014)

(declare-fun lt!244458 () tuple3!638)

(assert (=> b!156290 (= e!105546 (tuple3!639 lt!244477 (_2!7404 lt!244458) (_3!436 lt!244458)))))

(declare-fun lt!244457 () tuple2!13940)

(assert (=> b!156290 (= lt!244457 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!244448 () array!7149)

(assert (=> b!156290 (= lt!244448 (array!7150 (store (arr!4058 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7407 lt!244457)) (size!3208 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)))))))

(declare-fun lt!244453 () (_ BitVec 64))

(assert (=> b!156290 (= lt!244453 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!244465 () (_ BitVec 32))

(assert (=> b!156290 (= lt!244465 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!244462 () Unit!10014)

(assert (=> b!156290 (= lt!244462 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7407 lt!244457) lt!244453 lt!244465))))

(assert (=> b!156290 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3208 (buf!3711 (_2!7407 lt!244457)))) ((_ sign_extend 32) (currentByte!6811 (_2!7407 lt!244457))) ((_ sign_extend 32) (currentBit!6806 (_2!7407 lt!244457))) (bvsub lt!244465 ((_ extract 31 0) (bvsdiv (bvadd lt!244453 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!244450 () Unit!10014)

(assert (=> b!156290 (= lt!244450 lt!244462)))

(assert (=> b!156290 (= lt!244458 (readByteArrayLoop!0 (_2!7407 lt!244457) lt!244448 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2415 () (_ BitVec 64))

(assert (=> b!156290 (= (bitIndex!0 (size!3208 (buf!3711 (_2!7407 lt!244457))) (currentByte!6811 (_2!7407 lt!244457)) (currentBit!6806 (_2!7407 lt!244457))) (bvadd call!2415 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!244475 () Unit!10014)

(declare-fun Unit!10050 () Unit!10014)

(assert (=> b!156290 (= lt!244475 Unit!10050)))

(assert (=> b!156290 (= (bvadd (bitIndex!0 (size!3208 (buf!3711 (_2!7407 lt!244457))) (currentByte!6811 (_2!7407 lt!244457)) (currentBit!6806 (_2!7407 lt!244457))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3208 (buf!3711 (_2!7404 lt!244458))) (currentByte!6811 (_2!7404 lt!244458)) (currentBit!6806 (_2!7404 lt!244458))))))

(declare-fun lt!244456 () Unit!10014)

(declare-fun Unit!10051 () Unit!10014)

(assert (=> b!156290 (= lt!244456 Unit!10051)))

(assert (=> b!156290 (= (bvadd call!2415 (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3208 (buf!3711 (_2!7404 lt!244458))) (currentByte!6811 (_2!7404 lt!244458)) (currentBit!6806 (_2!7404 lt!244458))))))

(declare-fun lt!244443 () Unit!10014)

(declare-fun Unit!10052 () Unit!10014)

(assert (=> b!156290 (= lt!244443 Unit!10052)))

(assert (=> b!156290 (and (= (buf!3711 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3711 (_2!7404 lt!244458))) (= (size!3208 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153))) (size!3208 (_3!436 lt!244458))))))

(declare-fun lt!244468 () Unit!10014)

(declare-fun Unit!10053 () Unit!10014)

(assert (=> b!156290 (= lt!244468 Unit!10053)))

(declare-fun lt!244446 () Unit!10014)

(assert (=> b!156290 (= lt!244446 (arrayUpdatedAtPrefixLemma!34 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7407 lt!244457)))))

(assert (=> b!156290 (arrayRangesEq!423 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)) (array!7150 (store (arr!4058 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7407 lt!244457)) (size!3208 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!244463 () Unit!10014)

(assert (=> b!156290 (= lt!244463 lt!244446)))

(declare-fun lt!244476 () (_ BitVec 32))

(assert (=> b!156290 (= lt!244476 #b00000000000000000000000000000000)))

(declare-fun lt!244461 () Unit!10014)

(assert (=> b!156290 (= lt!244461 (arrayRangesEqTransitive!99 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)) lt!244448 (_3!436 lt!244458) lt!244476 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2416 () Bool)

(assert (=> b!156290 call!2416))

(declare-fun lt!244473 () Unit!10014)

(assert (=> b!156290 (= lt!244473 lt!244461)))

(declare-fun call!2417 () Bool)

(assert (=> b!156290 call!2417))

(declare-fun lt!244445 () Unit!10014)

(declare-fun Unit!10054 () Unit!10014)

(assert (=> b!156290 (= lt!244445 Unit!10054)))

(declare-fun lt!244455 () Unit!10014)

(assert (=> b!156290 (= lt!244455 (arrayRangesEqImpliesEq!43 lt!244448 (_3!436 lt!244458) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156290 (= (select (store (arr!4058 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7407 lt!244457)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4058 (_3!436 lt!244458)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!244471 () Unit!10014)

(assert (=> b!156290 (= lt!244471 lt!244455)))

(declare-fun lt!244464 () Bool)

(assert (=> b!156290 (= lt!244464 (= (select (arr!4058 (_3!436 lt!244458)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7407 lt!244457)))))

(declare-fun Unit!10057 () Unit!10014)

(assert (=> b!156290 (= lt!244477 Unit!10057)))

(assert (=> b!156290 lt!244464))

(declare-fun bm!2412 () Bool)

(assert (=> bm!2412 (= call!2415 (bitIndex!0 (size!3208 (buf!3711 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6811 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6806 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(declare-fun e!105548 () Bool)

(declare-fun b!156291 () Bool)

(assert (=> b!156291 (= e!105548 (arrayRangesEq!423 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)) (_3!436 lt!244442) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!156292 () Bool)

(declare-fun lt!244469 () Unit!10014)

(assert (=> b!156292 (= e!105546 (tuple3!639 lt!244469 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153))))))

(assert (=> b!156292 (= call!2415 call!2415)))

(declare-fun lt!244451 () Unit!10014)

(declare-fun Unit!10059 () Unit!10014)

(assert (=> b!156292 (= lt!244451 Unit!10059)))

(declare-fun lt!244467 () Unit!10014)

(assert (=> b!156292 (= lt!244467 (arrayRangesEqReflexiveLemma!35 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153))))))

(assert (=> b!156292 call!2417))

(declare-fun lt!244460 () Unit!10014)

(assert (=> b!156292 (= lt!244460 lt!244467)))

(declare-fun lt!244449 () array!7149)

(assert (=> b!156292 (= lt!244449 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)))))

(declare-fun lt!244470 () array!7149)

(assert (=> b!156292 (= lt!244470 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)))))

(declare-fun lt!244474 () (_ BitVec 32))

(assert (=> b!156292 (= lt!244474 #b00000000000000000000000000000000)))

(declare-fun lt!244452 () (_ BitVec 32))

(assert (=> b!156292 (= lt!244452 (size!3208 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153))))))

(declare-fun lt!244466 () (_ BitVec 32))

(assert (=> b!156292 (= lt!244466 #b00000000000000000000000000000000)))

(declare-fun lt!244447 () (_ BitVec 32))

(assert (=> b!156292 (= lt!244447 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!156292 (= lt!244469 (arrayRangesEqSlicedLemma!35 lt!244449 lt!244470 lt!244474 lt!244452 lt!244466 lt!244447))))

(assert (=> b!156292 call!2416))

(declare-fun c!8327 () Bool)

(declare-fun bm!2414 () Bool)

(assert (=> bm!2414 (= call!2416 (arrayRangesEq!423 (ite c!8327 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)) lt!244449) (ite c!8327 (_3!436 lt!244458) lt!244470) (ite c!8327 lt!244476 lt!244466) (ite c!8327 (bvadd #b00000000000000000000000000000001 from!240) lt!244447)))))

(declare-fun b!156293 () Bool)

(declare-fun res!130636 () Bool)

(assert (=> b!156293 (=> (not res!130636) (not e!105548))))

(assert (=> b!156293 (= res!130636 (and (= (buf!3711 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3711 (_2!7404 lt!244442))) (= (size!3208 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153))) (size!3208 (_3!436 lt!244442)))))))

(declare-fun bm!2413 () Bool)

(assert (=> bm!2413 (= call!2417 (arrayRangesEq!423 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)) (ite c!8327 (_3!436 lt!244458) (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153))) #b00000000000000000000000000000000 (ite c!8327 (bvadd #b00000000000000000000000000000001 from!240) (size!3208 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153))))))))

(declare-fun d!51954 () Bool)

(assert (=> d!51954 e!105547))

(declare-fun res!130635 () Bool)

(assert (=> d!51954 (=> res!130635 e!105547)))

(assert (=> d!51954 (= res!130635 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!244454 () Bool)

(assert (=> d!51954 (= lt!244454 e!105548)))

(declare-fun res!130637 () Bool)

(assert (=> d!51954 (=> (not res!130637) (not e!105548))))

(declare-fun lt!244459 () (_ BitVec 64))

(declare-fun lt!244472 () (_ BitVec 64))

(assert (=> d!51954 (= res!130637 (= (bvadd lt!244459 lt!244472) (bitIndex!0 (size!3208 (buf!3711 (_2!7404 lt!244442))) (currentByte!6811 (_2!7404 lt!244442)) (currentBit!6806 (_2!7404 lt!244442)))))))

(assert (=> d!51954 (or (not (= (bvand lt!244459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244472 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244459 lt!244472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!244444 () (_ BitVec 64))

(assert (=> d!51954 (= lt!244472 (bvmul lt!244444 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51954 (or (= lt!244444 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!244444 #b0000000000000000000000000000000000000000000000000000000000001000) lt!244444)))))

(assert (=> d!51954 (= lt!244444 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!51954 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!51954 (= lt!244459 (bitIndex!0 (size!3208 (buf!3711 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6811 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6806 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(assert (=> d!51954 (= lt!244442 e!105546)))

(assert (=> d!51954 (= c!8327 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51954 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3208 (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)))))))

(assert (=> d!51954 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7150 (store (arr!4058 arr!153) from!240 (_2!7398 (readBytePure!0 bs!65))) (size!3208 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!244442)))

(assert (= (and d!51954 c!8327) b!156290))

(assert (= (and d!51954 (not c!8327)) b!156292))

(assert (= (or b!156290 b!156292) bm!2414))

(assert (= (or b!156290 b!156292) bm!2413))

(assert (= (or b!156290 b!156292) bm!2412))

(assert (= (and d!51954 res!130637) b!156293))

(assert (= (and b!156293 res!130636) b!156291))

(assert (= (and d!51954 (not res!130635)) b!156289))

(declare-fun m!243445 () Bool)

(assert (=> bm!2414 m!243445))

(declare-fun m!243447 () Bool)

(assert (=> b!156291 m!243447))

(declare-fun m!243449 () Bool)

(assert (=> d!51954 m!243449))

(declare-fun m!243451 () Bool)

(assert (=> d!51954 m!243451))

(declare-fun m!243453 () Bool)

(assert (=> bm!2413 m!243453))

(declare-fun m!243455 () Bool)

(assert (=> b!156289 m!243455))

(assert (=> b!156289 m!243167))

(declare-fun m!243457 () Bool)

(assert (=> b!156289 m!243457))

(declare-fun m!243459 () Bool)

(assert (=> b!156292 m!243459))

(declare-fun m!243461 () Bool)

(assert (=> b!156292 m!243461))

(declare-fun m!243463 () Bool)

(assert (=> b!156290 m!243463))

(declare-fun m!243465 () Bool)

(assert (=> b!156290 m!243465))

(assert (=> b!156290 m!243167))

(declare-fun m!243467 () Bool)

(assert (=> b!156290 m!243467))

(declare-fun m!243469 () Bool)

(assert (=> b!156290 m!243469))

(declare-fun m!243471 () Bool)

(assert (=> b!156290 m!243471))

(declare-fun m!243473 () Bool)

(assert (=> b!156290 m!243473))

(assert (=> b!156290 m!243167))

(declare-fun m!243475 () Bool)

(assert (=> b!156290 m!243475))

(declare-fun m!243477 () Bool)

(assert (=> b!156290 m!243477))

(declare-fun m!243479 () Bool)

(assert (=> b!156290 m!243479))

(declare-fun m!243481 () Bool)

(assert (=> b!156290 m!243481))

(declare-fun m!243483 () Bool)

(assert (=> b!156290 m!243483))

(declare-fun m!243485 () Bool)

(assert (=> b!156290 m!243485))

(declare-fun m!243487 () Bool)

(assert (=> b!156290 m!243487))

(assert (=> bm!2412 m!243451))

(assert (=> d!51888 d!51954))

(declare-fun d!51956 () Bool)

(assert (=> d!51956 (= (remainingBits!0 ((_ sign_extend 32) (size!3208 (buf!3711 bs!65))) ((_ sign_extend 32) (currentByte!6811 bs!65)) ((_ sign_extend 32) (currentBit!6806 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3208 (buf!3711 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6811 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6806 bs!65)))))))

(assert (=> d!51884 d!51956))

(declare-fun d!51958 () Bool)

(assert (=> d!51958 (= (invariant!0 (currentBit!6806 bs!65) (currentByte!6811 bs!65) (size!3208 (buf!3711 bs!65))) (and (bvsge (currentBit!6806 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6806 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6811 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6811 bs!65) (size!3208 (buf!3711 bs!65))) (and (= (currentBit!6806 bs!65) #b00000000000000000000000000000000) (= (currentByte!6811 bs!65) (size!3208 (buf!3711 bs!65)))))))))

(assert (=> d!51880 d!51958))

(push 1)

(assert (not b!156292))

(assert (not b!156290))

(assert (not b!156289))

(assert (not bm!2414))

(assert (not b!156284))

(assert (not d!51952))

(assert (not b!156282))

(assert (not bm!2412))

(assert (not b!156281))

(assert (not b!156283))

(assert (not d!51934))

(assert (not bm!2411))

(assert (not bm!2410))

(assert (not d!51940))

(assert (not bm!2413))

(assert (not d!51954))

(assert (not b!156226))

(assert (not b!156291))

(assert (not bm!2409))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

