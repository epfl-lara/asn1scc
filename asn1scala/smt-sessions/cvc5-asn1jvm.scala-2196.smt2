; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55696 () Bool)

(assert start!55696)

(declare-fun b!259037 () Bool)

(declare-fun res!216995 () Bool)

(declare-fun e!179696 () Bool)

(assert (=> b!259037 (=> (not res!216995) (not e!179696))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259037 (= res!216995 (not (= from!526 nBits!535)))))

(declare-fun b!259038 () Bool)

(declare-fun e!179695 () Bool)

(declare-datatypes ((array!14139 0))(
  ( (array!14140 (arr!7180 (Array (_ BitVec 32) (_ BitVec 8))) (size!6193 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11308 0))(
  ( (BitStream!11309 (buf!6715 array!14139) (currentByte!12344 (_ BitVec 32)) (currentBit!12339 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11308)

(declare-fun array_inv!5934 (array!14139) Bool)

(assert (=> b!259038 (= e!179695 (array_inv!5934 (buf!6715 thiss!1754)))))

(declare-fun b!259039 () Bool)

(declare-fun res!216993 () Bool)

(assert (=> b!259039 (=> (not res!216993) (not e!179696))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259039 (= res!216993 (validate_offset_bits!1 ((_ sign_extend 32) (size!6193 (buf!6715 thiss!1754))) ((_ sign_extend 32) (currentByte!12344 thiss!1754)) ((_ sign_extend 32) (currentBit!12339 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259040 () Bool)

(declare-fun e!179694 () Bool)

(declare-fun e!179698 () Bool)

(assert (=> b!259040 (= e!179694 e!179698)))

(declare-fun res!216997 () Bool)

(assert (=> b!259040 (=> res!216997 e!179698)))

(declare-datatypes ((tuple2!22172 0))(
  ( (tuple2!22173 (_1!12022 Bool) (_2!12022 BitStream!11308)) )
))
(declare-fun lt!400847 () tuple2!22172)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259040 (= res!216997 (bvslt (bvsub (bvadd (bitIndex!0 (size!6193 (buf!6715 thiss!1754)) (currentByte!12344 thiss!1754) (currentBit!12339 thiss!1754)) nBits!535) from!526) (bitIndex!0 (size!6193 (buf!6715 (_2!12022 lt!400847))) (currentByte!12344 (_2!12022 lt!400847)) (currentBit!12339 (_2!12022 lt!400847)))))))

(declare-fun res!216996 () Bool)

(assert (=> start!55696 (=> (not res!216996) (not e!179696))))

(assert (=> start!55696 (= res!216996 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55696 e!179696))

(assert (=> start!55696 true))

(declare-fun inv!12 (BitStream!11308) Bool)

(assert (=> start!55696 (and (inv!12 thiss!1754) e!179695)))

(declare-fun b!259041 () Bool)

(assert (=> b!259041 (= e!179698 (or (not (= (buf!6715 thiss!1754) (buf!6715 (_2!12022 lt!400847)))) (= nBits!535 from!526)))))

(declare-fun b!259042 () Bool)

(assert (=> b!259042 (= e!179696 e!179694)))

(declare-fun res!216994 () Bool)

(assert (=> b!259042 (=> (not res!216994) (not e!179694))))

(declare-fun expected!109 () Bool)

(assert (=> b!259042 (= res!216994 (not (= (_1!12022 lt!400847) expected!109)))))

(declare-fun readBit!0 (BitStream!11308) tuple2!22172)

(assert (=> b!259042 (= lt!400847 (readBit!0 thiss!1754))))

(assert (= (and start!55696 res!216996) b!259039))

(assert (= (and b!259039 res!216993) b!259037))

(assert (= (and b!259037 res!216995) b!259042))

(assert (= (and b!259042 res!216994) b!259040))

(assert (= (and b!259040 (not res!216997)) b!259041))

(assert (= start!55696 b!259038))

(declare-fun m!388379 () Bool)

(assert (=> b!259038 m!388379))

(declare-fun m!388381 () Bool)

(assert (=> b!259040 m!388381))

(declare-fun m!388383 () Bool)

(assert (=> b!259040 m!388383))

(declare-fun m!388385 () Bool)

(assert (=> start!55696 m!388385))

(declare-fun m!388387 () Bool)

(assert (=> b!259039 m!388387))

(declare-fun m!388389 () Bool)

(assert (=> b!259042 m!388389))

(push 1)

(assert (not b!259038))

(assert (not start!55696))

(assert (not b!259042))

(assert (not b!259039))

(assert (not b!259040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86934 () Bool)

(declare-fun e!179741 () Bool)

(assert (=> d!86934 e!179741))

(declare-fun res!217042 () Bool)

(assert (=> d!86934 (=> (not res!217042) (not e!179741))))

(declare-fun lt!400909 () (_ BitVec 64))

(declare-fun lt!400906 () (_ BitVec 64))

(declare-fun lt!400907 () (_ BitVec 64))

(assert (=> d!86934 (= res!217042 (= lt!400906 (bvsub lt!400907 lt!400909)))))

(assert (=> d!86934 (or (= (bvand lt!400907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400909 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400907 lt!400909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86934 (= lt!400909 (remainingBits!0 ((_ sign_extend 32) (size!6193 (buf!6715 thiss!1754))) ((_ sign_extend 32) (currentByte!12344 thiss!1754)) ((_ sign_extend 32) (currentBit!12339 thiss!1754))))))

(declare-fun lt!400905 () (_ BitVec 64))

(declare-fun lt!400904 () (_ BitVec 64))

(assert (=> d!86934 (= lt!400907 (bvmul lt!400905 lt!400904))))

(assert (=> d!86934 (or (= lt!400905 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400904 (bvsdiv (bvmul lt!400905 lt!400904) lt!400905)))))

(assert (=> d!86934 (= lt!400904 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86934 (= lt!400905 ((_ sign_extend 32) (size!6193 (buf!6715 thiss!1754))))))

(assert (=> d!86934 (= lt!400906 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12344 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12339 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86934 (invariant!0 (currentBit!12339 thiss!1754) (currentByte!12344 thiss!1754) (size!6193 (buf!6715 thiss!1754)))))

(assert (=> d!86934 (= (bitIndex!0 (size!6193 (buf!6715 thiss!1754)) (currentByte!12344 thiss!1754) (currentBit!12339 thiss!1754)) lt!400906)))

(declare-fun b!259093 () Bool)

(declare-fun res!217043 () Bool)

(assert (=> b!259093 (=> (not res!217043) (not e!179741))))

(assert (=> b!259093 (= res!217043 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400906))))

(declare-fun b!259094 () Bool)

(declare-fun lt!400908 () (_ BitVec 64))

(assert (=> b!259094 (= e!179741 (bvsle lt!400906 (bvmul lt!400908 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259094 (or (= lt!400908 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400908 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400908)))))

(assert (=> b!259094 (= lt!400908 ((_ sign_extend 32) (size!6193 (buf!6715 thiss!1754))))))

(assert (= (and d!86934 res!217042) b!259093))

(assert (= (and b!259093 res!217043) b!259094))

(declare-fun m!388423 () Bool)

(assert (=> d!86934 m!388423))

(declare-fun m!388425 () Bool)

(assert (=> d!86934 m!388425))

(assert (=> b!259040 d!86934))

(declare-fun d!86936 () Bool)

(declare-fun e!179742 () Bool)

(assert (=> d!86936 e!179742))

(declare-fun res!217044 () Bool)

(assert (=> d!86936 (=> (not res!217044) (not e!179742))))

(declare-fun lt!400915 () (_ BitVec 64))

(declare-fun lt!400913 () (_ BitVec 64))

(declare-fun lt!400912 () (_ BitVec 64))

(assert (=> d!86936 (= res!217044 (= lt!400912 (bvsub lt!400913 lt!400915)))))

(assert (=> d!86936 (or (= (bvand lt!400913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400915 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400913 lt!400915) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86936 (= lt!400915 (remainingBits!0 ((_ sign_extend 32) (size!6193 (buf!6715 (_2!12022 lt!400847)))) ((_ sign_extend 32) (currentByte!12344 (_2!12022 lt!400847))) ((_ sign_extend 32) (currentBit!12339 (_2!12022 lt!400847)))))))

(declare-fun lt!400911 () (_ BitVec 64))

(declare-fun lt!400910 () (_ BitVec 64))

(assert (=> d!86936 (= lt!400913 (bvmul lt!400911 lt!400910))))

(assert (=> d!86936 (or (= lt!400911 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400910 (bvsdiv (bvmul lt!400911 lt!400910) lt!400911)))))

(assert (=> d!86936 (= lt!400910 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86936 (= lt!400911 ((_ sign_extend 32) (size!6193 (buf!6715 (_2!12022 lt!400847)))))))

(assert (=> d!86936 (= lt!400912 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12344 (_2!12022 lt!400847))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12339 (_2!12022 lt!400847)))))))

(assert (=> d!86936 (invariant!0 (currentBit!12339 (_2!12022 lt!400847)) (currentByte!12344 (_2!12022 lt!400847)) (size!6193 (buf!6715 (_2!12022 lt!400847))))))

(assert (=> d!86936 (= (bitIndex!0 (size!6193 (buf!6715 (_2!12022 lt!400847))) (currentByte!12344 (_2!12022 lt!400847)) (currentBit!12339 (_2!12022 lt!400847))) lt!400912)))

(declare-fun b!259095 () Bool)

(declare-fun res!217045 () Bool)

(assert (=> b!259095 (=> (not res!217045) (not e!179742))))

(assert (=> b!259095 (= res!217045 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400912))))

(declare-fun b!259096 () Bool)

(declare-fun lt!400914 () (_ BitVec 64))

(assert (=> b!259096 (= e!179742 (bvsle lt!400912 (bvmul lt!400914 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259096 (or (= lt!400914 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400914 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400914)))))

(assert (=> b!259096 (= lt!400914 ((_ sign_extend 32) (size!6193 (buf!6715 (_2!12022 lt!400847)))))))

(assert (= (and d!86936 res!217044) b!259095))

(assert (= (and b!259095 res!217045) b!259096))

(declare-fun m!388427 () Bool)

(assert (=> d!86936 m!388427))

(declare-fun m!388429 () Bool)

(assert (=> d!86936 m!388429))

(assert (=> b!259040 d!86936))

(declare-fun d!86938 () Bool)

(assert (=> d!86938 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6193 (buf!6715 thiss!1754))) ((_ sign_extend 32) (currentByte!12344 thiss!1754)) ((_ sign_extend 32) (currentBit!12339 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6193 (buf!6715 thiss!1754))) ((_ sign_extend 32) (currentByte!12344 thiss!1754)) ((_ sign_extend 32) (currentBit!12339 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22012 () Bool)

(assert (= bs!22012 d!86938))

(assert (=> bs!22012 m!388423))

(assert (=> b!259039 d!86938))

(declare-fun d!86940 () Bool)

(assert (=> d!86940 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12339 thiss!1754) (currentByte!12344 thiss!1754) (size!6193 (buf!6715 thiss!1754))))))

(declare-fun bs!22013 () Bool)

(assert (= bs!22013 d!86940))

(assert (=> bs!22013 m!388425))

(assert (=> start!55696 d!86940))

(declare-fun d!86944 () Bool)

(assert (=> d!86944 (= (array_inv!5934 (buf!6715 thiss!1754)) (bvsge (size!6193 (buf!6715 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259038 d!86944))

(declare-fun d!86946 () Bool)

(declare-fun e!179755 () Bool)

(assert (=> d!86946 e!179755))

(declare-fun res!217057 () Bool)

(assert (=> d!86946 (=> (not res!217057) (not e!179755))))

(declare-datatypes ((Unit!18449 0))(
  ( (Unit!18450) )
))
(declare-datatypes ((tuple2!22180 0))(
  ( (tuple2!22181 (_1!12026 Unit!18449) (_2!12026 BitStream!11308)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11308) tuple2!22180)

(assert (=> d!86946 (= res!217057 (= (buf!6715 (_2!12026 (increaseBitIndex!0 thiss!1754))) (buf!6715 thiss!1754)))))

(declare-fun lt!400966 () Bool)

(assert (=> d!86946 (= lt!400966 (not (= (bvand ((_ sign_extend 24) (select (arr!7180 (buf!6715 thiss!1754)) (currentByte!12344 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12339 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400963 () tuple2!22172)

(assert (=> d!86946 (= lt!400963 (tuple2!22173 (not (= (bvand ((_ sign_extend 24) (select (arr!7180 (buf!6715 thiss!1754)) (currentByte!12344 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12339 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12026 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86946 (validate_offset_bit!0 ((_ sign_extend 32) (size!6193 (buf!6715 thiss!1754))) ((_ sign_extend 32) (currentByte!12344 thiss!1754)) ((_ sign_extend 32) (currentBit!12339 thiss!1754)))))

(assert (=> d!86946 (= (readBit!0 thiss!1754) lt!400963)))

(declare-fun lt!400961 () (_ BitVec 64))

(declare-fun lt!400965 () (_ BitVec 64))

(declare-fun b!259108 () Bool)

(assert (=> b!259108 (= e!179755 (= (bitIndex!0 (size!6193 (buf!6715 (_2!12026 (increaseBitIndex!0 thiss!1754)))) (currentByte!12344 (_2!12026 (increaseBitIndex!0 thiss!1754))) (currentBit!12339 (_2!12026 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400961 lt!400965)))))

(assert (=> b!259108 (or (not (= (bvand lt!400961 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400965 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400961 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400961 lt!400965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259108 (= lt!400965 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259108 (= lt!400961 (bitIndex!0 (size!6193 (buf!6715 thiss!1754)) (currentByte!12344 thiss!1754) (currentBit!12339 thiss!1754)))))

(declare-fun lt!400964 () Bool)

(assert (=> b!259108 (= lt!400964 (not (= (bvand ((_ sign_extend 24) (select (arr!7180 (buf!6715 thiss!1754)) (currentByte!12344 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12339 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400962 () Bool)

(assert (=> b!259108 (= lt!400962 (not (= (bvand ((_ sign_extend 24) (select (arr!7180 (buf!6715 thiss!1754)) (currentByte!12344 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12339 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400967 () Bool)

(assert (=> b!259108 (= lt!400967 (not (= (bvand ((_ sign_extend 24) (select (arr!7180 (buf!6715 thiss!1754)) (currentByte!12344 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12339 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86946 res!217057) b!259108))

(declare-fun m!388449 () Bool)

(assert (=> d!86946 m!388449))

(declare-fun m!388451 () Bool)

(assert (=> d!86946 m!388451))

(declare-fun m!388453 () Bool)

(assert (=> d!86946 m!388453))

(declare-fun m!388455 () Bool)

(assert (=> d!86946 m!388455))

(assert (=> b!259108 m!388451))

(declare-fun m!388457 () Bool)

(assert (=> b!259108 m!388457))

(assert (=> b!259108 m!388381))

(assert (=> b!259108 m!388453))

(assert (=> b!259108 m!388449))

(assert (=> b!259042 d!86946))

(push 1)

(assert (not d!86940))

(assert (not d!86934))

(assert (not d!86946))

(assert (not d!86936))

(assert (not d!86938))

(assert (not b!259108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

