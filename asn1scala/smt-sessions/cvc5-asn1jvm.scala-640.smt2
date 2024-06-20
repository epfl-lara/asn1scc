; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17938 () Bool)

(assert start!17938)

(declare-fun b!88238 () Bool)

(declare-fun e!58412 () Bool)

(declare-fun e!58413 () Bool)

(assert (=> b!88238 (= e!58412 e!58413)))

(declare-fun res!72637 () Bool)

(assert (=> b!88238 (=> (not res!72637) (not e!58413))))

(declare-fun lt!136013 () (_ BitVec 64))

(declare-fun lt!136010 () (_ BitVec 64))

(assert (=> b!88238 (= res!72637 (= lt!136013 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136010)))))

(declare-datatypes ((array!4155 0))(
  ( (array!4156 (arr!2514 (Array (_ BitVec 32) (_ BitVec 8))) (size!1877 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3316 0))(
  ( (BitStream!3317 (buf!2267 array!4155) (currentByte!4491 (_ BitVec 32)) (currentBit!4486 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5773 0))(
  ( (Unit!5774) )
))
(declare-datatypes ((tuple2!7450 0))(
  ( (tuple2!7451 (_1!3958 Unit!5773) (_2!3958 BitStream!3316)) )
))
(declare-fun lt!136012 () tuple2!7450)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88238 (= lt!136013 (bitIndex!0 (size!1877 (buf!2267 (_2!3958 lt!136012))) (currentByte!4491 (_2!3958 lt!136012)) (currentBit!4486 (_2!3958 lt!136012))))))

(declare-fun b!88239 () Bool)

(declare-fun res!72631 () Bool)

(declare-fun e!58411 () Bool)

(assert (=> b!88239 (=> (not res!72631) (not e!58411))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88239 (= res!72631 (bvslt i!576 nBits!336))))

(declare-fun b!88240 () Bool)

(declare-fun e!58415 () Bool)

(assert (=> b!88240 (= e!58413 e!58415)))

(declare-fun res!72643 () Bool)

(assert (=> b!88240 (=> (not res!72643) (not e!58415))))

(declare-datatypes ((tuple2!7452 0))(
  ( (tuple2!7453 (_1!3959 BitStream!3316) (_2!3959 Bool)) )
))
(declare-fun lt!136011 () tuple2!7452)

(declare-fun lt!136014 () Bool)

(assert (=> b!88240 (= res!72643 (and (= (_2!3959 lt!136011) lt!136014) (= (_1!3959 lt!136011) (_2!3958 lt!136012))))))

(declare-fun thiss!1152 () BitStream!3316)

(declare-fun readBitPure!0 (BitStream!3316) tuple2!7452)

(declare-fun readerFrom!0 (BitStream!3316 (_ BitVec 32) (_ BitVec 32)) BitStream!3316)

(assert (=> b!88240 (= lt!136011 (readBitPure!0 (readerFrom!0 (_2!3958 lt!136012) (currentBit!4486 thiss!1152) (currentByte!4491 thiss!1152))))))

(declare-fun b!88241 () Bool)

(declare-fun res!72632 () Bool)

(declare-fun e!58416 () Bool)

(assert (=> b!88241 (=> (not res!72632) (not e!58416))))

(declare-fun thiss!1151 () BitStream!3316)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88241 (= res!72632 (validate_offset_bits!1 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1151))) ((_ sign_extend 32) (currentByte!4491 thiss!1151)) ((_ sign_extend 32) (currentBit!4486 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88242 () Bool)

(declare-fun res!72640 () Bool)

(assert (=> b!88242 (=> (not res!72640) (not e!58416))))

(assert (=> b!88242 (= res!72640 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88243 () Bool)

(assert (=> b!88243 (= e!58416 e!58411)))

(declare-fun res!72635 () Bool)

(assert (=> b!88243 (=> (not res!72635) (not e!58411))))

(declare-fun lt!136009 () (_ BitVec 64))

(assert (=> b!88243 (= res!72635 (= lt!136010 (bvadd lt!136009 ((_ sign_extend 32) i!576))))))

(assert (=> b!88243 (= lt!136010 (bitIndex!0 (size!1877 (buf!2267 thiss!1152)) (currentByte!4491 thiss!1152) (currentBit!4486 thiss!1152)))))

(assert (=> b!88243 (= lt!136009 (bitIndex!0 (size!1877 (buf!2267 thiss!1151)) (currentByte!4491 thiss!1151) (currentBit!4486 thiss!1151)))))

(declare-fun b!88244 () Bool)

(declare-fun res!72639 () Bool)

(assert (=> b!88244 (=> (not res!72639) (not e!58411))))

(assert (=> b!88244 (= res!72639 (validate_offset_bits!1 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1152))) ((_ sign_extend 32) (currentByte!4491 thiss!1152)) ((_ sign_extend 32) (currentBit!4486 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88246 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88246 (= e!58411 (not (invariant!0 (currentBit!4486 (_2!3958 lt!136012)) (currentByte!4491 (_2!3958 lt!136012)) (size!1877 (buf!2267 (_2!3958 lt!136012))))))))

(assert (=> b!88246 e!58412))

(declare-fun res!72641 () Bool)

(assert (=> b!88246 (=> (not res!72641) (not e!58412))))

(assert (=> b!88246 (= res!72641 (= (size!1877 (buf!2267 thiss!1152)) (size!1877 (buf!2267 (_2!3958 lt!136012)))))))

(declare-fun appendBit!0 (BitStream!3316 Bool) tuple2!7450)

(assert (=> b!88246 (= lt!136012 (appendBit!0 thiss!1152 lt!136014))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!88246 (= lt!136014 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88247 () Bool)

(declare-fun e!58414 () Bool)

(declare-fun array_inv!1723 (array!4155) Bool)

(assert (=> b!88247 (= e!58414 (array_inv!1723 (buf!2267 thiss!1152)))))

(declare-fun b!88248 () Bool)

(declare-fun res!72642 () Bool)

(assert (=> b!88248 (=> (not res!72642) (not e!58413))))

(declare-fun isPrefixOf!0 (BitStream!3316 BitStream!3316) Bool)

(assert (=> b!88248 (= res!72642 (isPrefixOf!0 thiss!1152 (_2!3958 lt!136012)))))

(declare-fun b!88249 () Bool)

(declare-fun e!58408 () Bool)

(assert (=> b!88249 (= e!58408 (array_inv!1723 (buf!2267 thiss!1151)))))

(declare-fun b!88250 () Bool)

(assert (=> b!88250 (= e!58415 (= (bitIndex!0 (size!1877 (buf!2267 (_1!3959 lt!136011))) (currentByte!4491 (_1!3959 lt!136011)) (currentBit!4486 (_1!3959 lt!136011))) lt!136013))))

(declare-fun b!88251 () Bool)

(declare-fun res!72634 () Bool)

(assert (=> b!88251 (=> (not res!72634) (not e!58416))))

(assert (=> b!88251 (= res!72634 (invariant!0 (currentBit!4486 thiss!1152) (currentByte!4491 thiss!1152) (size!1877 (buf!2267 thiss!1152))))))

(declare-fun b!88252 () Bool)

(declare-fun res!72636 () Bool)

(assert (=> b!88252 (=> (not res!72636) (not e!58416))))

(assert (=> b!88252 (= res!72636 (invariant!0 (currentBit!4486 thiss!1151) (currentByte!4491 thiss!1151) (size!1877 (buf!2267 thiss!1151))))))

(declare-fun res!72633 () Bool)

(assert (=> start!17938 (=> (not res!72633) (not e!58416))))

(assert (=> start!17938 (= res!72633 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17938 e!58416))

(declare-fun inv!12 (BitStream!3316) Bool)

(assert (=> start!17938 (and (inv!12 thiss!1152) e!58414)))

(assert (=> start!17938 (and (inv!12 thiss!1151) e!58408)))

(assert (=> start!17938 true))

(declare-fun b!88245 () Bool)

(declare-fun res!72638 () Bool)

(assert (=> b!88245 (=> (not res!72638) (not e!58416))))

(assert (=> b!88245 (= res!72638 (and (bvsle i!576 nBits!336) (= (size!1877 (buf!2267 thiss!1152)) (size!1877 (buf!2267 thiss!1151)))))))

(assert (= (and start!17938 res!72633) b!88241))

(assert (= (and b!88241 res!72632) b!88252))

(assert (= (and b!88252 res!72636) b!88242))

(assert (= (and b!88242 res!72640) b!88251))

(assert (= (and b!88251 res!72634) b!88245))

(assert (= (and b!88245 res!72638) b!88243))

(assert (= (and b!88243 res!72635) b!88244))

(assert (= (and b!88244 res!72639) b!88239))

(assert (= (and b!88239 res!72631) b!88246))

(assert (= (and b!88246 res!72641) b!88238))

(assert (= (and b!88238 res!72637) b!88248))

(assert (= (and b!88248 res!72642) b!88240))

(assert (= (and b!88240 res!72643) b!88250))

(assert (= start!17938 b!88247))

(assert (= start!17938 b!88249))

(declare-fun m!133445 () Bool)

(assert (=> b!88252 m!133445))

(declare-fun m!133447 () Bool)

(assert (=> start!17938 m!133447))

(declare-fun m!133449 () Bool)

(assert (=> start!17938 m!133449))

(declare-fun m!133451 () Bool)

(assert (=> b!88241 m!133451))

(declare-fun m!133453 () Bool)

(assert (=> b!88243 m!133453))

(declare-fun m!133455 () Bool)

(assert (=> b!88243 m!133455))

(declare-fun m!133457 () Bool)

(assert (=> b!88250 m!133457))

(declare-fun m!133459 () Bool)

(assert (=> b!88240 m!133459))

(assert (=> b!88240 m!133459))

(declare-fun m!133461 () Bool)

(assert (=> b!88240 m!133461))

(declare-fun m!133463 () Bool)

(assert (=> b!88244 m!133463))

(declare-fun m!133465 () Bool)

(assert (=> b!88249 m!133465))

(declare-fun m!133467 () Bool)

(assert (=> b!88247 m!133467))

(declare-fun m!133469 () Bool)

(assert (=> b!88251 m!133469))

(declare-fun m!133471 () Bool)

(assert (=> b!88248 m!133471))

(declare-fun m!133473 () Bool)

(assert (=> b!88238 m!133473))

(declare-fun m!133475 () Bool)

(assert (=> b!88246 m!133475))

(declare-fun m!133477 () Bool)

(assert (=> b!88246 m!133477))

(push 1)

(assert (not b!88250))

(assert (not b!88248))

(assert (not b!88249))

(assert (not b!88244))

(assert (not b!88247))

(assert (not b!88240))

(assert (not b!88238))

(assert (not b!88246))

(assert (not b!88241))

(assert (not b!88251))

(assert (not b!88243))

(assert (not start!17938))

(assert (not b!88252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27698 () Bool)

(assert (=> d!27698 (= (array_inv!1723 (buf!2267 thiss!1151)) (bvsge (size!1877 (buf!2267 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!88249 d!27698))

(declare-fun d!27700 () Bool)

(declare-fun e!58500 () Bool)

(assert (=> d!27700 e!58500))

(declare-fun res!72773 () Bool)

(assert (=> d!27700 (=> (not res!72773) (not e!58500))))

(declare-fun lt!136114 () (_ BitVec 64))

(declare-fun lt!136116 () (_ BitVec 64))

(declare-fun lt!136117 () (_ BitVec 64))

(assert (=> d!27700 (= res!72773 (= lt!136114 (bvsub lt!136117 lt!136116)))))

(assert (=> d!27700 (or (= (bvand lt!136117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136116 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136117 lt!136116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27700 (= lt!136116 (remainingBits!0 ((_ sign_extend 32) (size!1877 (buf!2267 (_2!3958 lt!136012)))) ((_ sign_extend 32) (currentByte!4491 (_2!3958 lt!136012))) ((_ sign_extend 32) (currentBit!4486 (_2!3958 lt!136012)))))))

(declare-fun lt!136118 () (_ BitVec 64))

(declare-fun lt!136115 () (_ BitVec 64))

(assert (=> d!27700 (= lt!136117 (bvmul lt!136118 lt!136115))))

(assert (=> d!27700 (or (= lt!136118 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136115 (bvsdiv (bvmul lt!136118 lt!136115) lt!136118)))))

(assert (=> d!27700 (= lt!136115 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27700 (= lt!136118 ((_ sign_extend 32) (size!1877 (buf!2267 (_2!3958 lt!136012)))))))

(assert (=> d!27700 (= lt!136114 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4491 (_2!3958 lt!136012))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4486 (_2!3958 lt!136012)))))))

(assert (=> d!27700 (invariant!0 (currentBit!4486 (_2!3958 lt!136012)) (currentByte!4491 (_2!3958 lt!136012)) (size!1877 (buf!2267 (_2!3958 lt!136012))))))

(assert (=> d!27700 (= (bitIndex!0 (size!1877 (buf!2267 (_2!3958 lt!136012))) (currentByte!4491 (_2!3958 lt!136012)) (currentBit!4486 (_2!3958 lt!136012))) lt!136114)))

(declare-fun b!88393 () Bool)

(declare-fun res!72772 () Bool)

(assert (=> b!88393 (=> (not res!72772) (not e!58500))))

(assert (=> b!88393 (= res!72772 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136114))))

(declare-fun b!88394 () Bool)

(declare-fun lt!136119 () (_ BitVec 64))

(assert (=> b!88394 (= e!58500 (bvsle lt!136114 (bvmul lt!136119 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88394 (or (= lt!136119 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136119 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136119)))))

(assert (=> b!88394 (= lt!136119 ((_ sign_extend 32) (size!1877 (buf!2267 (_2!3958 lt!136012)))))))

(assert (= (and d!27700 res!72773) b!88393))

(assert (= (and b!88393 res!72772) b!88394))

(declare-fun m!133579 () Bool)

(assert (=> d!27700 m!133579))

(assert (=> d!27700 m!133475))

(assert (=> b!88238 d!27700))

(declare-fun d!27718 () Bool)

(declare-datatypes ((tuple2!7464 0))(
  ( (tuple2!7465 (_1!3965 Bool) (_2!3965 BitStream!3316)) )
))
(declare-fun lt!136122 () tuple2!7464)

(declare-fun readBit!0 (BitStream!3316) tuple2!7464)

(assert (=> d!27718 (= lt!136122 (readBit!0 (readerFrom!0 (_2!3958 lt!136012) (currentBit!4486 thiss!1152) (currentByte!4491 thiss!1152))))))

(assert (=> d!27718 (= (readBitPure!0 (readerFrom!0 (_2!3958 lt!136012) (currentBit!4486 thiss!1152) (currentByte!4491 thiss!1152))) (tuple2!7453 (_2!3965 lt!136122) (_1!3965 lt!136122)))))

(declare-fun bs!6865 () Bool)

(assert (= bs!6865 d!27718))

(assert (=> bs!6865 m!133459))

(declare-fun m!133581 () Bool)

(assert (=> bs!6865 m!133581))

(assert (=> b!88240 d!27718))

(declare-fun d!27720 () Bool)

(declare-fun e!58503 () Bool)

(assert (=> d!27720 e!58503))

(declare-fun res!72777 () Bool)

(assert (=> d!27720 (=> (not res!72777) (not e!58503))))

(assert (=> d!27720 (= res!72777 (invariant!0 (currentBit!4486 (_2!3958 lt!136012)) (currentByte!4491 (_2!3958 lt!136012)) (size!1877 (buf!2267 (_2!3958 lt!136012)))))))

(assert (=> d!27720 (= (readerFrom!0 (_2!3958 lt!136012) (currentBit!4486 thiss!1152) (currentByte!4491 thiss!1152)) (BitStream!3317 (buf!2267 (_2!3958 lt!136012)) (currentByte!4491 thiss!1152) (currentBit!4486 thiss!1152)))))

(declare-fun b!88397 () Bool)

(assert (=> b!88397 (= e!58503 (invariant!0 (currentBit!4486 thiss!1152) (currentByte!4491 thiss!1152) (size!1877 (buf!2267 (_2!3958 lt!136012)))))))

(assert (= (and d!27720 res!72777) b!88397))

(assert (=> d!27720 m!133475))

(declare-fun m!133583 () Bool)

(assert (=> b!88397 m!133583))

(assert (=> b!88240 d!27720))

(declare-fun d!27722 () Bool)

(declare-fun e!58504 () Bool)

(assert (=> d!27722 e!58504))

(declare-fun res!72779 () Bool)

(assert (=> d!27722 (=> (not res!72779) (not e!58504))))

(declare-fun lt!136125 () (_ BitVec 64))

(declare-fun lt!136123 () (_ BitVec 64))

(declare-fun lt!136126 () (_ BitVec 64))

(assert (=> d!27722 (= res!72779 (= lt!136123 (bvsub lt!136126 lt!136125)))))

(assert (=> d!27722 (or (= (bvand lt!136126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136125 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136126 lt!136125) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27722 (= lt!136125 (remainingBits!0 ((_ sign_extend 32) (size!1877 (buf!2267 (_1!3959 lt!136011)))) ((_ sign_extend 32) (currentByte!4491 (_1!3959 lt!136011))) ((_ sign_extend 32) (currentBit!4486 (_1!3959 lt!136011)))))))

(declare-fun lt!136127 () (_ BitVec 64))

(declare-fun lt!136124 () (_ BitVec 64))

(assert (=> d!27722 (= lt!136126 (bvmul lt!136127 lt!136124))))

(assert (=> d!27722 (or (= lt!136127 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136124 (bvsdiv (bvmul lt!136127 lt!136124) lt!136127)))))

(assert (=> d!27722 (= lt!136124 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27722 (= lt!136127 ((_ sign_extend 32) (size!1877 (buf!2267 (_1!3959 lt!136011)))))))

(assert (=> d!27722 (= lt!136123 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4491 (_1!3959 lt!136011))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4486 (_1!3959 lt!136011)))))))

(assert (=> d!27722 (invariant!0 (currentBit!4486 (_1!3959 lt!136011)) (currentByte!4491 (_1!3959 lt!136011)) (size!1877 (buf!2267 (_1!3959 lt!136011))))))

(assert (=> d!27722 (= (bitIndex!0 (size!1877 (buf!2267 (_1!3959 lt!136011))) (currentByte!4491 (_1!3959 lt!136011)) (currentBit!4486 (_1!3959 lt!136011))) lt!136123)))

(declare-fun b!88398 () Bool)

(declare-fun res!72778 () Bool)

(assert (=> b!88398 (=> (not res!72778) (not e!58504))))

(assert (=> b!88398 (= res!72778 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136123))))

(declare-fun b!88399 () Bool)

(declare-fun lt!136128 () (_ BitVec 64))

(assert (=> b!88399 (= e!58504 (bvsle lt!136123 (bvmul lt!136128 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88399 (or (= lt!136128 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136128 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136128)))))

(assert (=> b!88399 (= lt!136128 ((_ sign_extend 32) (size!1877 (buf!2267 (_1!3959 lt!136011)))))))

(assert (= (and d!27722 res!72779) b!88398))

(assert (= (and b!88398 res!72778) b!88399))

(declare-fun m!133585 () Bool)

(assert (=> d!27722 m!133585))

(declare-fun m!133587 () Bool)

(assert (=> d!27722 m!133587))

(assert (=> b!88250 d!27722))

(declare-fun d!27724 () Bool)

(assert (=> d!27724 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1151))) ((_ sign_extend 32) (currentByte!4491 thiss!1151)) ((_ sign_extend 32) (currentBit!4486 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1151))) ((_ sign_extend 32) (currentByte!4491 thiss!1151)) ((_ sign_extend 32) (currentBit!4486 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6866 () Bool)

(assert (= bs!6866 d!27724))

(declare-fun m!133589 () Bool)

(assert (=> bs!6866 m!133589))

(assert (=> b!88241 d!27724))

(declare-fun d!27726 () Bool)

(assert (=> d!27726 (= (invariant!0 (currentBit!4486 thiss!1151) (currentByte!4491 thiss!1151) (size!1877 (buf!2267 thiss!1151))) (and (bvsge (currentBit!4486 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4486 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4491 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4491 thiss!1151) (size!1877 (buf!2267 thiss!1151))) (and (= (currentBit!4486 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4491 thiss!1151) (size!1877 (buf!2267 thiss!1151)))))))))

(assert (=> b!88252 d!27726))

(declare-fun d!27728 () Bool)

(assert (=> d!27728 (= (invariant!0 (currentBit!4486 thiss!1152) (currentByte!4491 thiss!1152) (size!1877 (buf!2267 thiss!1152))) (and (bvsge (currentBit!4486 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4486 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4491 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4491 thiss!1152) (size!1877 (buf!2267 thiss!1152))) (and (= (currentBit!4486 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4491 thiss!1152) (size!1877 (buf!2267 thiss!1152)))))))))

(assert (=> b!88251 d!27728))

(declare-fun d!27730 () Bool)

(assert (=> d!27730 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4486 thiss!1152) (currentByte!4491 thiss!1152) (size!1877 (buf!2267 thiss!1152))))))

(declare-fun bs!6867 () Bool)

(assert (= bs!6867 d!27730))

(assert (=> bs!6867 m!133469))

(assert (=> start!17938 d!27730))

(declare-fun d!27732 () Bool)

(assert (=> d!27732 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4486 thiss!1151) (currentByte!4491 thiss!1151) (size!1877 (buf!2267 thiss!1151))))))

(declare-fun bs!6868 () Bool)

(assert (= bs!6868 d!27732))

(assert (=> bs!6868 m!133445))

(assert (=> start!17938 d!27732))

(declare-fun d!27734 () Bool)

(assert (=> d!27734 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1152))) ((_ sign_extend 32) (currentByte!4491 thiss!1152)) ((_ sign_extend 32) (currentBit!4486 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1152))) ((_ sign_extend 32) (currentByte!4491 thiss!1152)) ((_ sign_extend 32) (currentBit!4486 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6869 () Bool)

(assert (= bs!6869 d!27734))

(declare-fun m!133591 () Bool)

(assert (=> bs!6869 m!133591))

(assert (=> b!88244 d!27734))

(declare-fun d!27736 () Bool)

(declare-fun e!58505 () Bool)

(assert (=> d!27736 e!58505))

(declare-fun res!72781 () Bool)

(assert (=> d!27736 (=> (not res!72781) (not e!58505))))

(declare-fun lt!136131 () (_ BitVec 64))

(declare-fun lt!136129 () (_ BitVec 64))

(declare-fun lt!136132 () (_ BitVec 64))

(assert (=> d!27736 (= res!72781 (= lt!136129 (bvsub lt!136132 lt!136131)))))

(assert (=> d!27736 (or (= (bvand lt!136132 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136131 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136132 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136132 lt!136131) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27736 (= lt!136131 (remainingBits!0 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1152))) ((_ sign_extend 32) (currentByte!4491 thiss!1152)) ((_ sign_extend 32) (currentBit!4486 thiss!1152))))))

(declare-fun lt!136133 () (_ BitVec 64))

(declare-fun lt!136130 () (_ BitVec 64))

(assert (=> d!27736 (= lt!136132 (bvmul lt!136133 lt!136130))))

(assert (=> d!27736 (or (= lt!136133 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136130 (bvsdiv (bvmul lt!136133 lt!136130) lt!136133)))))

(assert (=> d!27736 (= lt!136130 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27736 (= lt!136133 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1152))))))

(assert (=> d!27736 (= lt!136129 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4491 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4486 thiss!1152))))))

