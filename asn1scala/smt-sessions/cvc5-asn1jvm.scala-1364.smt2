; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37770 () Bool)

(assert start!37770)

(declare-fun res!141900 () Bool)

(declare-fun e!119409 () Bool)

(assert (=> start!37770 (=> (not res!141900) (not e!119409))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37770 (= res!141900 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37770 e!119409))

(assert (=> start!37770 true))

(declare-datatypes ((array!9091 0))(
  ( (array!9092 (arr!4954 (Array (_ BitVec 32) (_ BitVec 8))) (size!4024 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7186 0))(
  ( (BitStream!7187 (buf!4467 array!9091) (currentByte!8472 (_ BitVec 32)) (currentBit!8467 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7186)

(declare-fun e!119408 () Bool)

(declare-fun inv!12 (BitStream!7186) Bool)

(assert (=> start!37770 (and (inv!12 bs!64) e!119408)))

(declare-fun lt!263685 () BitStream!7186)

(declare-fun e!119407 () Bool)

(declare-fun b!171056 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171056 (= e!119407 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4024 (buf!4467 lt!263685))) ((_ sign_extend 32) (currentByte!8472 lt!263685)) ((_ sign_extend 32) (currentBit!8467 lt!263685)) (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))))

(declare-fun b!171057 () Bool)

(declare-fun array_inv!3765 (array!9091) Bool)

(assert (=> b!171057 (= e!119408 (array_inv!3765 (buf!4467 bs!64)))))

(declare-fun b!171055 () Bool)

(assert (=> b!171055 (= e!119409 e!119407)))

(declare-fun res!141899 () Bool)

(assert (=> b!171055 (=> (not res!141899) (not e!119407))))

(assert (=> b!171055 (= res!141899 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))))))

(declare-fun withMovedBitIndex!0 (BitStream!7186 (_ BitVec 64)) BitStream!7186)

(assert (=> b!171055 (= lt!263685 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14702 0))(
  ( (tuple2!14703 (_1!7984 BitStream!7186) (_2!7984 Bool)) )
))
(declare-fun lt!263686 () tuple2!14702)

(declare-fun readBitPure!0 (BitStream!7186) tuple2!14702)

(assert (=> b!171055 (= lt!263686 (readBitPure!0 bs!64))))

(declare-fun lt!263687 () tuple2!14702)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7186 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14702)

(assert (=> b!171055 (= lt!263687 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171054 () Bool)

(declare-fun res!141898 () Bool)

(assert (=> b!171054 (=> (not res!141898) (not e!119409))))

(assert (=> b!171054 (= res!141898 (validate_offset_bits!1 ((_ sign_extend 32) (size!4024 (buf!4467 bs!64))) ((_ sign_extend 32) (currentByte!8472 bs!64)) ((_ sign_extend 32) (currentBit!8467 bs!64)) (bvsub nBits!283 from!235)))))

(assert (= (and start!37770 res!141900) b!171054))

(assert (= (and b!171054 res!141898) b!171055))

(assert (= (and b!171055 res!141899) b!171056))

(assert (= start!37770 b!171057))

(declare-fun m!270199 () Bool)

(assert (=> b!171054 m!270199))

(declare-fun m!270201 () Bool)

(assert (=> b!171056 m!270201))

(declare-fun m!270203 () Bool)

(assert (=> b!171055 m!270203))

(declare-fun m!270205 () Bool)

(assert (=> b!171055 m!270205))

(declare-fun m!270207 () Bool)

(assert (=> b!171055 m!270207))

(declare-fun m!270209 () Bool)

(assert (=> b!171057 m!270209))

(declare-fun m!270211 () Bool)

(assert (=> start!37770 m!270211))

(push 1)

(assert (not b!171055))

(assert (not b!171056))

(assert (not b!171057))

(assert (not start!37770))

(assert (not b!171054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60433 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60433 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4024 (buf!4467 lt!263685))) ((_ sign_extend 32) (currentByte!8472 lt!263685)) ((_ sign_extend 32) (currentBit!8467 lt!263685)) (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4024 (buf!4467 lt!263685))) ((_ sign_extend 32) (currentByte!8472 lt!263685)) ((_ sign_extend 32) (currentBit!8467 lt!263685))) (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))))))

