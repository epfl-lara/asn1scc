; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45592 () Bool)

(assert start!45592)

(declare-fun b!220533 () Bool)

(declare-fun e!149767 () Bool)

(declare-datatypes ((array!10750 0))(
  ( (array!10751 (arr!5650 (Array (_ BitVec 32) (_ BitVec 8))) (size!4720 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8548 0))(
  ( (BitStream!8549 (buf!5267 array!10750) (currentByte!9900 (_ BitVec 32)) (currentBit!9895 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8548)

(declare-fun array_inv!4461 (array!10750) Bool)

(assert (=> b!220533 (= e!149767 (array_inv!4461 (buf!5267 bs!62)))))

(declare-fun b!220534 () Bool)

(declare-fun res!185777 () Bool)

(declare-fun e!149769 () Bool)

(assert (=> b!220534 (=> (not res!185777) (not e!149769))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220534 (= res!185777 (validate_offset_bits!1 ((_ sign_extend 32) (size!4720 (buf!5267 bs!62))) ((_ sign_extend 32) (currentByte!9900 bs!62)) ((_ sign_extend 32) (currentBit!9895 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220535 () Bool)

(declare-fun res!185772 () Bool)

(assert (=> b!220535 (=> (not res!185772) (not e!149769))))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220535 (= res!185772 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220536 () Bool)

(declare-fun res!185776 () Bool)

(declare-fun e!149768 () Bool)

(assert (=> b!220536 (=> (not res!185776) (not e!149768))))

(declare-fun lt!348471 () BitStream!8548)

(assert (=> b!220536 (= res!185776 (validate_offset_bits!1 ((_ sign_extend 32) (size!4720 (buf!5267 lt!348471))) ((_ sign_extend 32) (currentByte!9900 lt!348471)) ((_ sign_extend 32) (currentBit!9895 lt!348471)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun res!185774 () Bool)

(assert (=> start!45592 (=> (not res!185774) (not e!149769))))

(assert (=> start!45592 (= res!185774 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45592 e!149769))

(assert (=> start!45592 true))

(declare-fun inv!12 (BitStream!8548) Bool)

(assert (=> start!45592 (and (inv!12 bs!62) e!149767)))

(declare-fun b!220537 () Bool)

(declare-fun res!185773 () Bool)

(assert (=> b!220537 (=> (not res!185773) (not e!149769))))

(assert (=> b!220537 (= res!185773 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220538 () Bool)

(assert (=> b!220538 (= e!149769 e!149768)))

(declare-fun res!185775 () Bool)

(assert (=> b!220538 (=> (not res!185775) (not e!149768))))

(assert (=> b!220538 (= res!185775 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-fun withMovedBitIndex!0 (BitStream!8548 (_ BitVec 64)) BitStream!8548)

(assert (=> b!220538 (= lt!348471 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!18866 0))(
  ( (tuple2!18867 (_1!10091 BitStream!8548) (_2!10091 Bool)) )
))
(declare-fun lt!348472 () tuple2!18866)

(declare-fun readBitPure!0 (BitStream!8548) tuple2!18866)

(assert (=> b!220538 (= lt!348472 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18868 0))(
  ( (tuple2!18869 (_1!10092 BitStream!8548) (_2!10092 (_ BitVec 64))) )
))
(declare-fun lt!348473 () tuple2!18868)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18868)

(assert (=> b!220538 (= lt!348473 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220539 () Bool)

(assert (=> b!220539 (= e!149768 (not (= (bvand (bvor acc!113 (ite (_2!10091 lt!348472) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45592 res!185774) b!220534))

(assert (= (and b!220534 res!185777) b!220535))

(assert (= (and b!220535 res!185772) b!220537))

(assert (= (and b!220537 res!185773) b!220538))

(assert (= (and b!220538 res!185775) b!220536))

(assert (= (and b!220536 res!185776) b!220539))

(assert (= start!45592 b!220533))

(declare-fun m!339211 () Bool)

(assert (=> b!220539 m!339211))

(declare-fun m!339213 () Bool)

(assert (=> b!220538 m!339213))

(declare-fun m!339215 () Bool)

(assert (=> b!220538 m!339215))

(declare-fun m!339217 () Bool)

(assert (=> b!220538 m!339217))

(declare-fun m!339219 () Bool)

(assert (=> b!220534 m!339219))

(declare-fun m!339221 () Bool)

(assert (=> b!220536 m!339221))

(declare-fun m!339223 () Bool)

(assert (=> start!45592 m!339223))

(declare-fun m!339225 () Bool)

(assert (=> b!220535 m!339225))

(declare-fun m!339227 () Bool)

(assert (=> b!220533 m!339227))

(push 1)

(assert (not b!220536))

(assert (not b!220539))

(assert (not b!220534))

(assert (not b!220538))

(assert (not start!45592))

(assert (not b!220533))

(assert (not b!220535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74289 () Bool)

(assert (=> d!74289 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220535 d!74289))

(declare-fun d!74291 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74291 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4720 (buf!5267 lt!348471))) ((_ sign_extend 32) (currentByte!9900 lt!348471)) ((_ sign_extend 32) (currentBit!9895 lt!348471)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4720 (buf!5267 lt!348471))) ((_ sign_extend 32) (currentByte!9900 lt!348471)) ((_ sign_extend 32) (currentBit!9895 lt!348471))) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun bs!18158 () Bool)

(assert (= bs!18158 d!74291))

(declare-fun m!339265 () Bool)

(assert (=> bs!18158 m!339265))

(assert (=> b!220536 d!74291))

(declare-fun d!74293 () Bool)

(assert (=> d!74293 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4720 (buf!5267 bs!62))) ((_ sign_extend 32) (currentByte!9900 bs!62)) ((_ sign_extend 32) (currentBit!9895 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4720 (buf!5267 bs!62))) ((_ sign_extend 32) (currentByte!9900 bs!62)) ((_ sign_extend 32) (currentBit!9895 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18159 () Bool)

(assert (= bs!18159 d!74293))

(declare-fun m!339267 () Bool)

(assert (=> bs!18159 m!339267))

(assert (=> b!220534 d!74293))

(declare-fun d!74295 () Bool)

(assert (=> d!74295 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541))) (ite (= (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))))))))

(assert (=> b!220539 d!74295))

(declare-fun d!74297 () Bool)

(declare-fun e!149799 () Bool)

(assert (=> d!74297 e!149799))

(declare-fun res!185819 () Bool)

(assert (=> d!74297 (=> (not res!185819) (not e!149799))))

(declare-fun lt!348509 () (_ BitVec 64))

(declare-fun lt!348508 () BitStream!8548)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!74297 (= res!185819 (= (bvadd lt!348509 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4720 (buf!5267 lt!348508)) (currentByte!9900 lt!348508) (currentBit!9895 lt!348508))))))

(assert (=> d!74297 (or (not (= (bvand lt!348509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348509 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74297 (= lt!348509 (bitIndex!0 (size!4720 (buf!5267 bs!62)) (currentByte!9900 bs!62) (currentBit!9895 bs!62)))))

(declare-datatypes ((Unit!15609 0))(
  ( (Unit!15610) )
))
(declare-datatypes ((tuple2!18884 0))(
  ( (tuple2!18885 (_1!10100 Unit!15609) (_2!10100 BitStream!8548)) )
))
(declare-fun moveBitIndex!0 (BitStream!8548 (_ BitVec 64)) tuple2!18884)

(assert (=> d!74297 (= lt!348508 (_2!10100 (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8548 (_ BitVec 64)) Bool)

(assert (=> d!74297 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74297 (= (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) lt!348508)))

(declare-fun b!220587 () Bool)

(assert (=> b!220587 (= e!149799 (= (size!4720 (buf!5267 bs!62)) (size!4720 (buf!5267 lt!348508))))))

(assert (= (and d!74297 res!185819) b!220587))

(declare-fun m!339287 () Bool)

(assert (=> d!74297 m!339287))

(declare-fun m!339289 () Bool)

(assert (=> d!74297 m!339289))

(declare-fun m!339291 () Bool)

(assert (=> d!74297 m!339291))

(declare-fun m!339293 () Bool)

(assert (=> d!74297 m!339293))

(assert (=> b!220538 d!74297))

(declare-fun d!74317 () Bool)

(declare-datatypes ((tuple2!18886 0))(
  ( (tuple2!18887 (_1!10101 Bool) (_2!10101 BitStream!8548)) )
))
(declare-fun lt!348512 () tuple2!18886)

(declare-fun readBit!0 (BitStream!8548) tuple2!18886)

(assert (=> d!74317 (= lt!348512 (readBit!0 bs!62))))

(assert (=> d!74317 (= (readBitPure!0 bs!62) (tuple2!18867 (_2!10101 lt!348512) (_1!10101 lt!348512)))))

(declare-fun bs!18168 () Bool)

(assert (= bs!18168 d!74317))

(declare-fun m!339301 () Bool)

(assert (=> bs!18168 m!339301))

(assert (=> b!220538 d!74317))

(declare-datatypes ((tuple2!18888 0))(
  ( (tuple2!18889 (_1!10102 (_ BitVec 64)) (_2!10102 BitStream!8548)) )
))
(declare-fun lt!348515 () tuple2!18888)

(declare-fun d!74327 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18888)

(assert (=> d!74327 (= lt!348515 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74327 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18869 (_2!10102 lt!348515) (_1!10102 lt!348515)))))

(declare-fun bs!18169 () Bool)

(assert (= bs!18169 d!74327))

(declare-fun m!339303 () Bool)

(assert (=> bs!18169 m!339303))

(assert (=> b!220538 d!74327))

(declare-fun d!74329 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74329 (= (inv!12 bs!62) (invariant!0 (currentBit!9895 bs!62) (currentByte!9900 bs!62) (size!4720 (buf!5267 bs!62))))))

(declare-fun bs!18170 () Bool)

(assert (= bs!18170 d!74329))

(declare-fun m!339305 () Bool)

(assert (=> bs!18170 m!339305))

(assert (=> start!45592 d!74329))

(declare-fun d!74331 () Bool)

(assert (=> d!74331 (= (array_inv!4461 (buf!5267 bs!62)) (bvsge (size!4720 (buf!5267 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220533 d!74331))

(push 1)

(assert (not d!74293))

(assert (not d!74317))

(assert (not d!74327))

(assert (not d!74329))

(assert (not d!74297))

(assert (not d!74291))

(check-sat)

(pop 1)

(push 1)

(check-sat)