(assert (=> d!27736 (invariant!0 (currentBit!4486 thiss!1152) (currentByte!4491 thiss!1152) (size!1877 (buf!2267 thiss!1152)))))

(assert (=> d!27736 (= (bitIndex!0 (size!1877 (buf!2267 thiss!1152)) (currentByte!4491 thiss!1152) (currentBit!4486 thiss!1152)) lt!136129)))

(declare-fun b!88400 () Bool)

(declare-fun res!72780 () Bool)

(assert (=> b!88400 (=> (not res!72780) (not e!58505))))

(assert (=> b!88400 (= res!72780 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136129))))

(declare-fun b!88401 () Bool)

(declare-fun lt!136134 () (_ BitVec 64))

(assert (=> b!88401 (= e!58505 (bvsle lt!136129 (bvmul lt!136134 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88401 (or (= lt!136134 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136134 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136134)))))

(assert (=> b!88401 (= lt!136134 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1152))))))

(assert (= (and d!27736 res!72781) b!88400))

(assert (= (and b!88400 res!72780) b!88401))

(assert (=> d!27736 m!133591))

(assert (=> d!27736 m!133469))

(assert (=> b!88243 d!27736))

(declare-fun d!27738 () Bool)

(declare-fun e!58506 () Bool)

(assert (=> d!27738 e!58506))

