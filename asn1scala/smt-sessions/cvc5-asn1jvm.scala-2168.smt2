; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55024 () Bool)

(assert start!55024)

(declare-fun b!256989 () Bool)

(declare-fun res!215381 () Bool)

(declare-fun e!178145 () Bool)

(assert (=> b!256989 (=> (not res!215381) (not e!178145))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13938 0))(
  ( (array!13939 (arr!7099 (Array (_ BitVec 32) (_ BitVec 8))) (size!6112 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11146 0))(
  ( (BitStream!11147 (buf!6634 array!13938) (currentByte!12158 (_ BitVec 32)) (currentBit!12153 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11146)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256989 (= res!215381 (validate_offset_bits!1 ((_ sign_extend 32) (size!6112 (buf!6634 thiss!1754))) ((_ sign_extend 32) (currentByte!12158 thiss!1754)) ((_ sign_extend 32) (currentBit!12153 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256990 () Bool)

(declare-fun res!215382 () Bool)

(assert (=> b!256990 (=> (not res!215382) (not e!178145))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!21962 0))(
  ( (tuple2!21963 (_1!11917 Bool) (_2!11917 BitStream!11146)) )
))
(declare-fun readBit!0 (BitStream!11146) tuple2!21962)

(assert (=> b!256990 (= res!215382 (not (= (_1!11917 (readBit!0 thiss!1754)) expected!109)))))

(declare-fun b!256991 () Bool)

(declare-fun e!178147 () Bool)

(declare-fun array_inv!5853 (array!13938) Bool)

(assert (=> b!256991 (= e!178147 (array_inv!5853 (buf!6634 thiss!1754)))))

(declare-fun res!215380 () Bool)

(assert (=> start!55024 (=> (not res!215380) (not e!178145))))

(assert (=> start!55024 (= res!215380 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55024 e!178145))

(assert (=> start!55024 true))

(declare-fun inv!12 (BitStream!11146) Bool)

(assert (=> start!55024 (and (inv!12 thiss!1754) e!178147)))

(declare-fun b!256992 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256992 (= e!178145 (not (invariant!0 (currentBit!12153 thiss!1754) (currentByte!12158 thiss!1754) (size!6112 (buf!6634 thiss!1754)))))))

(declare-fun b!256993 () Bool)

(declare-fun res!215383 () Bool)

(assert (=> b!256993 (=> (not res!215383) (not e!178145))))

(assert (=> b!256993 (= res!215383 (not (= from!526 nBits!535)))))

(assert (= (and start!55024 res!215380) b!256989))

(assert (= (and b!256989 res!215381) b!256993))

(assert (= (and b!256993 res!215383) b!256990))

(assert (= (and b!256990 res!215382) b!256992))

(assert (= start!55024 b!256991))

(declare-fun m!386531 () Bool)

(assert (=> start!55024 m!386531))

(declare-fun m!386533 () Bool)

(assert (=> b!256989 m!386533))

(declare-fun m!386535 () Bool)

(assert (=> b!256991 m!386535))

(declare-fun m!386537 () Bool)

(assert (=> b!256990 m!386537))

(declare-fun m!386539 () Bool)

(assert (=> b!256992 m!386539))

(push 1)

(assert (not b!256990))

(assert (not b!256992))

(assert (not start!55024))

(assert (not b!256989))

(assert (not b!256991))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86253 () Bool)

(assert (=> d!86253 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12153 thiss!1754) (currentByte!12158 thiss!1754) (size!6112 (buf!6634 thiss!1754))))))

(declare-fun bs!21817 () Bool)

(assert (= bs!21817 d!86253))

(assert (=> bs!21817 m!386539))

(assert (=> start!55024 d!86253))

(declare-fun d!86258 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86258 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6112 (buf!6634 thiss!1754))) ((_ sign_extend 32) (currentByte!12158 thiss!1754)) ((_ sign_extend 32) (currentBit!12153 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6112 (buf!6634 thiss!1754))) ((_ sign_extend 32) (currentByte!12158 thiss!1754)) ((_ sign_extend 32) (currentBit!12153 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21818 () Bool)

(assert (= bs!21818 d!86258))

(declare-fun m!386563 () Bool)

(assert (=> bs!21818 m!386563))

(assert (=> b!256989 d!86258))

(declare-fun d!86260 () Bool)

(assert (=> d!86260 (= (invariant!0 (currentBit!12153 thiss!1754) (currentByte!12158 thiss!1754) (size!6112 (buf!6634 thiss!1754))) (and (bvsge (currentBit!12153 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12153 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12158 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12158 thiss!1754) (size!6112 (buf!6634 thiss!1754))) (and (= (currentBit!12153 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12158 thiss!1754) (size!6112 (buf!6634 thiss!1754)))))))))

(assert (=> b!256992 d!86260))

(declare-fun d!86264 () Bool)

(assert (=> d!86264 (= (array_inv!5853 (buf!6634 thiss!1754)) (bvsge (size!6112 (buf!6634 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256991 d!86264))

(declare-fun d!86268 () Bool)

(declare-fun e!178183 () Bool)

(assert (=> d!86268 e!178183))

(declare-fun res!215413 () Bool)

(assert (=> d!86268 (=> (not res!215413) (not e!178183))))

(declare-datatypes ((Unit!18365 0))(
  ( (Unit!18366) )
))
(declare-datatypes ((tuple2!21970 0))(
  ( (tuple2!21971 (_1!11921 Unit!18365) (_2!11921 BitStream!11146)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11146) tuple2!21970)

(assert (=> d!86268 (= res!215413 (= (buf!6634 (_2!11921 (increaseBitIndex!0 thiss!1754))) (buf!6634 thiss!1754)))))

(declare-fun lt!398326 () Bool)

(assert (=> d!86268 (= lt!398326 (not (= (bvand ((_ sign_extend 24) (select (arr!7099 (buf!6634 thiss!1754)) (currentByte!12158 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12153 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398323 () tuple2!21962)

(assert (=> d!86268 (= lt!398323 (tuple2!21963 (not (= (bvand ((_ sign_extend 24) (select (arr!7099 (buf!6634 thiss!1754)) (currentByte!12158 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12153 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11921 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86268 (validate_offset_bit!0 ((_ sign_extend 32) (size!6112 (buf!6634 thiss!1754))) ((_ sign_extend 32) (currentByte!12158 thiss!1754)) ((_ sign_extend 32) (currentBit!12153 thiss!1754)))))

(assert (=> d!86268 (= (readBit!0 thiss!1754) lt!398323)))

(declare-fun b!257029 () Bool)

(declare-fun lt!398322 () (_ BitVec 64))

(declare-fun lt!398324 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257029 (= e!178183 (= (bitIndex!0 (size!6112 (buf!6634 (_2!11921 (increaseBitIndex!0 thiss!1754)))) (currentByte!12158 (_2!11921 (increaseBitIndex!0 thiss!1754))) (currentBit!12153 (_2!11921 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!398324 lt!398322)))))

(assert (=> b!257029 (or (not (= (bvand lt!398324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398324 lt!398322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257029 (= lt!398322 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257029 (= lt!398324 (bitIndex!0 (size!6112 (buf!6634 thiss!1754)) (currentByte!12158 thiss!1754) (currentBit!12153 thiss!1754)))))

(declare-fun lt!398325 () Bool)

(assert (=> b!257029 (= lt!398325 (not (= (bvand ((_ sign_extend 24) (select (arr!7099 (buf!6634 thiss!1754)) (currentByte!12158 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12153 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398327 () Bool)

(assert (=> b!257029 (= lt!398327 (not (= (bvand ((_ sign_extend 24) (select (arr!7099 (buf!6634 thiss!1754)) (currentByte!12158 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12153 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398321 () Bool)

(assert (=> b!257029 (= lt!398321 (not (= (bvand ((_ sign_extend 24) (select (arr!7099 (buf!6634 thiss!1754)) (currentByte!12158 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12153 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86268 res!215413) b!257029))

(declare-fun m!386573 () Bool)

(assert (=> d!86268 m!386573))

(declare-fun m!386575 () Bool)

(assert (=> d!86268 m!386575))

(declare-fun m!386579 () Bool)

(assert (=> d!86268 m!386579))

(declare-fun m!386583 () Bool)

(assert (=> d!86268 m!386583))

(assert (=> b!257029 m!386573))

(declare-fun m!386585 () Bool)

(assert (=> b!257029 m!386585))

(declare-fun m!386587 () Bool)

(assert (=> b!257029 m!386587))

(assert (=> b!257029 m!386575))

(assert (=> b!257029 m!386579))

(assert (=> b!256990 d!86268))

(push 1)

(assert (not d!86253))

