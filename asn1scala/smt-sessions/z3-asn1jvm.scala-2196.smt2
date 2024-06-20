; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55698 () Bool)

(assert start!55698)

(declare-fun b!259055 () Bool)

(declare-fun e!179712 () Bool)

(declare-datatypes ((array!14141 0))(
  ( (array!14142 (arr!7181 (Array (_ BitVec 32) (_ BitVec 8))) (size!6194 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11310 0))(
  ( (BitStream!11311 (buf!6716 array!14141) (currentByte!12345 (_ BitVec 32)) (currentBit!12340 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11310)

(declare-fun array_inv!5935 (array!14141) Bool)

(assert (=> b!259055 (= e!179712 (array_inv!5935 (buf!6716 thiss!1754)))))

(declare-fun b!259056 () Bool)

(declare-fun res!217010 () Bool)

(declare-fun e!179713 () Bool)

(assert (=> b!259056 (=> (not res!217010) (not e!179713))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259056 (= res!217010 (validate_offset_bits!1 ((_ sign_extend 32) (size!6194 (buf!6716 thiss!1754))) ((_ sign_extend 32) (currentByte!12345 thiss!1754)) ((_ sign_extend 32) (currentBit!12340 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259057 () Bool)

(declare-fun e!179711 () Bool)

(assert (=> b!259057 (= e!179713 e!179711)))

(declare-fun res!217008 () Bool)

(assert (=> b!259057 (=> (not res!217008) (not e!179711))))

(declare-datatypes ((tuple2!22174 0))(
  ( (tuple2!22175 (_1!12023 Bool) (_2!12023 BitStream!11310)) )
))
(declare-fun lt!400850 () tuple2!22174)

(declare-fun expected!109 () Bool)

(assert (=> b!259057 (= res!217008 (not (= (_1!12023 lt!400850) expected!109)))))

(declare-fun readBit!0 (BitStream!11310) tuple2!22174)

(assert (=> b!259057 (= lt!400850 (readBit!0 thiss!1754))))

(declare-fun b!259059 () Bool)

(declare-fun res!217012 () Bool)

(assert (=> b!259059 (=> (not res!217012) (not e!179713))))

(assert (=> b!259059 (= res!217012 (not (= from!526 nBits!535)))))

(declare-fun e!179710 () Bool)

(declare-fun b!259060 () Bool)

(assert (=> b!259060 (= e!179710 (or (not (= (buf!6716 thiss!1754) (buf!6716 (_2!12023 lt!400850)))) (= nBits!535 from!526)))))

(declare-fun b!259058 () Bool)

(assert (=> b!259058 (= e!179711 e!179710)))

(declare-fun res!217011 () Bool)

(assert (=> b!259058 (=> res!217011 e!179710)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259058 (= res!217011 (bvslt (bvsub (bvadd (bitIndex!0 (size!6194 (buf!6716 thiss!1754)) (currentByte!12345 thiss!1754) (currentBit!12340 thiss!1754)) nBits!535) from!526) (bitIndex!0 (size!6194 (buf!6716 (_2!12023 lt!400850))) (currentByte!12345 (_2!12023 lt!400850)) (currentBit!12340 (_2!12023 lt!400850)))))))

(declare-fun res!217009 () Bool)

(assert (=> start!55698 (=> (not res!217009) (not e!179713))))

(assert (=> start!55698 (= res!217009 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55698 e!179713))

(assert (=> start!55698 true))

(declare-fun inv!12 (BitStream!11310) Bool)

(assert (=> start!55698 (and (inv!12 thiss!1754) e!179712)))

(assert (= (and start!55698 res!217009) b!259056))

(assert (= (and b!259056 res!217010) b!259059))

(assert (= (and b!259059 res!217012) b!259057))

(assert (= (and b!259057 res!217008) b!259058))

(assert (= (and b!259058 (not res!217011)) b!259060))

(assert (= start!55698 b!259055))

(declare-fun m!388391 () Bool)

(assert (=> b!259056 m!388391))

(declare-fun m!388393 () Bool)

(assert (=> start!55698 m!388393))

(declare-fun m!388395 () Bool)

(assert (=> b!259057 m!388395))

(declare-fun m!388397 () Bool)

(assert (=> b!259055 m!388397))

(declare-fun m!388399 () Bool)

(assert (=> b!259058 m!388399))

(declare-fun m!388401 () Bool)

(assert (=> b!259058 m!388401))

(check-sat (not b!259055) (not start!55698) (not b!259057) (not b!259056) (not b!259058))
(check-sat)
(get-model)

(declare-fun d!86926 () Bool)

(declare-fun e!179731 () Bool)

(assert (=> d!86926 e!179731))

(declare-fun res!217033 () Bool)

(assert (=> d!86926 (=> (not res!217033) (not e!179731))))

(declare-fun lt!400871 () (_ BitVec 64))

(declare-fun lt!400867 () (_ BitVec 64))

(declare-fun lt!400870 () (_ BitVec 64))

(assert (=> d!86926 (= res!217033 (= lt!400871 (bvsub lt!400867 lt!400870)))))

(assert (=> d!86926 (or (= (bvand lt!400867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400870 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400867 lt!400870) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86926 (= lt!400870 (remainingBits!0 ((_ sign_extend 32) (size!6194 (buf!6716 thiss!1754))) ((_ sign_extend 32) (currentByte!12345 thiss!1754)) ((_ sign_extend 32) (currentBit!12340 thiss!1754))))))

(declare-fun lt!400869 () (_ BitVec 64))

(declare-fun lt!400868 () (_ BitVec 64))

(assert (=> d!86926 (= lt!400867 (bvmul lt!400869 lt!400868))))

(assert (=> d!86926 (or (= lt!400869 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400868 (bvsdiv (bvmul lt!400869 lt!400868) lt!400869)))))

(assert (=> d!86926 (= lt!400868 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86926 (= lt!400869 ((_ sign_extend 32) (size!6194 (buf!6716 thiss!1754))))))

(assert (=> d!86926 (= lt!400871 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12345 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12340 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86926 (invariant!0 (currentBit!12340 thiss!1754) (currentByte!12345 thiss!1754) (size!6194 (buf!6716 thiss!1754)))))

(assert (=> d!86926 (= (bitIndex!0 (size!6194 (buf!6716 thiss!1754)) (currentByte!12345 thiss!1754) (currentBit!12340 thiss!1754)) lt!400871)))

(declare-fun b!259083 () Bool)

(declare-fun res!217032 () Bool)

(assert (=> b!259083 (=> (not res!217032) (not e!179731))))

(assert (=> b!259083 (= res!217032 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400871))))

(declare-fun b!259084 () Bool)

(declare-fun lt!400866 () (_ BitVec 64))

(assert (=> b!259084 (= e!179731 (bvsle lt!400871 (bvmul lt!400866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259084 (or (= lt!400866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400866)))))

(assert (=> b!259084 (= lt!400866 ((_ sign_extend 32) (size!6194 (buf!6716 thiss!1754))))))

(assert (= (and d!86926 res!217033) b!259083))

(assert (= (and b!259083 res!217032) b!259084))

(declare-fun m!388415 () Bool)

(assert (=> d!86926 m!388415))

(declare-fun m!388417 () Bool)

(assert (=> d!86926 m!388417))

(assert (=> b!259058 d!86926))

(declare-fun d!86928 () Bool)

(declare-fun e!179732 () Bool)

(assert (=> d!86928 e!179732))

(declare-fun res!217035 () Bool)

(assert (=> d!86928 (=> (not res!217035) (not e!179732))))

(declare-fun lt!400876 () (_ BitVec 64))

(declare-fun lt!400873 () (_ BitVec 64))

(declare-fun lt!400877 () (_ BitVec 64))

(assert (=> d!86928 (= res!217035 (= lt!400877 (bvsub lt!400873 lt!400876)))))

(assert (=> d!86928 (or (= (bvand lt!400873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400876 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400873 lt!400876) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86928 (= lt!400876 (remainingBits!0 ((_ sign_extend 32) (size!6194 (buf!6716 (_2!12023 lt!400850)))) ((_ sign_extend 32) (currentByte!12345 (_2!12023 lt!400850))) ((_ sign_extend 32) (currentBit!12340 (_2!12023 lt!400850)))))))

(declare-fun lt!400875 () (_ BitVec 64))

(declare-fun lt!400874 () (_ BitVec 64))

(assert (=> d!86928 (= lt!400873 (bvmul lt!400875 lt!400874))))

(assert (=> d!86928 (or (= lt!400875 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400874 (bvsdiv (bvmul lt!400875 lt!400874) lt!400875)))))

(assert (=> d!86928 (= lt!400874 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86928 (= lt!400875 ((_ sign_extend 32) (size!6194 (buf!6716 (_2!12023 lt!400850)))))))

(assert (=> d!86928 (= lt!400877 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12345 (_2!12023 lt!400850))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12340 (_2!12023 lt!400850)))))))

(assert (=> d!86928 (invariant!0 (currentBit!12340 (_2!12023 lt!400850)) (currentByte!12345 (_2!12023 lt!400850)) (size!6194 (buf!6716 (_2!12023 lt!400850))))))

(assert (=> d!86928 (= (bitIndex!0 (size!6194 (buf!6716 (_2!12023 lt!400850))) (currentByte!12345 (_2!12023 lt!400850)) (currentBit!12340 (_2!12023 lt!400850))) lt!400877)))

(declare-fun b!259085 () Bool)

(declare-fun res!217034 () Bool)

(assert (=> b!259085 (=> (not res!217034) (not e!179732))))

(assert (=> b!259085 (= res!217034 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400877))))

(declare-fun b!259086 () Bool)

(declare-fun lt!400872 () (_ BitVec 64))

(assert (=> b!259086 (= e!179732 (bvsle lt!400877 (bvmul lt!400872 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259086 (or (= lt!400872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400872 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400872)))))

(assert (=> b!259086 (= lt!400872 ((_ sign_extend 32) (size!6194 (buf!6716 (_2!12023 lt!400850)))))))

(assert (= (and d!86928 res!217035) b!259085))

(assert (= (and b!259085 res!217034) b!259086))

(declare-fun m!388419 () Bool)

(assert (=> d!86928 m!388419))

(declare-fun m!388421 () Bool)

(assert (=> d!86928 m!388421))

(assert (=> b!259058 d!86928))

(declare-fun d!86930 () Bool)

(assert (=> d!86930 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12340 thiss!1754) (currentByte!12345 thiss!1754) (size!6194 (buf!6716 thiss!1754))))))

(declare-fun bs!22011 () Bool)

(assert (= bs!22011 d!86930))

(assert (=> bs!22011 m!388417))

(assert (=> start!55698 d!86930))

(declare-fun d!86932 () Bool)

(declare-fun e!179743 () Bool)

(assert (=> d!86932 e!179743))

(declare-fun res!217046 () Bool)

(assert (=> d!86932 (=> (not res!217046) (not e!179743))))

(declare-datatypes ((Unit!18447 0))(
  ( (Unit!18448) )
))
(declare-datatypes ((tuple2!22178 0))(
  ( (tuple2!22179 (_1!12025 Unit!18447) (_2!12025 BitStream!11310)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11310) tuple2!22178)

(assert (=> d!86932 (= res!217046 (= (buf!6716 (_2!12025 (increaseBitIndex!0 thiss!1754))) (buf!6716 thiss!1754)))))

(declare-fun lt!400918 () Bool)

(assert (=> d!86932 (= lt!400918 (not (= (bvand ((_ sign_extend 24) (select (arr!7181 (buf!6716 thiss!1754)) (currentByte!12345 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12340 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400922 () tuple2!22174)

(assert (=> d!86932 (= lt!400922 (tuple2!22175 (not (= (bvand ((_ sign_extend 24) (select (arr!7181 (buf!6716 thiss!1754)) (currentByte!12345 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12340 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12025 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86932 (validate_offset_bit!0 ((_ sign_extend 32) (size!6194 (buf!6716 thiss!1754))) ((_ sign_extend 32) (currentByte!12345 thiss!1754)) ((_ sign_extend 32) (currentBit!12340 thiss!1754)))))

(assert (=> d!86932 (= (readBit!0 thiss!1754) lt!400922)))

(declare-fun b!259097 () Bool)

(declare-fun lt!400916 () (_ BitVec 64))

(declare-fun lt!400917 () (_ BitVec 64))

(assert (=> b!259097 (= e!179743 (= (bitIndex!0 (size!6194 (buf!6716 (_2!12025 (increaseBitIndex!0 thiss!1754)))) (currentByte!12345 (_2!12025 (increaseBitIndex!0 thiss!1754))) (currentBit!12340 (_2!12025 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400917 lt!400916)))))

(assert (=> b!259097 (or (not (= (bvand lt!400917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400916 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400917 lt!400916) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259097 (= lt!400916 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259097 (= lt!400917 (bitIndex!0 (size!6194 (buf!6716 thiss!1754)) (currentByte!12345 thiss!1754) (currentBit!12340 thiss!1754)))))

(declare-fun lt!400921 () Bool)

(assert (=> b!259097 (= lt!400921 (not (= (bvand ((_ sign_extend 24) (select (arr!7181 (buf!6716 thiss!1754)) (currentByte!12345 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12340 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400919 () Bool)

(assert (=> b!259097 (= lt!400919 (not (= (bvand ((_ sign_extend 24) (select (arr!7181 (buf!6716 thiss!1754)) (currentByte!12345 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12340 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400920 () Bool)

(assert (=> b!259097 (= lt!400920 (not (= (bvand ((_ sign_extend 24) (select (arr!7181 (buf!6716 thiss!1754)) (currentByte!12345 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12340 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86932 res!217046) b!259097))

(declare-fun m!388431 () Bool)

(assert (=> d!86932 m!388431))

(declare-fun m!388433 () Bool)

(assert (=> d!86932 m!388433))

(declare-fun m!388435 () Bool)

(assert (=> d!86932 m!388435))

(declare-fun m!388437 () Bool)

(assert (=> d!86932 m!388437))

(assert (=> b!259097 m!388433))

(declare-fun m!388439 () Bool)

(assert (=> b!259097 m!388439))

(assert (=> b!259097 m!388399))

(assert (=> b!259097 m!388435))

(assert (=> b!259097 m!388431))

(assert (=> b!259057 d!86932))

(declare-fun d!86948 () Bool)

(assert (=> d!86948 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6194 (buf!6716 thiss!1754))) ((_ sign_extend 32) (currentByte!12345 thiss!1754)) ((_ sign_extend 32) (currentBit!12340 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6194 (buf!6716 thiss!1754))) ((_ sign_extend 32) (currentByte!12345 thiss!1754)) ((_ sign_extend 32) (currentBit!12340 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22014 () Bool)

(assert (= bs!22014 d!86948))

(assert (=> bs!22014 m!388415))

(assert (=> b!259056 d!86948))

(declare-fun d!86950 () Bool)

(assert (=> d!86950 (= (array_inv!5935 (buf!6716 thiss!1754)) (bvsge (size!6194 (buf!6716 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259055 d!86950))

(check-sat (not d!86926) (not d!86930) (not d!86948) (not b!259097) (not d!86928) (not d!86932))
(check-sat)
