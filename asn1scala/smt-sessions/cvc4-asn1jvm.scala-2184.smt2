; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55424 () Bool)

(assert start!55424)

(declare-fun b!258383 () Bool)

(declare-fun res!216470 () Bool)

(declare-fun e!179211 () Bool)

(assert (=> b!258383 (=> (not res!216470) (not e!179211))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14056 0))(
  ( (array!14057 (arr!7149 (Array (_ BitVec 32) (_ BitVec 8))) (size!6162 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11246 0))(
  ( (BitStream!11247 (buf!6684 array!14056) (currentByte!12268 (_ BitVec 32)) (currentBit!12263 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11246)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258383 (= res!216470 (validate_offset_bits!1 ((_ sign_extend 32) (size!6162 (buf!6684 thiss!1754))) ((_ sign_extend 32) (currentByte!12268 thiss!1754)) ((_ sign_extend 32) (currentBit!12263 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258384 () Bool)

(declare-fun e!179208 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258384 (= e!179208 (validate_offset_bit!0 ((_ sign_extend 32) (size!6162 (buf!6684 thiss!1754))) ((_ sign_extend 32) (currentByte!12268 thiss!1754)) ((_ sign_extend 32) (currentBit!12263 thiss!1754))))))

(declare-fun b!258385 () Bool)

(declare-fun e!179212 () Bool)

(assert (=> b!258385 (= e!179211 e!179212)))

(declare-fun res!216471 () Bool)

(assert (=> b!258385 (=> (not res!216471) (not e!179212))))

(declare-datatypes ((tuple2!22122 0))(
  ( (tuple2!22123 (_1!11997 Bool) (_2!11997 BitStream!11246)) )
))
(declare-fun lt!399980 () tuple2!22122)

(declare-fun expected!109 () Bool)

(assert (=> b!258385 (= res!216471 (= (_1!11997 lt!399980) expected!109))))

(declare-fun readBit!0 (BitStream!11246) tuple2!22122)

(assert (=> b!258385 (= lt!399980 (readBit!0 thiss!1754))))

(declare-fun res!216472 () Bool)

(assert (=> start!55424 (=> (not res!216472) (not e!179211))))

(assert (=> start!55424 (= res!216472 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55424 e!179211))

(assert (=> start!55424 true))

(declare-fun e!179210 () Bool)

(declare-fun inv!12 (BitStream!11246) Bool)

(assert (=> start!55424 (and (inv!12 thiss!1754) e!179210)))

(declare-fun b!258386 () Bool)

(assert (=> b!258386 (= e!179212 (not e!179208))))

(declare-fun res!216468 () Bool)

(assert (=> b!258386 (=> res!216468 e!179208)))

(declare-fun lt!399977 () (_ BitVec 64))

(declare-fun lt!399978 () tuple2!22122)

(declare-fun lt!399979 () (_ BitVec 64))

(assert (=> b!258386 (= res!216468 (or (bvslt lt!399979 lt!399977) (not (= (buf!6684 thiss!1754) (buf!6684 (_2!11997 lt!399978)))) (and (_1!11997 lt!399978) (not (= lt!399979 lt!399977))) (not (_1!11997 lt!399978)) (bvsge from!526 nBits!535)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258386 (= lt!399977 (bitIndex!0 (size!6162 (buf!6684 (_2!11997 lt!399978))) (currentByte!12268 (_2!11997 lt!399978)) (currentBit!12263 (_2!11997 lt!399978))))))

(assert (=> b!258386 (= lt!399979 (bvsub (bvadd (bitIndex!0 (size!6162 (buf!6684 thiss!1754)) (currentByte!12268 thiss!1754) (currentBit!12263 thiss!1754)) nBits!535) from!526))))

(declare-fun checkBitsLoop!0 (BitStream!11246 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22122)

(assert (=> b!258386 (= lt!399978 (checkBitsLoop!0 (_2!11997 lt!399980) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258386 (validate_offset_bits!1 ((_ sign_extend 32) (size!6162 (buf!6684 (_2!11997 lt!399980)))) ((_ sign_extend 32) (currentByte!12268 (_2!11997 lt!399980))) ((_ sign_extend 32) (currentBit!12263 (_2!11997 lt!399980))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18433 0))(
  ( (Unit!18434) )
))
(declare-fun lt!399976 () Unit!18433)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11246 BitStream!11246 (_ BitVec 64) (_ BitVec 64)) Unit!18433)

(assert (=> b!258386 (= lt!399976 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11997 lt!399980) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!258387 () Bool)

(declare-fun array_inv!5903 (array!14056) Bool)

(assert (=> b!258387 (= e!179210 (array_inv!5903 (buf!6684 thiss!1754)))))

(declare-fun b!258388 () Bool)

(declare-fun res!216469 () Bool)

(assert (=> b!258388 (=> (not res!216469) (not e!179211))))

(assert (=> b!258388 (= res!216469 (not (= from!526 nBits!535)))))

(assert (= (and start!55424 res!216472) b!258383))

(assert (= (and b!258383 res!216470) b!258388))

(assert (= (and b!258388 res!216469) b!258385))

(assert (= (and b!258385 res!216471) b!258386))

(assert (= (and b!258386 (not res!216468)) b!258384))

(assert (= start!55424 b!258387))

(declare-fun m!387855 () Bool)

(assert (=> b!258387 m!387855))

(declare-fun m!387857 () Bool)

(assert (=> b!258384 m!387857))

(declare-fun m!387859 () Bool)

(assert (=> start!55424 m!387859))

(declare-fun m!387861 () Bool)

(assert (=> b!258383 m!387861))

(declare-fun m!387863 () Bool)

(assert (=> b!258386 m!387863))

(declare-fun m!387865 () Bool)

(assert (=> b!258386 m!387865))

(declare-fun m!387867 () Bool)

(assert (=> b!258386 m!387867))

(declare-fun m!387869 () Bool)

(assert (=> b!258386 m!387869))

(declare-fun m!387871 () Bool)

(assert (=> b!258386 m!387871))

(declare-fun m!387873 () Bool)

(assert (=> b!258385 m!387873))

(push 1)

(assert (not b!258384))

(assert (not b!258387))

(assert (not b!258383))

(assert (not start!55424))

(assert (not b!258386))

(assert (not b!258385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86708 () Bool)

(declare-fun e!179239 () Bool)

(assert (=> d!86708 e!179239))

(declare-fun res!216491 () Bool)

(assert (=> d!86708 (=> (not res!216491) (not e!179239))))

(declare-datatypes ((tuple2!22128 0))(
  ( (tuple2!22129 (_1!12000 Unit!18433) (_2!12000 BitStream!11246)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11246) tuple2!22128)

(assert (=> d!86708 (= res!216491 (= (buf!6684 (_2!12000 (increaseBitIndex!0 thiss!1754))) (buf!6684 thiss!1754)))))

(declare-fun lt!400058 () Bool)

(assert (=> d!86708 (= lt!400058 (not (= (bvand ((_ sign_extend 24) (select (arr!7149 (buf!6684 thiss!1754)) (currentByte!12268 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12263 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400057 () tuple2!22122)

(assert (=> d!86708 (= lt!400057 (tuple2!22123 (not (= (bvand ((_ sign_extend 24) (select (arr!7149 (buf!6684 thiss!1754)) (currentByte!12268 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12263 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12000 (increaseBitIndex!0 thiss!1754))))))

(assert (=> d!86708 (validate_offset_bit!0 ((_ sign_extend 32) (size!6162 (buf!6684 thiss!1754))) ((_ sign_extend 32) (currentByte!12268 thiss!1754)) ((_ sign_extend 32) (currentBit!12263 thiss!1754)))))

(assert (=> d!86708 (= (readBit!0 thiss!1754) lt!400057)))

(declare-fun lt!400063 () (_ BitVec 64))

(declare-fun b!258407 () Bool)

(declare-fun lt!400060 () (_ BitVec 64))

(assert (=> b!258407 (= e!179239 (= (bitIndex!0 (size!6162 (buf!6684 (_2!12000 (increaseBitIndex!0 thiss!1754)))) (currentByte!12268 (_2!12000 (increaseBitIndex!0 thiss!1754))) (currentBit!12263 (_2!12000 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400063 lt!400060)))))

(assert (=> b!258407 (or (not (= (bvand lt!400063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400060 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400063 lt!400060) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258407 (= lt!400060 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258407 (= lt!400063 (bitIndex!0 (size!6162 (buf!6684 thiss!1754)) (currentByte!12268 thiss!1754) (currentBit!12263 thiss!1754)))))

(declare-fun lt!400062 () Bool)

(assert (=> b!258407 (= lt!400062 (not (= (bvand ((_ sign_extend 24) (select (arr!7149 (buf!6684 thiss!1754)) (currentByte!12268 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12263 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400061 () Bool)

(assert (=> b!258407 (= lt!400061 (not (= (bvand ((_ sign_extend 24) (select (arr!7149 (buf!6684 thiss!1754)) (currentByte!12268 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12263 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400059 () Bool)

(assert (=> b!258407 (= lt!400059 (not (= (bvand ((_ sign_extend 24) (select (arr!7149 (buf!6684 thiss!1754)) (currentByte!12268 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12263 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86708 res!216491) b!258407))

(declare-fun m!387897 () Bool)

(assert (=> d!86708 m!387897))

(declare-fun m!387901 () Bool)

(assert (=> d!86708 m!387901))

(declare-fun m!387907 () Bool)

(assert (=> d!86708 m!387907))

(assert (=> d!86708 m!387857))

(assert (=> b!258407 m!387897))

(assert (=> b!258407 m!387901))

(assert (=> b!258407 m!387865))

(declare-fun m!387909 () Bool)

(assert (=> b!258407 m!387909))

(assert (=> b!258407 m!387907))

(assert (=> b!258385 d!86708))

(declare-fun d!86712 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86712 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6162 (buf!6684 thiss!1754))) ((_ sign_extend 32) (currentByte!12268 thiss!1754)) ((_ sign_extend 32) (currentBit!12263 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6162 (buf!6684 thiss!1754))) ((_ sign_extend 32) (currentByte!12268 thiss!1754)) ((_ sign_extend 32) (currentBit!12263 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21932 () Bool)

(assert (= bs!21932 d!86712))

(declare-fun m!387913 () Bool)

(assert (=> bs!21932 m!387913))

(assert (=> b!258383 d!86712))

(declare-fun d!86718 () Bool)

(assert (=> d!86718 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6162 (buf!6684 thiss!1754))) ((_ sign_extend 32) (currentByte!12268 thiss!1754)) ((_ sign_extend 32) (currentBit!12263 thiss!1754))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6162 (buf!6684 thiss!1754))) ((_ sign_extend 32) (currentByte!12268 thiss!1754)) ((_ sign_extend 32) (currentBit!12263 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21933 () Bool)

(assert (= bs!21933 d!86718))

(assert (=> bs!21933 m!387913))

(assert (=> b!258384 d!86718))

(declare-fun d!86720 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86720 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12263 thiss!1754) (currentByte!12268 thiss!1754) (size!6162 (buf!6684 thiss!1754))))))

(declare-fun bs!21934 () Bool)

(assert (= bs!21934 d!86720))

(declare-fun m!387915 () Bool)

(assert (=> bs!21934 m!387915))

(assert (=> start!55424 d!86720))

(declare-fun d!86722 () Bool)

(assert (=> d!86722 (= (array_inv!5903 (buf!6684 thiss!1754)) (bvsge (size!6162 (buf!6684 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258387 d!86722))

(declare-fun d!86724 () Bool)

(declare-fun e!179256 () Bool)

(assert (=> d!86724 e!179256))

(declare-fun res!216511 () Bool)

(assert (=> d!86724 (=> (not res!216511) (not e!179256))))

(declare-fun lt!400112 () (_ BitVec 64))

(declare-fun lt!400110 () (_ BitVec 64))

(declare-fun lt!400108 () (_ BitVec 64))

(assert (=> d!86724 (= res!216511 (= lt!400112 (bvsub lt!400108 lt!400110)))))

(assert (=> d!86724 (or (= (bvand lt!400108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400110 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400108 lt!400110) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86724 (= lt!400110 (remainingBits!0 ((_ sign_extend 32) (size!6162 (buf!6684 (_2!11997 lt!399978)))) ((_ sign_extend 32) (currentByte!12268 (_2!11997 lt!399978))) ((_ sign_extend 32) (currentBit!12263 (_2!11997 lt!399978)))))))

(declare-fun lt!400109 () (_ BitVec 64))

(declare-fun lt!400113 () (_ BitVec 64))

(assert (=> d!86724 (= lt!400108 (bvmul lt!400109 lt!400113))))

(assert (=> d!86724 (or (= lt!400109 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400113 (bvsdiv (bvmul lt!400109 lt!400113) lt!400109)))))

(assert (=> d!86724 (= lt!400113 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86724 (= lt!400109 ((_ sign_extend 32) (size!6162 (buf!6684 (_2!11997 lt!399978)))))))

(assert (=> d!86724 (= lt!400112 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12268 (_2!11997 lt!399978))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12263 (_2!11997 lt!399978)))))))

(assert (=> d!86724 (invariant!0 (currentBit!12263 (_2!11997 lt!399978)) (currentByte!12268 (_2!11997 lt!399978)) (size!6162 (buf!6684 (_2!11997 lt!399978))))))

(assert (=> d!86724 (= (bitIndex!0 (size!6162 (buf!6684 (_2!11997 lt!399978))) (currentByte!12268 (_2!11997 lt!399978)) (currentBit!12263 (_2!11997 lt!399978))) lt!400112)))

(declare-fun b!258434 () Bool)

(declare-fun res!216510 () Bool)

(assert (=> b!258434 (=> (not res!216510) (not e!179256))))

(assert (=> b!258434 (= res!216510 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400112))))

(declare-fun b!258435 () Bool)

(declare-fun lt!400111 () (_ BitVec 64))

(assert (=> b!258435 (= e!179256 (bvsle lt!400112 (bvmul lt!400111 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258435 (or (= lt!400111 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400111 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400111)))))

(assert (=> b!258435 (= lt!400111 ((_ sign_extend 32) (size!6162 (buf!6684 (_2!11997 lt!399978)))))))

(assert (= (and d!86724 res!216511) b!258434))

(assert (= (and b!258434 res!216510) b!258435))

(declare-fun m!387919 () Bool)

(assert (=> d!86724 m!387919))

(declare-fun m!387921 () Bool)

(assert (=> d!86724 m!387921))

(assert (=> b!258386 d!86724))

(declare-fun d!86728 () Bool)

(declare-fun e!179267 () Bool)

(assert (=> d!86728 e!179267))

(declare-fun res!216525 () Bool)

(assert (=> d!86728 (=> (not res!216525) (not e!179267))))

(assert (=> d!86728 (= res!216525 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!400145 () Unit!18433)

(declare-fun choose!27 (BitStream!11246 BitStream!11246 (_ BitVec 64) (_ BitVec 64)) Unit!18433)

(assert (=> d!86728 (= lt!400145 (choose!27 thiss!1754 (_2!11997 lt!399980) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86728 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86728 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11997 lt!399980) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!400145)))

(declare-fun b!258453 () Bool)

(assert (=> b!258453 (= e!179267 (validate_offset_bits!1 ((_ sign_extend 32) (size!6162 (buf!6684 (_2!11997 lt!399980)))) ((_ sign_extend 32) (currentByte!12268 (_2!11997 lt!399980))) ((_ sign_extend 32) (currentBit!12263 (_2!11997 lt!399980))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86728 res!216525) b!258453))

(declare-fun m!387941 () Bool)

(assert (=> d!86728 m!387941))

(assert (=> b!258453 m!387867))

(assert (=> b!258386 d!86728))

(declare-fun d!86738 () Bool)

(declare-fun e!179268 () Bool)

(assert (=> d!86738 e!179268))

(declare-fun res!216527 () Bool)

(assert (=> d!86738 (=> (not res!216527) (not e!179268))))

(declare-fun lt!400148 () (_ BitVec 64))

(declare-fun lt!400150 () (_ BitVec 64))

(declare-fun lt!400146 () (_ BitVec 64))

(assert (=> d!86738 (= res!216527 (= lt!400150 (bvsub lt!400146 lt!400148)))))

(assert (=> d!86738 (or (= (bvand lt!400146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400148 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400146 lt!400148) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86738 (= lt!400148 (remainingBits!0 ((_ sign_extend 32) (size!6162 (buf!6684 thiss!1754))) ((_ sign_extend 32) (currentByte!12268 thiss!1754)) ((_ sign_extend 32) (currentBit!12263 thiss!1754))))))

(declare-fun lt!400147 () (_ BitVec 64))

(declare-fun lt!400151 () (_ BitVec 64))

(assert (=> d!86738 (= lt!400146 (bvmul lt!400147 lt!400151))))

(assert (=> d!86738 (or (= lt!400147 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400151 (bvsdiv (bvmul lt!400147 lt!400151) lt!400147)))))

(assert (=> d!86738 (= lt!400151 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86738 (= lt!400147 ((_ sign_extend 32) (size!6162 (buf!6684 thiss!1754))))))

(assert (=> d!86738 (= lt!400150 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12268 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12263 thiss!1754))))))

(assert (=> d!86738 (invariant!0 (currentBit!12263 thiss!1754) (currentByte!12268 thiss!1754) (size!6162 (buf!6684 thiss!1754)))))

(assert (=> d!86738 (= (bitIndex!0 (size!6162 (buf!6684 thiss!1754)) (currentByte!12268 thiss!1754) (currentBit!12263 thiss!1754)) lt!400150)))

(declare-fun b!258454 () Bool)

(declare-fun res!216526 () Bool)

(assert (=> b!258454 (=> (not res!216526) (not e!179268))))

(assert (=> b!258454 (= res!216526 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400150))))

(declare-fun b!258455 () Bool)

(declare-fun lt!400149 () (_ BitVec 64))

(assert (=> b!258455 (= e!179268 (bvsle lt!400150 (bvmul lt!400149 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258455 (or (= lt!400149 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400149 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400149)))))

(assert (=> b!258455 (= lt!400149 ((_ sign_extend 32) (size!6162 (buf!6684 thiss!1754))))))

(assert (= (and d!86738 res!216527) b!258454))

(assert (= (and b!258454 res!216526) b!258455))

(assert (=> d!86738 m!387913))

(assert (=> d!86738 m!387915))

(assert (=> b!258386 d!86738))

(declare-fun b!258503 () Bool)

(declare-fun e!179297 () Bool)

(declare-fun e!179298 () Bool)

(assert (=> b!258503 (= e!179297 e!179298)))

(declare-fun res!216556 () Bool)

(assert (=> b!258503 (=> res!216556 e!179298)))

(declare-fun lt!400220 () tuple2!22122)

(assert (=> b!258503 (= res!216556 (or (not (_1!11997 lt!400220)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun d!86740 () Bool)

(assert (=> d!86740 e!179297))

(declare-fun res!216557 () Bool)

(assert (=> d!86740 (=> (not res!216557) (not e!179297))))

(declare-fun lt!400213 () (_ BitVec 64))

(assert (=> d!86740 (= res!216557 (bvsge (bvsub lt!400213 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6162 (buf!6684 (_2!11997 lt!400220))) (currentByte!12268 (_2!11997 lt!400220)) (currentBit!12263 (_2!11997 lt!400220)))))))

(assert (=> d!86740 (or (= (bvand lt!400213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400213 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!400219 () (_ BitVec 64))

(assert (=> d!86740 (= lt!400213 (bvadd lt!400219 nBits!535))))

(assert (=> d!86740 (or (not (= (bvand lt!400219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400219 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86740 (= lt!400219 (bitIndex!0 (size!6162 (buf!6684 (_2!11997 lt!399980))) (currentByte!12268 (_2!11997 lt!399980)) (currentBit!12263 (_2!11997 lt!399980))))))

(declare-fun e!179299 () tuple2!22122)

(assert (=> d!86740 (= lt!400220 e!179299)))

(declare-fun c!11895 () Bool)

(assert (=> d!86740 (= c!11895 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86740 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86740 (= (checkBitsLoop!0 (_2!11997 lt!399980) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!400220)))

(declare-fun b!258504 () Bool)

(declare-datatypes ((tuple2!22134 0))(
  ( (tuple2!22135 (_1!12003 BitStream!11246) (_2!12003 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11246) tuple2!22134)

(assert (=> b!258504 (= e!179298 (= expected!109 (_2!12003 (readBitPure!0 (_2!11997 lt!399980)))))))

(declare-fun lt!400214 () tuple2!22122)

(declare-fun lt!400223 () tuple2!22122)

(declare-fun b!258505 () Bool)

(assert (=> b!258505 (= lt!400223 (checkBitsLoop!0 (_2!11997 lt!400214) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!400216 () Unit!18433)

(declare-fun lt!400222 () Unit!18433)

(assert (=> b!258505 (= lt!400216 lt!400222)))

(declare-fun lt!400218 () (_ BitVec 64))

(declare-fun lt!400217 () (_ BitVec 64))

(assert (=> b!258505 (validate_offset_bits!1 ((_ sign_extend 32) (size!6162 (buf!6684 (_2!11997 lt!400214)))) ((_ sign_extend 32) (currentByte!12268 (_2!11997 lt!400214))) ((_ sign_extend 32) (currentBit!12263 (_2!11997 lt!400214))) (bvsub lt!400218 lt!400217))))

(assert (=> b!258505 (= lt!400222 (validateOffsetBitsIneqLemma!0 (_2!11997 lt!399980) (_2!11997 lt!400214) lt!400218 lt!400217))))

(assert (=> b!258505 (= lt!400217 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258505 (= lt!400218 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun e!179296 () tuple2!22122)

(assert (=> b!258505 (= e!179296 (tuple2!22123 (_1!11997 lt!400223) (_2!11997 lt!400223)))))

(declare-fun b!258506 () Bool)

(assert (=> b!258506 (= e!179299 (tuple2!22123 true (_2!11997 lt!399980)))))

(declare-fun b!258507 () Bool)

(assert (=> b!258507 (= e!179299 e!179296)))

(assert (=> b!258507 (= lt!400214 (readBit!0 (_2!11997 lt!399980)))))

(declare-fun c!11894 () Bool)

(assert (=> b!258507 (= c!11894 (not (= (_1!11997 lt!400214) expected!109)))))

(declare-fun e!179295 () Bool)

(declare-fun b!258508 () Bool)

(declare-fun lt!400221 () (_ BitVec 64))

(assert (=> b!258508 (= e!179295 (= (bvsub lt!400221 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6162 (buf!6684 (_2!11997 lt!400220))) (currentByte!12268 (_2!11997 lt!400220)) (currentBit!12263 (_2!11997 lt!400220)))))))

(assert (=> b!258508 (or (= (bvand lt!400221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400221 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!400215 () (_ BitVec 64))

(assert (=> b!258508 (= lt!400221 (bvadd lt!400215 nBits!535))))

(assert (=> b!258508 (or (not (= (bvand lt!400215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400215 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258508 (= lt!400215 (bitIndex!0 (size!6162 (buf!6684 (_2!11997 lt!399980))) (currentByte!12268 (_2!11997 lt!399980)) (currentBit!12263 (_2!11997 lt!399980))))))

(declare-fun b!258509 () Bool)

(assert (=> b!258509 (= e!179296 (tuple2!22123 false (_2!11997 lt!400214)))))

(declare-fun b!258510 () Bool)

(declare-fun res!216559 () Bool)

(assert (=> b!258510 (=> (not res!216559) (not e!179297))))

(assert (=> b!258510 (= res!216559 e!179295)))

(declare-fun res!216558 () Bool)

(assert (=> b!258510 (=> res!216558 e!179295)))

(assert (=> b!258510 (= res!216558 (not (_1!11997 lt!400220)))))

(declare-fun b!258511 () Bool)

(declare-fun res!216555 () Bool)

(assert (=> b!258511 (=> (not res!216555) (not e!179297))))

(assert (=> b!258511 (= res!216555 (and (= (buf!6684 (_2!11997 lt!399980)) (buf!6684 (_2!11997 lt!400220))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11997 lt!400220))))))

(assert (= (and d!86740 c!11895) b!258506))

(assert (= (and d!86740 (not c!11895)) b!258507))

(assert (= (and b!258507 c!11894) b!258509))

(assert (= (and b!258507 (not c!11894)) b!258505))

(assert (= (and d!86740 res!216557) b!258511))

(assert (= (and b!258511 res!216555) b!258510))

(assert (= (and b!258510 (not res!216558)) b!258508))

(assert (= (and b!258510 res!216559) b!258503))

(assert (= (and b!258503 (not res!216556)) b!258504))

(declare-fun m!387961 () Bool)

(assert (=> b!258504 m!387961))

(declare-fun m!387963 () Bool)

(assert (=> b!258507 m!387963))

(declare-fun m!387965 () Bool)

(assert (=> d!86740 m!387965))

(declare-fun m!387967 () Bool)

(assert (=> d!86740 m!387967))

(assert (=> b!258508 m!387965))

(assert (=> b!258508 m!387967))

(declare-fun m!387969 () Bool)

(assert (=> b!258505 m!387969))

(declare-fun m!387971 () Bool)

(assert (=> b!258505 m!387971))

(declare-fun m!387973 () Bool)

(assert (=> b!258505 m!387973))

(assert (=> b!258386 d!86740))

(declare-fun d!86744 () Bool)

(assert (=> d!86744 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6162 (buf!6684 (_2!11997 lt!399980)))) ((_ sign_extend 32) (currentByte!12268 (_2!11997 lt!399980))) ((_ sign_extend 32) (currentBit!12263 (_2!11997 lt!399980))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6162 (buf!6684 (_2!11997 lt!399980)))) ((_ sign_extend 32) (currentByte!12268 (_2!11997 lt!399980))) ((_ sign_extend 32) (currentBit!12263 (_2!11997 lt!399980)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21938 () Bool)

(assert (= bs!21938 d!86744))

(declare-fun m!387975 () Bool)

(assert (=> bs!21938 m!387975))

(assert (=> b!258386 d!86744))

(push 1)

