; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55830 () Bool)

(assert start!55830)

(declare-fun b!259476 () Bool)

(declare-fun res!217357 () Bool)

(declare-fun e!180055 () Bool)

(assert (=> b!259476 (=> (not res!217357) (not e!180055))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14198 0))(
  ( (array!14199 (arr!7205 (Array (_ BitVec 32) (_ BitVec 8))) (size!6218 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11358 0))(
  ( (BitStream!11359 (buf!6740 array!14198) (currentByte!12384 (_ BitVec 32)) (currentBit!12379 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11358)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259476 (= res!217357 (validate_offset_bits!1 ((_ sign_extend 32) (size!6218 (buf!6740 thiss!1754))) ((_ sign_extend 32) (currentByte!12384 thiss!1754)) ((_ sign_extend 32) (currentBit!12379 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259477 () Bool)

(declare-fun e!180054 () Bool)

(declare-fun array_inv!5959 (array!14198) Bool)

(assert (=> b!259477 (= e!180054 (array_inv!5959 (buf!6740 thiss!1754)))))

(declare-fun b!259478 () Bool)

(declare-fun lt!401277 () (_ BitVec 64))

(declare-fun e!180053 () Bool)

(declare-fun lt!401279 () (_ BitVec 64))

(assert (=> b!259478 (= e!180053 (not (or (not (= lt!401279 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!401279 (bvand (bvadd lt!401277 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!259478 (= lt!401279 (bvand lt!401277 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259478 (= lt!401277 (bitIndex!0 (size!6218 (buf!6740 thiss!1754)) (currentByte!12384 thiss!1754) (currentBit!12379 thiss!1754)))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22240 0))(
  ( (tuple2!22241 (_1!12056 Bool) (_2!12056 BitStream!11358)) )
))
(declare-fun lt!401275 () tuple2!22240)

(declare-fun lt!401276 () tuple2!22240)

(declare-fun checkBitsLoop!0 (BitStream!11358 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22240)

(assert (=> b!259478 (= lt!401276 (checkBitsLoop!0 (_2!12056 lt!401275) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259478 (validate_offset_bits!1 ((_ sign_extend 32) (size!6218 (buf!6740 (_2!12056 lt!401275)))) ((_ sign_extend 32) (currentByte!12384 (_2!12056 lt!401275))) ((_ sign_extend 32) (currentBit!12379 (_2!12056 lt!401275))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18479 0))(
  ( (Unit!18480) )
))
(declare-fun lt!401278 () Unit!18479)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11358 BitStream!11358 (_ BitVec 64) (_ BitVec 64)) Unit!18479)

(assert (=> b!259478 (= lt!401278 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12056 lt!401275) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259479 () Bool)

(declare-fun res!217360 () Bool)

(assert (=> b!259479 (=> (not res!217360) (not e!180055))))

(assert (=> b!259479 (= res!217360 (not (= from!526 nBits!535)))))

(declare-fun b!259480 () Bool)

(assert (=> b!259480 (= e!180055 e!180053)))

(declare-fun res!217359 () Bool)

(assert (=> b!259480 (=> (not res!217359) (not e!180053))))

(assert (=> b!259480 (= res!217359 (= (_1!12056 lt!401275) expected!109))))

(declare-fun readBit!0 (BitStream!11358) tuple2!22240)

(assert (=> b!259480 (= lt!401275 (readBit!0 thiss!1754))))

(declare-fun res!217358 () Bool)

(assert (=> start!55830 (=> (not res!217358) (not e!180055))))

(assert (=> start!55830 (= res!217358 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55830 e!180055))

(assert (=> start!55830 true))

(declare-fun inv!12 (BitStream!11358) Bool)

(assert (=> start!55830 (and (inv!12 thiss!1754) e!180054)))

(assert (= (and start!55830 res!217358) b!259476))

(assert (= (and b!259476 res!217357) b!259479))

(assert (= (and b!259479 res!217360) b!259480))

(assert (= (and b!259480 res!217359) b!259478))

(assert (= start!55830 b!259477))

(declare-fun m!388791 () Bool)

(assert (=> b!259480 m!388791))

(declare-fun m!388793 () Bool)

(assert (=> b!259478 m!388793))

(declare-fun m!388795 () Bool)

(assert (=> b!259478 m!388795))

(declare-fun m!388797 () Bool)

(assert (=> b!259478 m!388797))

(declare-fun m!388799 () Bool)

(assert (=> b!259478 m!388799))

(declare-fun m!388801 () Bool)

(assert (=> start!55830 m!388801))

(declare-fun m!388803 () Bool)

(assert (=> b!259476 m!388803))

(declare-fun m!388805 () Bool)

(assert (=> b!259477 m!388805))

(check-sat (not b!259477) (not b!259480) (not b!259478) (not b!259476) (not start!55830))
(check-sat)
(get-model)

(declare-fun d!87040 () Bool)

(assert (=> d!87040 (= (array_inv!5959 (buf!6740 thiss!1754)) (bvsge (size!6218 (buf!6740 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259477 d!87040))

(declare-fun d!87042 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87042 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6218 (buf!6740 thiss!1754))) ((_ sign_extend 32) (currentByte!12384 thiss!1754)) ((_ sign_extend 32) (currentBit!12379 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6218 (buf!6740 thiss!1754))) ((_ sign_extend 32) (currentByte!12384 thiss!1754)) ((_ sign_extend 32) (currentBit!12379 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22053 () Bool)

(assert (= bs!22053 d!87042))

(declare-fun m!388823 () Bool)

(assert (=> bs!22053 m!388823))

(assert (=> b!259476 d!87042))

(declare-fun d!87044 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87044 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12379 thiss!1754) (currentByte!12384 thiss!1754) (size!6218 (buf!6740 thiss!1754))))))

(declare-fun bs!22054 () Bool)

(assert (= bs!22054 d!87044))

(declare-fun m!388825 () Bool)

(assert (=> bs!22054 m!388825))

(assert (=> start!55830 d!87044))

(declare-fun d!87046 () Bool)

(declare-fun e!180083 () Bool)

(assert (=> d!87046 e!180083))

(declare-fun res!217383 () Bool)

(assert (=> d!87046 (=> (not res!217383) (not e!180083))))

(declare-datatypes ((tuple2!22244 0))(
  ( (tuple2!22245 (_1!12058 Unit!18479) (_2!12058 BitStream!11358)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11358) tuple2!22244)

(assert (=> d!87046 (= res!217383 (= (buf!6740 (_2!12058 (increaseBitIndex!0 thiss!1754))) (buf!6740 thiss!1754)))))

(declare-fun lt!401334 () Bool)

(assert (=> d!87046 (= lt!401334 (not (= (bvand ((_ sign_extend 24) (select (arr!7205 (buf!6740 thiss!1754)) (currentByte!12384 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12379 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401336 () tuple2!22240)

(assert (=> d!87046 (= lt!401336 (tuple2!22241 (not (= (bvand ((_ sign_extend 24) (select (arr!7205 (buf!6740 thiss!1754)) (currentByte!12384 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12379 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12058 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87046 (validate_offset_bit!0 ((_ sign_extend 32) (size!6218 (buf!6740 thiss!1754))) ((_ sign_extend 32) (currentByte!12384 thiss!1754)) ((_ sign_extend 32) (currentBit!12379 thiss!1754)))))

(assert (=> d!87046 (= (readBit!0 thiss!1754) lt!401336)))

(declare-fun lt!401337 () (_ BitVec 64))

(declare-fun lt!401331 () (_ BitVec 64))

(declare-fun b!259504 () Bool)

(assert (=> b!259504 (= e!180083 (= (bitIndex!0 (size!6218 (buf!6740 (_2!12058 (increaseBitIndex!0 thiss!1754)))) (currentByte!12384 (_2!12058 (increaseBitIndex!0 thiss!1754))) (currentBit!12379 (_2!12058 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401337 lt!401331)))))

(assert (=> b!259504 (or (not (= (bvand lt!401337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401331 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401337 lt!401331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259504 (= lt!401331 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259504 (= lt!401337 (bitIndex!0 (size!6218 (buf!6740 thiss!1754)) (currentByte!12384 thiss!1754) (currentBit!12379 thiss!1754)))))

(declare-fun lt!401332 () Bool)

(assert (=> b!259504 (= lt!401332 (not (= (bvand ((_ sign_extend 24) (select (arr!7205 (buf!6740 thiss!1754)) (currentByte!12384 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12379 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401335 () Bool)

(assert (=> b!259504 (= lt!401335 (not (= (bvand ((_ sign_extend 24) (select (arr!7205 (buf!6740 thiss!1754)) (currentByte!12384 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12379 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401333 () Bool)

(assert (=> b!259504 (= lt!401333 (not (= (bvand ((_ sign_extend 24) (select (arr!7205 (buf!6740 thiss!1754)) (currentByte!12384 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12379 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87046 res!217383) b!259504))

(declare-fun m!388833 () Bool)

(assert (=> d!87046 m!388833))

(declare-fun m!388835 () Bool)

(assert (=> d!87046 m!388835))

(declare-fun m!388837 () Bool)

(assert (=> d!87046 m!388837))

(declare-fun m!388839 () Bool)

(assert (=> d!87046 m!388839))

(assert (=> b!259504 m!388835))

(assert (=> b!259504 m!388837))

(declare-fun m!388841 () Bool)

(assert (=> b!259504 m!388841))

(assert (=> b!259504 m!388793))

(assert (=> b!259504 m!388833))

(assert (=> b!259480 d!87046))

(declare-fun d!87056 () Bool)

(declare-fun e!180087 () Bool)

(assert (=> d!87056 e!180087))

(declare-fun res!217390 () Bool)

(assert (=> d!87056 (=> (not res!217390) (not e!180087))))

(declare-fun lt!401372 () (_ BitVec 64))

(declare-fun lt!401369 () (_ BitVec 64))

(declare-fun lt!401371 () (_ BitVec 64))

(assert (=> d!87056 (= res!217390 (= lt!401369 (bvsub lt!401372 lt!401371)))))

(assert (=> d!87056 (or (= (bvand lt!401372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401371 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401372 lt!401371) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87056 (= lt!401371 (remainingBits!0 ((_ sign_extend 32) (size!6218 (buf!6740 thiss!1754))) ((_ sign_extend 32) (currentByte!12384 thiss!1754)) ((_ sign_extend 32) (currentBit!12379 thiss!1754))))))

(declare-fun lt!401367 () (_ BitVec 64))

(declare-fun lt!401370 () (_ BitVec 64))

(assert (=> d!87056 (= lt!401372 (bvmul lt!401367 lt!401370))))

(assert (=> d!87056 (or (= lt!401367 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401370 (bvsdiv (bvmul lt!401367 lt!401370) lt!401367)))))

(assert (=> d!87056 (= lt!401370 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87056 (= lt!401367 ((_ sign_extend 32) (size!6218 (buf!6740 thiss!1754))))))

(assert (=> d!87056 (= lt!401369 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12384 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12379 thiss!1754))))))

(assert (=> d!87056 (invariant!0 (currentBit!12379 thiss!1754) (currentByte!12384 thiss!1754) (size!6218 (buf!6740 thiss!1754)))))

(assert (=> d!87056 (= (bitIndex!0 (size!6218 (buf!6740 thiss!1754)) (currentByte!12384 thiss!1754) (currentBit!12379 thiss!1754)) lt!401369)))

(declare-fun b!259512 () Bool)

(declare-fun res!217389 () Bool)

(assert (=> b!259512 (=> (not res!217389) (not e!180087))))

(assert (=> b!259512 (= res!217389 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401369))))

(declare-fun b!259513 () Bool)

(declare-fun lt!401368 () (_ BitVec 64))

(assert (=> b!259513 (= e!180087 (bvsle lt!401369 (bvmul lt!401368 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259513 (or (= lt!401368 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401368 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401368)))))

(assert (=> b!259513 (= lt!401368 ((_ sign_extend 32) (size!6218 (buf!6740 thiss!1754))))))

(assert (= (and d!87056 res!217390) b!259512))

(assert (= (and b!259512 res!217389) b!259513))

(assert (=> d!87056 m!388823))

(assert (=> d!87056 m!388825))

(assert (=> b!259478 d!87056))

(declare-fun b!259582 () Bool)

(declare-fun e!180135 () tuple2!22240)

(assert (=> b!259582 (= e!180135 (tuple2!22241 true (_2!12056 lt!401275)))))

(declare-fun b!259583 () Bool)

(declare-fun res!217435 () Bool)

(declare-fun e!180131 () Bool)

(assert (=> b!259583 (=> (not res!217435) (not e!180131))))

(declare-fun lt!401491 () tuple2!22240)

(assert (=> b!259583 (= res!217435 (and (= (buf!6740 (_2!12056 lt!401275)) (buf!6740 (_2!12056 lt!401491))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12056 lt!401491))))))

(declare-fun d!87062 () Bool)

(assert (=> d!87062 e!180131))

(declare-fun res!217434 () Bool)

(assert (=> d!87062 (=> (not res!217434) (not e!180131))))

(declare-fun lt!401488 () (_ BitVec 64))

(assert (=> d!87062 (= res!217434 (bvsge (bvsub lt!401488 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6218 (buf!6740 (_2!12056 lt!401491))) (currentByte!12384 (_2!12056 lt!401491)) (currentBit!12379 (_2!12056 lt!401491)))))))

(assert (=> d!87062 (or (= (bvand lt!401488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401488 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401490 () (_ BitVec 64))

(assert (=> d!87062 (= lt!401488 (bvadd lt!401490 nBits!535))))

(assert (=> d!87062 (or (not (= (bvand lt!401490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401490 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87062 (= lt!401490 (bitIndex!0 (size!6218 (buf!6740 (_2!12056 lt!401275))) (currentByte!12384 (_2!12056 lt!401275)) (currentBit!12379 (_2!12056 lt!401275))))))

(assert (=> d!87062 (= lt!401491 e!180135)))

(declare-fun c!11910 () Bool)

(assert (=> d!87062 (= c!11910 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87062 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87062 (= (checkBitsLoop!0 (_2!12056 lt!401275) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!401491)))

(declare-fun b!259584 () Bool)

(declare-fun res!217436 () Bool)

(assert (=> b!259584 (=> (not res!217436) (not e!180131))))

(declare-fun e!180132 () Bool)

(assert (=> b!259584 (= res!217436 e!180132)))

(declare-fun res!217437 () Bool)

(assert (=> b!259584 (=> res!217437 e!180132)))

(assert (=> b!259584 (= res!217437 (not (_1!12056 lt!401491)))))

(declare-fun b!259585 () Bool)

(declare-fun e!180133 () Bool)

(declare-datatypes ((tuple2!22250 0))(
  ( (tuple2!22251 (_1!12061 BitStream!11358) (_2!12061 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11358) tuple2!22250)

(assert (=> b!259585 (= e!180133 (= expected!109 (_2!12061 (readBitPure!0 (_2!12056 lt!401275)))))))

(declare-fun b!259586 () Bool)

(declare-fun e!180134 () tuple2!22240)

(declare-fun lt!401486 () tuple2!22240)

(assert (=> b!259586 (= e!180134 (tuple2!22241 false (_2!12056 lt!401486)))))

(declare-fun b!259587 () Bool)

(declare-fun lt!401482 () (_ BitVec 64))

(assert (=> b!259587 (= e!180132 (= (bvsub lt!401482 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6218 (buf!6740 (_2!12056 lt!401491))) (currentByte!12384 (_2!12056 lt!401491)) (currentBit!12379 (_2!12056 lt!401491)))))))

(assert (=> b!259587 (or (= (bvand lt!401482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401482 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401484 () (_ BitVec 64))

(assert (=> b!259587 (= lt!401482 (bvadd lt!401484 nBits!535))))

(assert (=> b!259587 (or (not (= (bvand lt!401484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401484 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259587 (= lt!401484 (bitIndex!0 (size!6218 (buf!6740 (_2!12056 lt!401275))) (currentByte!12384 (_2!12056 lt!401275)) (currentBit!12379 (_2!12056 lt!401275))))))

(declare-fun b!259588 () Bool)

(assert (=> b!259588 (= e!180131 e!180133)))

(declare-fun res!217433 () Bool)

(assert (=> b!259588 (=> res!217433 e!180133)))

(assert (=> b!259588 (= res!217433 (or (not (_1!12056 lt!401491)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!259589 () Bool)

(declare-fun lt!401483 () tuple2!22240)

(assert (=> b!259589 (= lt!401483 (checkBitsLoop!0 (_2!12056 lt!401486) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!401481 () Unit!18479)

(declare-fun lt!401487 () Unit!18479)

(assert (=> b!259589 (= lt!401481 lt!401487)))

(declare-fun lt!401489 () (_ BitVec 64))

(declare-fun lt!401485 () (_ BitVec 64))

(assert (=> b!259589 (validate_offset_bits!1 ((_ sign_extend 32) (size!6218 (buf!6740 (_2!12056 lt!401486)))) ((_ sign_extend 32) (currentByte!12384 (_2!12056 lt!401486))) ((_ sign_extend 32) (currentBit!12379 (_2!12056 lt!401486))) (bvsub lt!401489 lt!401485))))

(assert (=> b!259589 (= lt!401487 (validateOffsetBitsIneqLemma!0 (_2!12056 lt!401275) (_2!12056 lt!401486) lt!401489 lt!401485))))

(assert (=> b!259589 (= lt!401485 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259589 (= lt!401489 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259589 (= e!180134 (tuple2!22241 (_1!12056 lt!401483) (_2!12056 lt!401483)))))

(declare-fun b!259590 () Bool)

(assert (=> b!259590 (= e!180135 e!180134)))

(assert (=> b!259590 (= lt!401486 (readBit!0 (_2!12056 lt!401275)))))

(declare-fun c!11911 () Bool)

(assert (=> b!259590 (= c!11911 (not (= (_1!12056 lt!401486) expected!109)))))

(assert (= (and d!87062 c!11910) b!259582))

(assert (= (and d!87062 (not c!11910)) b!259590))

(assert (= (and b!259590 c!11911) b!259586))

(assert (= (and b!259590 (not c!11911)) b!259589))

(assert (= (and d!87062 res!217434) b!259583))

(assert (= (and b!259583 res!217435) b!259584))

(assert (= (and b!259584 (not res!217437)) b!259587))

(assert (= (and b!259584 res!217436) b!259588))

(assert (= (and b!259588 (not res!217433)) b!259585))

(declare-fun m!388873 () Bool)

(assert (=> b!259585 m!388873))

(declare-fun m!388875 () Bool)

(assert (=> b!259587 m!388875))

(declare-fun m!388877 () Bool)

(assert (=> b!259587 m!388877))

(declare-fun m!388879 () Bool)

(assert (=> b!259589 m!388879))

(declare-fun m!388881 () Bool)

(assert (=> b!259589 m!388881))

(declare-fun m!388883 () Bool)

(assert (=> b!259589 m!388883))

(assert (=> d!87062 m!388875))

(assert (=> d!87062 m!388877))

(declare-fun m!388885 () Bool)

(assert (=> b!259590 m!388885))

(assert (=> b!259478 d!87062))

(declare-fun d!87078 () Bool)

(assert (=> d!87078 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6218 (buf!6740 (_2!12056 lt!401275)))) ((_ sign_extend 32) (currentByte!12384 (_2!12056 lt!401275))) ((_ sign_extend 32) (currentBit!12379 (_2!12056 lt!401275))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6218 (buf!6740 (_2!12056 lt!401275)))) ((_ sign_extend 32) (currentByte!12384 (_2!12056 lt!401275))) ((_ sign_extend 32) (currentBit!12379 (_2!12056 lt!401275)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22060 () Bool)

(assert (= bs!22060 d!87078))

(declare-fun m!388887 () Bool)

(assert (=> bs!22060 m!388887))

(assert (=> b!259478 d!87078))

(declare-fun d!87080 () Bool)

(declare-fun e!180148 () Bool)

(assert (=> d!87080 e!180148))

(declare-fun res!217450 () Bool)

(assert (=> d!87080 (=> (not res!217450) (not e!180148))))

(assert (=> d!87080 (= res!217450 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401516 () Unit!18479)

(declare-fun choose!27 (BitStream!11358 BitStream!11358 (_ BitVec 64) (_ BitVec 64)) Unit!18479)

(assert (=> d!87080 (= lt!401516 (choose!27 thiss!1754 (_2!12056 lt!401275) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87080 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87080 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12056 lt!401275) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!401516)))

(declare-fun b!259609 () Bool)

(assert (=> b!259609 (= e!180148 (validate_offset_bits!1 ((_ sign_extend 32) (size!6218 (buf!6740 (_2!12056 lt!401275)))) ((_ sign_extend 32) (currentByte!12384 (_2!12056 lt!401275))) ((_ sign_extend 32) (currentBit!12379 (_2!12056 lt!401275))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87080 res!217450) b!259609))

(declare-fun m!388913 () Bool)

(assert (=> d!87080 m!388913))

(assert (=> b!259609 m!388797))

(assert (=> b!259478 d!87080))

(check-sat (not b!259589) (not d!87078) (not d!87046) (not d!87044) (not d!87080) (not d!87062) (not b!259504) (not b!259590) (not b!259587) (not d!87056) (not b!259609) (not d!87042) (not b!259585))