(declare-fun res!72783 () Bool)

(assert (=> d!27738 (=> (not res!72783) (not e!58506))))

(declare-fun lt!136137 () (_ BitVec 64))

(declare-fun lt!136138 () (_ BitVec 64))

(declare-fun lt!136135 () (_ BitVec 64))

(assert (=> d!27738 (= res!72783 (= lt!136135 (bvsub lt!136138 lt!136137)))))

(assert (=> d!27738 (or (= (bvand lt!136138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136137 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136138 lt!136137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27738 (= lt!136137 (remainingBits!0 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1151))) ((_ sign_extend 32) (currentByte!4491 thiss!1151)) ((_ sign_extend 32) (currentBit!4486 thiss!1151))))))

(declare-fun lt!136139 () (_ BitVec 64))

(declare-fun lt!136136 () (_ BitVec 64))

(assert (=> d!27738 (= lt!136138 (bvmul lt!136139 lt!136136))))

(assert (=> d!27738 (or (= lt!136139 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136136 (bvsdiv (bvmul lt!136139 lt!136136) lt!136139)))))

(assert (=> d!27738 (= lt!136136 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27738 (= lt!136139 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1151))))))

(assert (=> d!27738 (= lt!136135 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4491 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4486 thiss!1151))))))

(assert (=> d!27738 (invariant!0 (currentBit!4486 thiss!1151) (currentByte!4491 thiss!1151) (size!1877 (buf!2267 thiss!1151)))))