(declare-fun bs!15046 () Bool)

(assert (= bs!15046 d!60433))

(declare-fun m!270241 () Bool)

(assert (=> bs!15046 m!270241))

(assert (=> b!171056 d!60433))

(declare-fun d!60435 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60435 (= (inv!12 bs!64) (invariant!0 (currentBit!8467 bs!64) (currentByte!8472 bs!64) (size!4024 (buf!4467 bs!64))))))

(declare-fun bs!15047 () Bool)

(assert (= bs!15047 d!60435))

(declare-fun m!270243 () Bool)

(assert (=> bs!15047 m!270243))

(assert (=> start!37770 d!60435))

(declare-fun d!60437 () Bool)

(assert (=> d!60437 (= (array_inv!3765 (buf!4467 bs!64)) (bvsge (size!4024 (buf!4467 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!171057 d!60437))

(declare-fun d!60439 () Bool)

(assert (=> d!60439 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4024 (buf!4467 bs!64))) ((_ sign_extend 32) (currentByte!8472 bs!64)) ((_ sign_extend 32) (currentBit!8467 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4024 (buf!4467 bs!64))) ((_ sign_extend 32) (currentByte!8472 bs!64)) ((_ sign_extend 32) (currentBit!8467 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15048 () Bool)

(assert (= bs!15048 d!60439))

(declare-fun m!270245 () Bool)

(assert (=> bs!15048 m!270245))

(assert (=> b!171054 d!60439))

(declare-fun d!60441 () Bool)

(declare-fun e!119437 () Bool)

(assert (=> d!60441 e!119437))

(declare-fun res!141921 () Bool)

(assert (=> d!60441 (=> (not res!141921) (not e!119437))))

(declare-fun lt!263711 () (_ BitVec 64))

(declare-fun lt!263710 () BitStream!7186)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!60441 (= res!141921 (= (bvadd lt!263711 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4024 (buf!4467 lt!263710)) (currentByte!8472 lt!263710) (currentBit!8467 lt!263710))))))

(assert (=> d!60441 (or (not (= (bvand lt!263711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263711 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60441 (= lt!263711 (bitIndex!0 (size!4024 (buf!4467 bs!64)) (currentByte!8472 bs!64) (currentBit!8467 bs!64)))))

(declare-datatypes ((Unit!12219 0))(
  ( (Unit!12220) )
))
(declare-datatypes ((tuple2!14708 0))(
  ( (tuple2!14709 (_1!7987 Unit!12219) (_2!7987 BitStream!7186)) )
))
(declare-fun moveBitIndex!0 (BitStream!7186 (_ BitVec 64)) tuple2!14708)

(assert (=> d!60441 (= lt!263710 (_2!7987 (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7186 (_ BitVec 64)) Bool)

(assert (=> d!60441 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!60441 (= (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) lt!263710)))

(declare-fun b!171084 () Bool)

(assert (=> b!171084 (= e!119437 (= (size!4024 (buf!4467 bs!64)) (size!4024 (buf!4467 lt!263710))))))

(assert (= (and d!60441 res!141921) b!171084))

(declare-fun m!270255 () Bool)

(assert (=> d!60441 m!270255))

(declare-fun m!270257 () Bool)

(assert (=> d!60441 m!270257))

(declare-fun m!270259 () Bool)

(assert (=> d!60441 m!270259))

(declare-fun m!270261 () Bool)

(assert (=> d!60441 m!270261))

(assert (=> b!171055 d!60441))

(declare-fun d!60457 () Bool)

(declare-datatypes ((tuple2!14710 0))(
  ( (tuple2!14711 (_1!7988 Bool) (_2!7988 BitStream!7186)) )
))
(declare-fun lt!263714 () tuple2!14710)

(declare-fun readBit!0 (BitStream!7186) tuple2!14710)

(assert (=> d!60457 (= lt!263714 (readBit!0 bs!64))))

(assert (=> d!60457 (= (readBitPure!0 bs!64) (tuple2!14703 (_2!7988 lt!263714) (_1!7988 lt!263714)))))

(declare-fun bs!15053 () Bool)

(assert (= bs!15053 d!60457))

(declare-fun m!270263 () Bool)

(assert (=> bs!15053 m!270263))

(assert (=> b!171055 d!60457))

(declare-fun d!60459 () Bool)

(declare-fun lt!263721 () tuple2!14710)

(declare-fun checkBitsLoop!0 (BitStream!7186 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14710)

(assert (=> d!60459 (= lt!263721 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60459 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14703 (_2!7988 lt!263721) (_1!7988 lt!263721)))))

(declare-fun bs!15054 () Bool)

(assert (= bs!15054 d!60459))

(declare-fun m!270265 () Bool)

(assert (=> bs!15054 m!270265))

(assert (=> b!171055 d!60459))

(push 1)

(assert (not d!60459))

(assert (not d!60439))

(assert (not d!60433))

(assert (not d!60441))

(assert (not d!60435))

(assert (not d!60457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!171205 () Bool)

(declare-fun e!119525 () tuple2!14710)

(assert (=> b!171205 (= e!119525 (tuple2!14711 true bs!64))))

(declare-fun lt!263968 () tuple2!14710)

(declare-fun lt!263972 () tuple2!14710)

(declare-fun b!171206 () Bool)

(assert (=> b!171206 (= lt!263972 (checkBitsLoop!0 (_2!7988 lt!263968) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!263964 () Unit!12219)

(declare-fun lt!263963 () Unit!12219)

(assert (=> b!171206 (= lt!263964 lt!263963)))

(declare-fun lt!263966 () (_ BitVec 64))

(declare-fun lt!263969 () (_ BitVec 64))

(assert (=> b!171206 (validate_offset_bits!1 ((_ sign_extend 32) (size!4024 (buf!4467 (_2!7988 lt!263968)))) ((_ sign_extend 32) (currentByte!8472 (_2!7988 lt!263968))) ((_ sign_extend 32) (currentBit!8467 (_2!7988 lt!263968))) (bvsub lt!263966 lt!263969))))

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!7186 BitStream!7186 (_ BitVec 64) (_ BitVec 64)) Unit!12219)

(assert (=> b!171206 (= lt!263963 (validateOffsetBitsIneqLemma!0 bs!64 (_2!7988 lt!263968) lt!263966 lt!263969))))

(assert (=> b!171206 (= lt!263969 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171206 (= lt!263966 (bvsub nBits!283 from!235))))

(declare-fun e!119526 () tuple2!14710)

(assert (=> b!171206 (= e!119526 (tuple2!14711 (_1!7988 lt!263972) (_2!7988 lt!263972)))))

(declare-fun b!171208 () Bool)

(declare-fun res!142009 () Bool)

(declare-fun e!119527 () Bool)

(assert (=> b!171208 (=> (not res!142009) (not e!119527))))

(declare-fun e!119528 () Bool)

(assert (=> b!171208 (= res!142009 e!119528)))

(declare-fun res!142012 () Bool)

(assert (=> b!171208 (=> res!142012 e!119528)))

(declare-fun lt!263962 () tuple2!14710)

(assert (=> b!171208 (= res!142012 (not (_1!7988 lt!263962)))))

(declare-fun lt!263967 () (_ BitVec 64))

(declare-fun b!171209 () Bool)

(assert (=> b!171209 (= e!119528 (= (bvsub lt!263967 from!235) (bitIndex!0 (size!4024 (buf!4467 (_2!7988 lt!263962))) (currentByte!8472 (_2!7988 lt!263962)) (currentBit!8467 (_2!7988 lt!263962)))))))

(assert (=> b!171209 (or (= (bvand lt!263967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263967 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263971 () (_ BitVec 64))

(assert (=> b!171209 (= lt!263967 (bvadd lt!263971 nBits!283))))

(assert (=> b!171209 (or (not (= (bvand lt!263971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263971 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171209 (= lt!263971 (bitIndex!0 (size!4024 (buf!4467 bs!64)) (currentByte!8472 bs!64) (currentBit!8467 bs!64)))))

(declare-fun b!171210 () Bool)

(assert (=> b!171210 (= e!119526 (tuple2!14711 false (_2!7988 lt!263968)))))

(declare-fun b!171211 () Bool)

(declare-fun res!142010 () Bool)

(assert (=> b!171211 (=> (not res!142010) (not e!119527))))

(assert (=> b!171211 (= res!142010 (and (= (buf!4467 bs!64) (buf!4467 (_2!7988 lt!263962))) (or (not (= nBits!283 from!235)) (_1!7988 lt!263962))))))

(declare-fun b!171212 () Bool)

(declare-fun e!119524 () Bool)

(assert (=> b!171212 (= e!119527 e!119524)))

(declare-fun res!142011 () Bool)

(assert (=> b!171212 (=> res!142011 e!119524)))

(assert (=> b!171212 (= res!142011 (or (not (_1!7988 lt!263962)) (bvsge from!235 nBits!283)))))

(declare-fun b!171213 () Bool)

(assert (=> b!171213 (= e!119524 (= expected!82 (_2!7984 (readBitPure!0 bs!64))))))

(declare-fun d!60515 () Bool)

(assert (=> d!60515 e!119527))

(declare-fun res!142008 () Bool)

(assert (=> d!60515 (=> (not res!142008) (not e!119527))))

(declare-fun lt!263965 () (_ BitVec 64))

(assert (=> d!60515 (= res!142008 (bvsge (bvsub lt!263965 from!235) (bitIndex!0 (size!4024 (buf!4467 (_2!7988 lt!263962))) (currentByte!8472 (_2!7988 lt!263962)) (currentBit!8467 (_2!7988 lt!263962)))))))

(assert (=> d!60515 (or (= (bvand lt!263965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263965 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263970 () (_ BitVec 64))

(assert (=> d!60515 (= lt!263965 (bvadd lt!263970 nBits!283))))

(assert (=> d!60515 (or (not (= (bvand lt!263970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263970 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60515 (= lt!263970 (bitIndex!0 (size!4024 (buf!4467 bs!64)) (currentByte!8472 bs!64) (currentBit!8467 bs!64)))))

(assert (=> d!60515 (= lt!263962 e!119525)))

(declare-fun c!8966 () Bool)

(assert (=> d!60515 (= c!8966 (= from!235 nBits!283))))

(assert (=> d!60515 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60515 (= (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235) lt!263962)))

(declare-fun b!171207 () Bool)

(assert (=> b!171207 (= e!119525 e!119526)))

(assert (=> b!171207 (= lt!263968 (readBit!0 bs!64))))

(declare-fun c!8967 () Bool)

(assert (=> b!171207 (= c!8967 (not (= (_1!7988 lt!263968) expected!82)))))

(assert (= (and d!60515 c!8966) b!171205))

(assert (= (and d!60515 (not c!8966)) b!171207))

(assert (= (and b!171207 c!8967) b!171210))

(assert (= (and b!171207 (not c!8967)) b!171206))

(assert (= (and d!60515 res!142008) b!171211))

(assert (= (and b!171211 res!142010) b!171208))

(assert (= (and b!171208 (not res!142012)) b!171209))

(assert (= (and b!171208 res!142009) b!171212))

(assert (= (and b!171212 (not res!142011)) b!171213))

(assert (=> b!171207 m!270263))

(declare-fun m!270343 () Bool)

(assert (=> d!60515 m!270343))

(assert (=> d!60515 m!270257))

(declare-fun m!270345 () Bool)

(assert (=> b!171206 m!270345))

(declare-fun m!270347 () Bool)

(assert (=> b!171206 m!270347))

(declare-fun m!270349 () Bool)

(assert (=> b!171206 m!270349))

(assert (=> b!171209 m!270343))

(assert (=> b!171209 m!270257))

(assert (=> b!171213 m!270205))

(assert (=> d!60459 d!60515))

(declare-fun d!60517 () Bool)

(declare-fun e!119535 () Bool)

(assert (=> d!60517 e!119535))

(declare-fun res!142015 () Bool)

(assert (=> d!60517 (=> (not res!142015) (not e!119535))))

(declare-fun increaseBitIndex!0 (BitStream!7186) tuple2!14708)

(assert (=> d!60517 (= res!142015 (= (buf!4467 (_2!7987 (increaseBitIndex!0 bs!64))) (buf!4467 bs!64)))))

(declare-fun lt!263993 () Bool)

(assert (=> d!60517 (= lt!263993 (not (= (bvand ((_ sign_extend 24) (select (arr!4954 (buf!4467 bs!64)) (currentByte!8472 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8467 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263991 () tuple2!14710)

(assert (=> d!60517 (= lt!263991 (tuple2!14711 (not (= (bvand ((_ sign_extend 24) (select (arr!4954 (buf!4467 bs!64)) (currentByte!8472 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8467 bs!64)))) #b00000000000000000000000000000000)) (_2!7987 (increaseBitIndex!0 bs!64))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!60517 (validate_offset_bit!0 ((_ sign_extend 32) (size!4024 (buf!4467 bs!64))) ((_ sign_extend 32) (currentByte!8472 bs!64)) ((_ sign_extend 32) (currentBit!8467 bs!64)))))

(assert (=> d!60517 (= (readBit!0 bs!64) lt!263991)))

(declare-fun lt!263992 () (_ BitVec 64))

(declare-fun b!171216 () Bool)

(declare-fun lt!263988 () (_ BitVec 64))

(assert (=> b!171216 (= e!119535 (= (bitIndex!0 (size!4024 (buf!4467 (_2!7987 (increaseBitIndex!0 bs!64)))) (currentByte!8472 (_2!7987 (increaseBitIndex!0 bs!64))) (currentBit!8467 (_2!7987 (increaseBitIndex!0 bs!64)))) (bvadd lt!263992 lt!263988)))))

(assert (=> b!171216 (or (not (= (bvand lt!263992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263988 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263992 lt!263988) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171216 (= lt!263988 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171216 (= lt!263992 (bitIndex!0 (size!4024 (buf!4467 bs!64)) (currentByte!8472 bs!64) (currentBit!8467 bs!64)))))

(declare-fun lt!263990 () Bool)

(assert (=> b!171216 (= lt!263990 (not (= (bvand ((_ sign_extend 24) (select (arr!4954 (buf!4467 bs!64)) (currentByte!8472 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8467 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263989 () Bool)

(assert (=> b!171216 (= lt!263989 (not (= (bvand ((_ sign_extend 24) (select (arr!4954 (buf!4467 bs!64)) (currentByte!8472 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8467 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263987 () Bool)

(assert (=> b!171216 (= lt!263987 (not (= (bvand ((_ sign_extend 24) (select (arr!4954 (buf!4467 bs!64)) (currentByte!8472 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8467 bs!64)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60517 res!142015) b!171216))

(declare-fun m!270351 () Bool)

(assert (=> d!60517 m!270351))

(declare-fun m!270353 () Bool)

(assert (=> d!60517 m!270353))

(declare-fun m!270355 () Bool)

(assert (=> d!60517 m!270355))

(declare-fun m!270357 () Bool)

(assert (=> d!60517 m!270357))

(assert (=> b!171216 m!270355))

(assert (=> b!171216 m!270353))

(assert (=> b!171216 m!270351))

(assert (=> b!171216 m!270257))

(declare-fun m!270359 () Bool)

(assert (=> b!171216 m!270359))

(assert (=> d!60457 d!60517))

(declare-fun d!60519 () Bool)

(assert (=> d!60519 (= (remainingBits!0 ((_ sign_extend 32) (size!4024 (buf!4467 bs!64))) ((_ sign_extend 32) (currentByte!8472 bs!64)) ((_ sign_extend 32) (currentBit!8467 bs!64))) (bvsub (bvmul ((_ sign_extend 32) (size!4024 (buf!4467 bs!64))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8472 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8467 bs!64)))))))

(assert (=> d!60439 d!60519))

(declare-fun d!60521 () Bool)

(declare-fun e!119538 () Bool)

(assert (=> d!60521 e!119538))

(declare-fun res!142020 () Bool)

(assert (=> d!60521 (=> (not res!142020) (not e!119538))))

(declare-fun lt!264009 () (_ BitVec 64))

(declare-fun lt!264007 () (_ BitVec 64))

(declare-fun lt!264010 () (_ BitVec 64))

(assert (=> d!60521 (= res!142020 (= lt!264010 (bvsub lt!264009 lt!264007)))))

(assert (=> d!60521 (or (= (bvand lt!264009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264009 lt!264007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60521 (= lt!264007 (remainingBits!0 ((_ sign_extend 32) (size!4024 (buf!4467 lt!263710))) ((_ sign_extend 32) (currentByte!8472 lt!263710)) ((_ sign_extend 32) (currentBit!8467 lt!263710))))))

(declare-fun lt!264006 () (_ BitVec 64))

(declare-fun lt!264008 () (_ BitVec 64))

(assert (=> d!60521 (= lt!264009 (bvmul lt!264006 lt!264008))))

(assert (=> d!60521 (or (= lt!264006 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264008 (bvsdiv (bvmul lt!264006 lt!264008) lt!264006)))))

(assert (=> d!60521 (= lt!264008 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60521 (= lt!264006 ((_ sign_extend 32) (size!4024 (buf!4467 lt!263710))))))

(assert (=> d!60521 (= lt!264010 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8472 lt!263710)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8467 lt!263710))))))

(assert (=> d!60521 (invariant!0 (currentBit!8467 lt!263710) (currentByte!8472 lt!263710) (size!4024 (buf!4467 lt!263710)))))

(assert (=> d!60521 (= (bitIndex!0 (size!4024 (buf!4467 lt!263710)) (currentByte!8472 lt!263710) (currentBit!8467 lt!263710)) lt!264010)))

(declare-fun b!171221 () Bool)

(declare-fun res!142021 () Bool)

(assert (=> b!171221 (=> (not res!142021) (not e!119538))))

(assert (=> b!171221 (= res!142021 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264010))))

(declare-fun b!171222 () Bool)

(declare-fun lt!264011 () (_ BitVec 64))

(assert (=> b!171222 (= e!119538 (bvsle lt!264010 (bvmul lt!264011 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171222 (or (= lt!264011 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264011 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264011)))))

(assert (=> b!171222 (= lt!264011 ((_ sign_extend 32) (size!4024 (buf!4467 lt!263710))))))

(assert (= (and d!60521 res!142020) b!171221))

(assert (= (and b!171221 res!142021) b!171222))

(declare-fun m!270361 () Bool)

(assert (=> d!60521 m!270361))

(declare-fun m!270363 () Bool)

(assert (=> d!60521 m!270363))

(assert (=> d!60441 d!60521))

(declare-fun d!60523 () Bool)

(declare-fun e!119539 () Bool)

(assert (=> d!60523 e!119539))

(declare-fun res!142022 () Bool)

(assert (=> d!60523 (=> (not res!142022) (not e!119539))))

(declare-fun lt!264013 () (_ BitVec 64))

(declare-fun lt!264015 () (_ BitVec 64))

(declare-fun lt!264016 () (_ BitVec 64))

(assert (=> d!60523 (= res!142022 (= lt!264016 (bvsub lt!264015 lt!264013)))))

(assert (=> d!60523 (or (= (bvand lt!264015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!264013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!264015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!264015 lt!264013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60523 (= lt!264013 (remainingBits!0 ((_ sign_extend 32) (size!4024 (buf!4467 bs!64))) ((_ sign_extend 32) (currentByte!8472 bs!64)) ((_ sign_extend 32) (currentBit!8467 bs!64))))))

(declare-fun lt!264012 () (_ BitVec 64))

(declare-fun lt!264014 () (_ BitVec 64))

(assert (=> d!60523 (= lt!264015 (bvmul lt!264012 lt!264014))))

(assert (=> d!60523 (or (= lt!264012 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!264014 (bvsdiv (bvmul lt!264012 lt!264014) lt!264012)))))

(assert (=> d!60523 (= lt!264014 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60523 (= lt!264012 ((_ sign_extend 32) (size!4024 (buf!4467 bs!64))))))

(assert (=> d!60523 (= lt!264016 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8472 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8467 bs!64))))))

(assert (=> d!60523 (invariant!0 (currentBit!8467 bs!64) (currentByte!8472 bs!64) (size!4024 (buf!4467 bs!64)))))

(assert (=> d!60523 (= (bitIndex!0 (size!4024 (buf!4467 bs!64)) (currentByte!8472 bs!64) (currentBit!8467 bs!64)) lt!264016)))

(declare-fun b!171223 () Bool)

(declare-fun res!142023 () Bool)

(assert (=> b!171223 (=> (not res!142023) (not e!119539))))

(assert (=> b!171223 (= res!142023 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264016))))

(declare-fun b!171224 () Bool)

(declare-fun lt!264017 () (_ BitVec 64))

(assert (=> b!171224 (= e!119539 (bvsle lt!264016 (bvmul lt!264017 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171224 (or (= lt!264017 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!264017 #b0000000000000000000000000000000000000000000000000000000000001000) lt!264017)))))

(assert (=> b!171224 (= lt!264017 ((_ sign_extend 32) (size!4024 (buf!4467 bs!64))))))

(assert (= (and d!60523 res!142022) b!171223))

(assert (= (and b!171223 res!142023) b!171224))

(assert (=> d!60523 m!270245))

(assert (=> d!60523 m!270243))

(assert (=> d!60441 d!60523))

(declare-fun d!60525 () Bool)

(declare-fun lt!264030 () (_ BitVec 32))

(assert (=> d!60525 (= lt!264030 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!264035 () (_ BitVec 32))

(assert (=> d!60525 (= lt!264035 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!119544 () Bool)

(assert (=> d!60525 e!119544))

(declare-fun res!142029 () Bool)

(assert (=> d!60525 (=> (not res!142029) (not e!119544))))

(assert (=> d!60525 (= res!142029 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!12237 () Unit!12219)

(declare-fun Unit!12238 () Unit!12219)

(declare-fun Unit!12239 () Unit!12219)

(assert (=> d!60525 (= (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!8467 bs!64) lt!264030) #b00000000000000000000000000000000) (tuple2!14709 Unit!12237 (BitStream!7187 (buf!4467 bs!64) (bvsub (bvadd (currentByte!8472 bs!64) lt!264035) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!264030 (currentBit!8467 bs!64)))) (ite (bvsge (bvadd (currentBit!8467 bs!64) lt!264030) #b00000000000000000000000000001000) (tuple2!14709 Unit!12238 (BitStream!7187 (buf!4467 bs!64) (bvadd (currentByte!8472 bs!64) lt!264035 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8467 bs!64) lt!264030) #b00000000000000000000000000001000))) (tuple2!14709 Unit!12239 (BitStream!7187 (buf!4467 bs!64) (bvadd (currentByte!8472 bs!64) lt!264035) (bvadd (currentBit!8467 bs!64) lt!264030))))))))

(declare-fun b!171229 () Bool)

(declare-fun e!119545 () Bool)

(assert (=> b!171229 (= e!119544 e!119545)))

(declare-fun res!142028 () Bool)

(assert (=> b!171229 (=> (not res!142028) (not e!119545))))

(declare-fun lt!264033 () (_ BitVec 64))

(declare-fun lt!264034 () tuple2!14708)

(assert (=> b!171229 (= res!142028 (= (bvadd lt!264033 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4024 (buf!4467 (_2!7987 lt!264034))) (currentByte!8472 (_2!7987 lt!264034)) (currentBit!8467 (_2!7987 lt!264034)))))))

(assert (=> b!171229 (or (not (= (bvand lt!264033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!264033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!264033 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171229 (= lt!264033 (bitIndex!0 (size!4024 (buf!4467 bs!64)) (currentByte!8472 bs!64) (currentBit!8467 bs!64)))))

(declare-fun lt!264031 () (_ BitVec 32))

(declare-fun lt!264032 () (_ BitVec 32))

(declare-fun Unit!12240 () Unit!12219)

(declare-fun Unit!12241 () Unit!12219)

(declare-fun Unit!12242 () Unit!12219)

(assert (=> b!171229 (= lt!264034 (ite (bvslt (bvadd (currentBit!8467 bs!64) lt!264031) #b00000000000000000000000000000000) (tuple2!14709 Unit!12240 (BitStream!7187 (buf!4467 bs!64) (bvsub (bvadd (currentByte!8472 bs!64) lt!264032) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!264031 (currentBit!8467 bs!64)))) (ite (bvsge (bvadd (currentBit!8467 bs!64) lt!264031) #b00000000000000000000000000001000) (tuple2!14709 Unit!12241 (BitStream!7187 (buf!4467 bs!64) (bvadd (currentByte!8472 bs!64) lt!264032 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8467 bs!64) lt!264031) #b00000000000000000000000000001000))) (tuple2!14709 Unit!12242 (BitStream!7187 (buf!4467 bs!64) (bvadd (currentByte!8472 bs!64) lt!264032) (bvadd (currentBit!8467 bs!64) lt!264031))))))))

(assert (=> b!171229 (= lt!264031 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171229 (= lt!264032 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!171230 () Bool)

(assert (=> b!171230 (= e!119545 (and (= (size!4024 (buf!4467 bs!64)) (size!4024 (buf!4467 (_2!7987 lt!264034)))) (= (buf!4467 bs!64) (buf!4467 (_2!7987 lt!264034)))))))

(assert (= (and d!60525 res!142029) b!171229))

(assert (= (and b!171229 res!142028) b!171230))

(assert (=> d!60525 m!270261))

(declare-fun m!270365 () Bool)

(assert (=> b!171229 m!270365))

(assert (=> b!171229 m!270257))

(assert (=> d!60441 d!60525))

(declare-fun d!60529 () Bool)

(declare-fun res!142032 () Bool)

(declare-fun e!119548 () Bool)

(assert (=> d!60529 (=> (not res!142032) (not e!119548))))

(assert (=> d!60529 (= res!142032 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4024 (buf!4467 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4024 (buf!4467 bs!64)))))))))

(assert (=> d!60529 (= (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) e!119548)))

(declare-fun b!171234 () Bool)

(declare-fun lt!264038 () (_ BitVec 64))

(assert (=> b!171234 (= e!119548 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!264038) (bvsle lt!264038 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4024 (buf!4467 bs!64)))))))))

(assert (=> b!171234 (= lt!264038 (bvadd (bitIndex!0 (size!4024 (buf!4467 bs!64)) (currentByte!8472 bs!64) (currentBit!8467 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!60529 res!142032) b!171234))

(assert (=> b!171234 m!270257))

(assert (=> d!60441 d!60529))

(declare-fun d!60531 () Bool)

(assert (=> d!60531 (= (invariant!0 (currentBit!8467 bs!64) (currentByte!8472 bs!64) (size!4024 (buf!4467 bs!64))) (and (bvsge (currentBit!8467 bs!64) #b00000000000000000000000000000000) (bvslt (currentBit!8467 bs!64) #b00000000000000000000000000001000) (bvsge (currentByte!8472 bs!64) #b00000000000000000000000000000000) (or (bvslt (currentByte!8472 bs!64) (size!4024 (buf!4467 bs!64))) (and (= (currentBit!8467 bs!64) #b00000000000000000000000000000000) (= (currentByte!8472 bs!64) (size!4024 (buf!4467 bs!64)))))))))

(assert (=> d!60435 d!60531))

(declare-fun d!60533 () Bool)

(assert (=> d!60533 (= (remainingBits!0 ((_ sign_extend 32) (size!4024 (buf!4467 lt!263685))) ((_ sign_extend 32) (currentByte!8472 lt!263685)) ((_ sign_extend 32) (currentBit!8467 lt!263685))) (bvsub (bvmul ((_ sign_extend 32) (size!4024 (buf!4467 lt!263685))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8472 lt!263685)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8467 lt!263685)))))))

(assert (=> d!60433 d!60533))

(push 1)

(assert (not b!171206))

(assert (not d!60525))

(assert (not b!171213))

(assert (not d!60515))

(assert (not d!60523))

(assert (not b!171229))

(assert (not d!60517))

(assert (not b!171209))

(assert (not b!171216))

(assert (not b!171234))

(assert (not d!60521))

(assert (not b!171207))

(check-sat)

(pop 1)

(push 1)

(check-sat)

