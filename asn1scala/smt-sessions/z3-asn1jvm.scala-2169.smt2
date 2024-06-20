; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55062 () Bool)

(assert start!55062)

(declare-fun b!257058 () Bool)

(declare-fun e!178210 () Bool)

(declare-datatypes ((array!13949 0))(
  ( (array!13950 (arr!7103 (Array (_ BitVec 32) (_ BitVec 8))) (size!6116 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11154 0))(
  ( (BitStream!11155 (buf!6638 array!13949) (currentByte!12168 (_ BitVec 32)) (currentBit!12163 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11154)

(declare-fun array_inv!5857 (array!13949) Bool)

(assert (=> b!257058 (= e!178210 (array_inv!5857 (buf!6638 thiss!1754)))))

(declare-fun b!257059 () Bool)

(declare-fun res!215437 () Bool)

(declare-fun e!178207 () Bool)

(assert (=> b!257059 (=> (not res!215437) (not e!178207))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257059 (= res!215437 (validate_offset_bits!1 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))) ((_ sign_extend 32) (currentByte!12168 thiss!1754)) ((_ sign_extend 32) (currentBit!12163 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!215439 () Bool)

(assert (=> start!55062 (=> (not res!215439) (not e!178207))))

(assert (=> start!55062 (= res!215439 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55062 e!178207))

(assert (=> start!55062 true))

(declare-fun inv!12 (BitStream!11154) Bool)

(assert (=> start!55062 (and (inv!12 thiss!1754) e!178210)))

(declare-fun b!257060 () Bool)

(declare-fun e!178208 () Bool)

(assert (=> b!257060 (= e!178207 e!178208)))

(declare-fun res!215438 () Bool)

(assert (=> b!257060 (=> (not res!215438) (not e!178208))))

(declare-datatypes ((tuple2!21976 0))(
  ( (tuple2!21977 (_1!11924 Bool) (_2!11924 BitStream!11154)) )
))
(declare-fun lt!398354 () tuple2!21976)

(declare-fun expected!109 () Bool)

(assert (=> b!257060 (= res!215438 (not (= (_1!11924 lt!398354) expected!109)))))

(declare-fun readBit!0 (BitStream!11154) tuple2!21976)

(assert (=> b!257060 (= lt!398354 (readBit!0 thiss!1754))))

(declare-fun b!257061 () Bool)

(declare-fun res!215440 () Bool)

(assert (=> b!257061 (=> (not res!215440) (not e!178207))))

(assert (=> b!257061 (= res!215440 (not (= from!526 nBits!535)))))

(declare-fun b!257062 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257062 (= e!178208 (not (invariant!0 (currentBit!12163 (_2!11924 lt!398354)) (currentByte!12168 (_2!11924 lt!398354)) (size!6116 (buf!6638 (_2!11924 lt!398354))))))))

(assert (= (and start!55062 res!215439) b!257059))

(assert (= (and b!257059 res!215437) b!257061))

(assert (= (and b!257061 res!215440) b!257060))

(assert (= (and b!257060 res!215438) b!257062))

(assert (= start!55062 b!257058))

(declare-fun m!386613 () Bool)

(assert (=> b!257059 m!386613))

(declare-fun m!386615 () Bool)

(assert (=> b!257060 m!386615))

(declare-fun m!386617 () Bool)

(assert (=> b!257058 m!386617))

(declare-fun m!386619 () Bool)

(assert (=> b!257062 m!386619))

(declare-fun m!386621 () Bool)

(assert (=> start!55062 m!386621))

(check-sat (not b!257058) (not b!257062) (not start!55062) (not b!257059) (not b!257060))
(check-sat)
(get-model)

(declare-fun d!86284 () Bool)

(assert (=> d!86284 (= (array_inv!5857 (buf!6638 thiss!1754)) (bvsge (size!6116 (buf!6638 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257058 d!86284))

(declare-fun d!86286 () Bool)

(assert (=> d!86286 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12163 thiss!1754) (currentByte!12168 thiss!1754) (size!6116 (buf!6638 thiss!1754))))))

(declare-fun bs!21825 () Bool)

(assert (= bs!21825 d!86286))

(declare-fun m!386633 () Bool)

(assert (=> bs!21825 m!386633))

(assert (=> start!55062 d!86286))

(declare-fun d!86288 () Bool)

(assert (=> d!86288 (= (invariant!0 (currentBit!12163 (_2!11924 lt!398354)) (currentByte!12168 (_2!11924 lt!398354)) (size!6116 (buf!6638 (_2!11924 lt!398354)))) (and (bvsge (currentBit!12163 (_2!11924 lt!398354)) #b00000000000000000000000000000000) (bvslt (currentBit!12163 (_2!11924 lt!398354)) #b00000000000000000000000000001000) (bvsge (currentByte!12168 (_2!11924 lt!398354)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12168 (_2!11924 lt!398354)) (size!6116 (buf!6638 (_2!11924 lt!398354)))) (and (= (currentBit!12163 (_2!11924 lt!398354)) #b00000000000000000000000000000000) (= (currentByte!12168 (_2!11924 lt!398354)) (size!6116 (buf!6638 (_2!11924 lt!398354))))))))))

(assert (=> b!257062 d!86288))

(declare-fun d!86290 () Bool)

(declare-fun e!178237 () Bool)

(assert (=> d!86290 e!178237))

(declare-fun res!215455 () Bool)

(assert (=> d!86290 (=> (not res!215455) (not e!178237))))

(declare-datatypes ((Unit!18369 0))(
  ( (Unit!18370) )
))
(declare-datatypes ((tuple2!21980 0))(
  ( (tuple2!21981 (_1!11926 Unit!18369) (_2!11926 BitStream!11154)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11154) tuple2!21980)

(assert (=> d!86290 (= res!215455 (= (buf!6638 (_2!11926 (increaseBitIndex!0 thiss!1754))) (buf!6638 thiss!1754)))))

(declare-fun lt!398377 () Bool)

(assert (=> d!86290 (= lt!398377 (not (= (bvand ((_ sign_extend 24) (select (arr!7103 (buf!6638 thiss!1754)) (currentByte!12168 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12163 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398375 () tuple2!21976)

(assert (=> d!86290 (= lt!398375 (tuple2!21977 (not (= (bvand ((_ sign_extend 24) (select (arr!7103 (buf!6638 thiss!1754)) (currentByte!12168 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12163 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11926 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86290 (validate_offset_bit!0 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))) ((_ sign_extend 32) (currentByte!12168 thiss!1754)) ((_ sign_extend 32) (currentBit!12163 thiss!1754)))))

(assert (=> d!86290 (= (readBit!0 thiss!1754) lt!398375)))

(declare-fun lt!398373 () (_ BitVec 64))

(declare-fun b!257080 () Bool)

(declare-fun lt!398372 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257080 (= e!178237 (= (bitIndex!0 (size!6116 (buf!6638 (_2!11926 (increaseBitIndex!0 thiss!1754)))) (currentByte!12168 (_2!11926 (increaseBitIndex!0 thiss!1754))) (currentBit!12163 (_2!11926 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!398372 lt!398373)))))

(assert (=> b!257080 (or (not (= (bvand lt!398372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398373 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398372 lt!398373) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257080 (= lt!398373 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257080 (= lt!398372 (bitIndex!0 (size!6116 (buf!6638 thiss!1754)) (currentByte!12168 thiss!1754) (currentBit!12163 thiss!1754)))))

(declare-fun lt!398374 () Bool)

(assert (=> b!257080 (= lt!398374 (not (= (bvand ((_ sign_extend 24) (select (arr!7103 (buf!6638 thiss!1754)) (currentByte!12168 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12163 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398378 () Bool)

(assert (=> b!257080 (= lt!398378 (not (= (bvand ((_ sign_extend 24) (select (arr!7103 (buf!6638 thiss!1754)) (currentByte!12168 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12163 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398376 () Bool)

(assert (=> b!257080 (= lt!398376 (not (= (bvand ((_ sign_extend 24) (select (arr!7103 (buf!6638 thiss!1754)) (currentByte!12168 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12163 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86290 res!215455) b!257080))

(declare-fun m!386637 () Bool)

(assert (=> d!86290 m!386637))

(declare-fun m!386639 () Bool)

(assert (=> d!86290 m!386639))

(declare-fun m!386641 () Bool)

(assert (=> d!86290 m!386641))

(declare-fun m!386643 () Bool)

(assert (=> d!86290 m!386643))

(assert (=> b!257080 m!386637))

(assert (=> b!257080 m!386641))

(declare-fun m!386645 () Bool)

(assert (=> b!257080 m!386645))

(assert (=> b!257080 m!386639))

(declare-fun m!386647 () Bool)

(assert (=> b!257080 m!386647))

(assert (=> b!257060 d!86290))

(declare-fun d!86300 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86300 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))) ((_ sign_extend 32) (currentByte!12168 thiss!1754)) ((_ sign_extend 32) (currentBit!12163 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))) ((_ sign_extend 32) (currentByte!12168 thiss!1754)) ((_ sign_extend 32) (currentBit!12163 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21827 () Bool)

(assert (= bs!21827 d!86300))

(declare-fun m!386649 () Bool)

(assert (=> bs!21827 m!386649))

(assert (=> b!257059 d!86300))

(check-sat (not d!86290) (not d!86300) (not d!86286) (not b!257080))
(check-sat)
(get-model)

(declare-fun d!86314 () Bool)

(declare-fun e!178246 () Bool)

(assert (=> d!86314 e!178246))

(declare-fun res!215467 () Bool)

(assert (=> d!86314 (=> (not res!215467) (not e!178246))))

(declare-fun lt!398432 () (_ BitVec 64))

(declare-fun lt!398433 () (_ BitVec 64))

(declare-fun lt!398431 () tuple2!21980)

(assert (=> d!86314 (= res!215467 (= (bvadd lt!398433 lt!398432) (bitIndex!0 (size!6116 (buf!6638 (_2!11926 lt!398431))) (currentByte!12168 (_2!11926 lt!398431)) (currentBit!12163 (_2!11926 lt!398431)))))))

(assert (=> d!86314 (or (not (= (bvand lt!398433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398432 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398433 lt!398432) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86314 (= lt!398432 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!86314 (= lt!398433 (bitIndex!0 (size!6116 (buf!6638 thiss!1754)) (currentByte!12168 thiss!1754) (currentBit!12163 thiss!1754)))))

(declare-fun Unit!18375 () Unit!18369)

(declare-fun Unit!18376 () Unit!18369)

(assert (=> d!86314 (= lt!398431 (ite (bvslt (currentBit!12163 thiss!1754) #b00000000000000000000000000000111) (tuple2!21981 Unit!18375 (BitStream!11155 (buf!6638 thiss!1754) (currentByte!12168 thiss!1754) (bvadd (currentBit!12163 thiss!1754) #b00000000000000000000000000000001))) (tuple2!21981 Unit!18376 (BitStream!11155 (buf!6638 thiss!1754) (bvadd (currentByte!12168 thiss!1754) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!86314 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))) ((_ sign_extend 32) (currentByte!12168 thiss!1754)) ((_ sign_extend 32) (currentBit!12163 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!86314 (= (increaseBitIndex!0 thiss!1754) lt!398431)))

(declare-fun b!257091 () Bool)

(declare-fun res!215466 () Bool)

(assert (=> b!257091 (=> (not res!215466) (not e!178246))))

(declare-fun lt!398435 () (_ BitVec 64))

(declare-fun lt!398434 () (_ BitVec 64))

(assert (=> b!257091 (= res!215466 (= (bvsub lt!398435 lt!398434) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!257091 (or (= (bvand lt!398435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398434 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398435 lt!398434) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257091 (= lt!398434 (remainingBits!0 ((_ sign_extend 32) (size!6116 (buf!6638 (_2!11926 lt!398431)))) ((_ sign_extend 32) (currentByte!12168 (_2!11926 lt!398431))) ((_ sign_extend 32) (currentBit!12163 (_2!11926 lt!398431)))))))

(assert (=> b!257091 (= lt!398435 (remainingBits!0 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))) ((_ sign_extend 32) (currentByte!12168 thiss!1754)) ((_ sign_extend 32) (currentBit!12163 thiss!1754))))))

(declare-fun b!257092 () Bool)

(assert (=> b!257092 (= e!178246 (= (size!6116 (buf!6638 thiss!1754)) (size!6116 (buf!6638 (_2!11926 lt!398431)))))))

(assert (= (and d!86314 res!215467) b!257091))

(assert (= (and b!257091 res!215466) b!257092))

(declare-fun m!386681 () Bool)

(assert (=> d!86314 m!386681))

(assert (=> d!86314 m!386647))

(assert (=> d!86314 m!386649))

(declare-fun m!386683 () Bool)

(assert (=> b!257091 m!386683))

(assert (=> b!257091 m!386649))

(assert (=> d!86290 d!86314))

(declare-fun d!86316 () Bool)

(assert (=> d!86316 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))) ((_ sign_extend 32) (currentByte!12168 thiss!1754)) ((_ sign_extend 32) (currentBit!12163 thiss!1754))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))) ((_ sign_extend 32) (currentByte!12168 thiss!1754)) ((_ sign_extend 32) (currentBit!12163 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21831 () Bool)

(assert (= bs!21831 d!86316))

(assert (=> bs!21831 m!386649))

(assert (=> d!86290 d!86316))

(declare-fun d!86318 () Bool)

(assert (=> d!86318 (= (remainingBits!0 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))) ((_ sign_extend 32) (currentByte!12168 thiss!1754)) ((_ sign_extend 32) (currentBit!12163 thiss!1754))) (bvsub (bvmul ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12168 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12163 thiss!1754)))))))

(assert (=> d!86300 d!86318))

(declare-fun d!86320 () Bool)

(assert (=> d!86320 (= (invariant!0 (currentBit!12163 thiss!1754) (currentByte!12168 thiss!1754) (size!6116 (buf!6638 thiss!1754))) (and (bvsge (currentBit!12163 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12163 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12168 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12168 thiss!1754) (size!6116 (buf!6638 thiss!1754))) (and (= (currentBit!12163 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12168 thiss!1754) (size!6116 (buf!6638 thiss!1754)))))))))

(assert (=> d!86286 d!86320))

(declare-fun d!86322 () Bool)

(declare-fun e!178249 () Bool)

(assert (=> d!86322 e!178249))

(declare-fun res!215472 () Bool)

(assert (=> d!86322 (=> (not res!215472) (not e!178249))))

(declare-fun lt!398453 () (_ BitVec 64))

(declare-fun lt!398451 () (_ BitVec 64))

(declare-fun lt!398452 () (_ BitVec 64))

(assert (=> d!86322 (= res!215472 (= lt!398452 (bvsub lt!398451 lt!398453)))))

(assert (=> d!86322 (or (= (bvand lt!398451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398453 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398451 lt!398453) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86322 (= lt!398453 (remainingBits!0 ((_ sign_extend 32) (size!6116 (buf!6638 (_2!11926 (increaseBitIndex!0 thiss!1754))))) ((_ sign_extend 32) (currentByte!12168 (_2!11926 (increaseBitIndex!0 thiss!1754)))) ((_ sign_extend 32) (currentBit!12163 (_2!11926 (increaseBitIndex!0 thiss!1754))))))))

(declare-fun lt!398449 () (_ BitVec 64))

(declare-fun lt!398450 () (_ BitVec 64))

(assert (=> d!86322 (= lt!398451 (bvmul lt!398449 lt!398450))))

(assert (=> d!86322 (or (= lt!398449 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398450 (bvsdiv (bvmul lt!398449 lt!398450) lt!398449)))))

(assert (=> d!86322 (= lt!398450 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86322 (= lt!398449 ((_ sign_extend 32) (size!6116 (buf!6638 (_2!11926 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86322 (= lt!398452 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12168 (_2!11926 (increaseBitIndex!0 thiss!1754)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12163 (_2!11926 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86322 (invariant!0 (currentBit!12163 (_2!11926 (increaseBitIndex!0 thiss!1754))) (currentByte!12168 (_2!11926 (increaseBitIndex!0 thiss!1754))) (size!6116 (buf!6638 (_2!11926 (increaseBitIndex!0 thiss!1754)))))))

(assert (=> d!86322 (= (bitIndex!0 (size!6116 (buf!6638 (_2!11926 (increaseBitIndex!0 thiss!1754)))) (currentByte!12168 (_2!11926 (increaseBitIndex!0 thiss!1754))) (currentBit!12163 (_2!11926 (increaseBitIndex!0 thiss!1754)))) lt!398452)))

(declare-fun b!257097 () Bool)

(declare-fun res!215473 () Bool)

(assert (=> b!257097 (=> (not res!215473) (not e!178249))))

(assert (=> b!257097 (= res!215473 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398452))))

(declare-fun b!257098 () Bool)

(declare-fun lt!398448 () (_ BitVec 64))

(assert (=> b!257098 (= e!178249 (bvsle lt!398452 (bvmul lt!398448 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257098 (or (= lt!398448 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398448 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398448)))))

(assert (=> b!257098 (= lt!398448 ((_ sign_extend 32) (size!6116 (buf!6638 (_2!11926 (increaseBitIndex!0 thiss!1754))))))))

(assert (= (and d!86322 res!215472) b!257097))

(assert (= (and b!257097 res!215473) b!257098))

(declare-fun m!386685 () Bool)

(assert (=> d!86322 m!386685))

(declare-fun m!386687 () Bool)

(assert (=> d!86322 m!386687))

(assert (=> b!257080 d!86322))

(assert (=> b!257080 d!86314))

(declare-fun d!86326 () Bool)

(declare-fun e!178250 () Bool)

(assert (=> d!86326 e!178250))

(declare-fun res!215474 () Bool)

(assert (=> d!86326 (=> (not res!215474) (not e!178250))))

(declare-fun lt!398459 () (_ BitVec 64))

(declare-fun lt!398457 () (_ BitVec 64))

(declare-fun lt!398458 () (_ BitVec 64))

(assert (=> d!86326 (= res!215474 (= lt!398458 (bvsub lt!398457 lt!398459)))))

(assert (=> d!86326 (or (= (bvand lt!398457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398459 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398457 lt!398459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86326 (= lt!398459 (remainingBits!0 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))) ((_ sign_extend 32) (currentByte!12168 thiss!1754)) ((_ sign_extend 32) (currentBit!12163 thiss!1754))))))

(declare-fun lt!398455 () (_ BitVec 64))

(declare-fun lt!398456 () (_ BitVec 64))

(assert (=> d!86326 (= lt!398457 (bvmul lt!398455 lt!398456))))

(assert (=> d!86326 (or (= lt!398455 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398456 (bvsdiv (bvmul lt!398455 lt!398456) lt!398455)))))

(assert (=> d!86326 (= lt!398456 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86326 (= lt!398455 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))))))

(assert (=> d!86326 (= lt!398458 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12168 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12163 thiss!1754))))))

(assert (=> d!86326 (invariant!0 (currentBit!12163 thiss!1754) (currentByte!12168 thiss!1754) (size!6116 (buf!6638 thiss!1754)))))

(assert (=> d!86326 (= (bitIndex!0 (size!6116 (buf!6638 thiss!1754)) (currentByte!12168 thiss!1754) (currentBit!12163 thiss!1754)) lt!398458)))

(declare-fun b!257099 () Bool)

(declare-fun res!215475 () Bool)

(assert (=> b!257099 (=> (not res!215475) (not e!178250))))

(assert (=> b!257099 (= res!215475 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398458))))

(declare-fun b!257100 () Bool)

(declare-fun lt!398454 () (_ BitVec 64))

(assert (=> b!257100 (= e!178250 (bvsle lt!398458 (bvmul lt!398454 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257100 (or (= lt!398454 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398454 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398454)))))

(assert (=> b!257100 (= lt!398454 ((_ sign_extend 32) (size!6116 (buf!6638 thiss!1754))))))

(assert (= (and d!86326 res!215474) b!257099))

(assert (= (and b!257099 res!215475) b!257100))

(assert (=> d!86326 m!386649))

(assert (=> d!86326 m!386633))

(assert (=> b!257080 d!86326))

(check-sat (not d!86314) (not d!86322) (not b!257091) (not d!86326) (not d!86316))