(assert (=> d!27738 (= (bitIndex!0 (size!1877 (buf!2267 thiss!1151)) (currentByte!4491 thiss!1151) (currentBit!4486 thiss!1151)) lt!136135)))

(declare-fun b!88402 () Bool)

(declare-fun res!72782 () Bool)

(assert (=> b!88402 (=> (not res!72782) (not e!58506))))

(assert (=> b!88402 (= res!72782 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136135))))

(declare-fun b!88403 () Bool)

(declare-fun lt!136140 () (_ BitVec 64))

(assert (=> b!88403 (= e!58506 (bvsle lt!136135 (bvmul lt!136140 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88403 (or (= lt!136140 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136140 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136140)))))

(assert (=> b!88403 (= lt!136140 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1151))))))

(assert (= (and d!27738 res!72783) b!88402))

(assert (= (and b!88402 res!72782) b!88403))

(assert (=> d!27738 m!133589))

(assert (=> d!27738 m!133445))

(assert (=> b!88243 d!27738))

(declare-fun d!27740 () Bool)

(assert (=> d!27740 (= (invariant!0 (currentBit!4486 (_2!3958 lt!136012)) (currentByte!4491 (_2!3958 lt!136012)) (size!1877 (buf!2267 (_2!3958 lt!136012)))) (and (bvsge (currentBit!4486 (_2!3958 lt!136012)) #b00000000000000000000000000000000) (bvslt (currentBit!4486 (_2!3958 lt!136012)) #b00000000000000000000000000001000) (bvsge (currentByte!4491 (_2!3958 lt!136012)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4491 (_2!3958 lt!136012)) (size!1877 (buf!2267 (_2!3958 lt!136012)))) (and (= (currentBit!4486 (_2!3958 lt!136012)) #b00000000000000000000000000000000) (= (currentByte!4491 (_2!3958 lt!136012)) (size!1877 (buf!2267 (_2!3958 lt!136012))))))))))

(assert (=> b!88246 d!27740))

(declare-fun d!27742 () Bool)

(declare-fun e!58521 () Bool)

(assert (=> d!27742 e!58521))

(declare-fun res!72814 () Bool)

(assert (=> d!27742 (=> (not res!72814) (not e!58521))))

(declare-fun lt!136185 () tuple2!7450)

(assert (=> d!27742 (= res!72814 (= (size!1877 (buf!2267 thiss!1152)) (size!1877 (buf!2267 (_2!3958 lt!136185)))))))

(declare-fun choose!16 (BitStream!3316 Bool) tuple2!7450)

(assert (=> d!27742 (= lt!136185 (choose!16 thiss!1152 lt!136014))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27742 (validate_offset_bit!0 ((_ sign_extend 32) (size!1877 (buf!2267 thiss!1152))) ((_ sign_extend 32) (currentByte!4491 thiss!1152)) ((_ sign_extend 32) (currentBit!4486 thiss!1152)))))

(assert (=> d!27742 (= (appendBit!0 thiss!1152 lt!136014) lt!136185)))

(declare-fun b!88432 () Bool)

(declare-fun res!72812 () Bool)

(assert (=> b!88432 (=> (not res!72812) (not e!58521))))

(declare-fun lt!136183 () (_ BitVec 64))

(declare-fun lt!136182 () (_ BitVec 64))

(assert (=> b!88432 (= res!72812 (= (bitIndex!0 (size!1877 (buf!2267 (_2!3958 lt!136185))) (currentByte!4491 (_2!3958 lt!136185)) (currentBit!4486 (_2!3958 lt!136185))) (bvadd lt!136183 lt!136182)))))

(assert (=> b!88432 (or (not (= (bvand lt!136183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136182 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!136183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!136183 lt!136182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!88432 (= lt!136182 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!88432 (= lt!136183 (bitIndex!0 (size!1877 (buf!2267 thiss!1152)) (currentByte!4491 thiss!1152) (currentBit!4486 thiss!1152)))))

(declare-fun b!88434 () Bool)

(declare-fun e!58520 () Bool)

(assert (=> b!88434 (= e!58521 e!58520)))

(declare-fun res!72813 () Bool)

(assert (=> b!88434 (=> (not res!72813) (not e!58520))))

(declare-fun lt!136184 () tuple2!7452)

(assert (=> b!88434 (= res!72813 (and (= (_2!3959 lt!136184) lt!136014) (= (_1!3959 lt!136184) (_2!3958 lt!136185))))))

(assert (=> b!88434 (= lt!136184 (readBitPure!0 (readerFrom!0 (_2!3958 lt!136185) (currentBit!4486 thiss!1152) (currentByte!4491 thiss!1152))))))

(declare-fun b!88435 () Bool)

(assert (=> b!88435 (= e!58520 (= (bitIndex!0 (size!1877 (buf!2267 (_1!3959 lt!136184))) (currentByte!4491 (_1!3959 lt!136184)) (currentBit!4486 (_1!3959 lt!136184))) (bitIndex!0 (size!1877 (buf!2267 (_2!3958 lt!136185))) (currentByte!4491 (_2!3958 lt!136185)) (currentBit!4486 (_2!3958 lt!136185)))))))

(declare-fun b!88433 () Bool)

(declare-fun res!72811 () Bool)

(assert (=> b!88433 (=> (not res!72811) (not e!58521))))

(assert (=> b!88433 (= res!72811 (isPrefixOf!0 thiss!1152 (_2!3958 lt!136185)))))

(assert (= (and d!27742 res!72814) b!88432))

(assert (= (and b!88432 res!72812) b!88433))

(assert (= (and b!88433 res!72811) b!88434))

(assert (= (and b!88434 res!72813) b!88435))

(declare-fun m!133611 () Bool)

(assert (=> b!88432 m!133611))

(assert (=> b!88432 m!133453))

(declare-fun m!133613 () Bool)

(assert (=> b!88435 m!133613))

(assert (=> b!88435 m!133611))

(declare-fun m!133615 () Bool)

(assert (=> b!88434 m!133615))

(assert (=> b!88434 m!133615))

(declare-fun m!133617 () Bool)

(assert (=> b!88434 m!133617))

(declare-fun m!133619 () Bool)

(assert (=> b!88433 m!133619))

(declare-fun m!133621 () Bool)

(assert (=> d!27742 m!133621))

(declare-fun m!133623 () Bool)

(assert (=> d!27742 m!133623))

(assert (=> b!88246 d!27742))

(declare-fun d!27754 () Bool)

(declare-fun res!72832 () Bool)

(declare-fun e!58533 () Bool)

(assert (=> d!27754 (=> (not res!72832) (not e!58533))))

(assert (=> d!27754 (= res!72832 (= (size!1877 (buf!2267 thiss!1152)) (size!1877 (buf!2267 (_2!3958 lt!136012)))))))

(assert (=> d!27754 (= (isPrefixOf!0 thiss!1152 (_2!3958 lt!136012)) e!58533)))

(declare-fun b!88451 () Bool)

(declare-fun res!72831 () Bool)

(assert (=> b!88451 (=> (not res!72831) (not e!58533))))

(assert (=> b!88451 (= res!72831 (bvsle (bitIndex!0 (size!1877 (buf!2267 thiss!1152)) (currentByte!4491 thiss!1152) (currentBit!4486 thiss!1152)) (bitIndex!0 (size!1877 (buf!2267 (_2!3958 lt!136012))) (currentByte!4491 (_2!3958 lt!136012)) (currentBit!4486 (_2!3958 lt!136012)))))))

(declare-fun b!88452 () Bool)

(declare-fun e!58532 () Bool)

(assert (=> b!88452 (= e!58533 e!58532)))

(declare-fun res!72830 () Bool)

(assert (=> b!88452 (=> res!72830 e!58532)))

(assert (=> b!88452 (= res!72830 (= (size!1877 (buf!2267 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!88453 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4155 array!4155 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88453 (= e!58532 (arrayBitRangesEq!0 (buf!2267 thiss!1152) (buf!2267 (_2!3958 lt!136012)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1877 (buf!2267 thiss!1152)) (currentByte!4491 thiss!1152) (currentBit!4486 thiss!1152))))))

(assert (= (and d!27754 res!72832) b!88451))

(assert (= (and b!88451 res!72831) b!88452))

(assert (= (and b!88452 (not res!72830)) b!88453))

(assert (=> b!88451 m!133453))

(assert (=> b!88451 m!133473))

(assert (=> b!88453 m!133453))

(assert (=> b!88453 m!133453))

(declare-fun m!133635 () Bool)

(assert (=> b!88453 m!133635))

(assert (=> b!88248 d!27754))

(declare-fun d!27774 () Bool)

(assert (=> d!27774 (= (array_inv!1723 (buf!2267 thiss!1152)) (bvsge (size!1877 (buf!2267 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!88247 d!27774))

(push 1)

(assert (not d!27718))

(assert (not d!27722))

(assert (not d!27732))

(assert (not b!88432))

(assert (not d!27724))

(assert (not b!88397))

(assert (not d!27738))

(assert (not d!27734))

(assert (not d!27720))

(assert (not b!88435))

(assert (not d!27742))

(assert (not d!27736))

(assert (not b!88453))

(assert (not b!88433))

(assert (not b!88434))

(assert (not d!27730))

(assert (not b!88451))

(assert (not d!27700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

