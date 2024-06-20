; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71984 () Bool)

(assert start!71984)

(declare-fun b!322861 () Bool)

(declare-fun e!232632 () Bool)

(declare-datatypes ((array!20605 0))(
  ( (array!20606 (arr!10060 (Array (_ BitVec 32) (_ BitVec 8))) (size!8968 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14098 0))(
  ( (BitStream!14099 (buf!8110 array!20605) (currentByte!14966 (_ BitVec 32)) (currentBit!14961 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14098)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322861 (= e!232632 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!8968 (buf!8110 thiss!1793))) ((_ sign_extend 32) (currentByte!14966 thiss!1793)) ((_ sign_extend 32) (currentBit!14961 thiss!1793)))))))

(declare-fun b!322862 () Bool)

(declare-fun e!232630 () Bool)

(assert (=> b!322862 (= e!232630 e!232632)))

(declare-fun res!265044 () Bool)

(assert (=> b!322862 (=> (not res!265044) (not e!232632))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((tuple2!23630 0))(
  ( (tuple2!23631 (_1!13444 (_ BitVec 64)) (_2!13444 BitStream!14098)) )
))
(declare-fun lt!445565 () tuple2!23630)

(declare-fun lt!445567 () (_ BitVec 64))

(assert (=> b!322862 (= res!265044 (= (bvand (_1!13444 lt!445565) lt!445567) (bvand acc!161 lt!445567)))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322862 (= lt!445567 (onesLSBLong!0 i!743))))

(declare-fun b!322863 () Bool)

(declare-fun res!265042 () Bool)

(assert (=> b!322863 (=> (not res!265042) (not e!232632))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!322863 (= res!265042 (bvslt i!743 nBits!548))))

(declare-fun b!322864 () Bool)

(declare-fun res!265037 () Bool)

(assert (=> b!322864 (=> (not res!265037) (not e!232630))))

(declare-fun lt!445568 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322864 (= res!265037 (= (bitIndex!0 (size!8968 (buf!8110 (_2!13444 lt!445565))) (currentByte!14966 (_2!13444 lt!445565)) (currentBit!14961 (_2!13444 lt!445565))) (bvadd (bitIndex!0 (size!8968 (buf!8110 thiss!1793)) (currentByte!14966 thiss!1793) (currentBit!14961 thiss!1793)) lt!445568)))))

(declare-fun res!265043 () Bool)

(declare-fun e!232635 () Bool)

(assert (=> start!71984 (=> (not res!265043) (not e!232635))))

(assert (=> start!71984 (= res!265043 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71984 e!232635))

(assert (=> start!71984 true))

(declare-fun e!232634 () Bool)

(declare-fun inv!12 (BitStream!14098) Bool)

(assert (=> start!71984 (and (inv!12 thiss!1793) e!232634)))

(declare-fun b!322865 () Bool)

(declare-fun e!232633 () Bool)

(assert (=> b!322865 (= e!232635 e!232633)))

(declare-fun res!265040 () Bool)

(assert (=> b!322865 (=> (not res!265040) (not e!232633))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322865 (= res!265040 (validate_offset_bits!1 ((_ sign_extend 32) (size!8968 (buf!8110 thiss!1793))) ((_ sign_extend 32) (currentByte!14966 thiss!1793)) ((_ sign_extend 32) (currentBit!14961 thiss!1793)) lt!445568))))

(assert (=> b!322865 (= lt!445568 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!322866 () Bool)

(declare-fun res!265045 () Bool)

(assert (=> b!322866 (=> (not res!265045) (not e!232633))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322866 (= res!265045 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322867 () Bool)

(declare-fun array_inv!8520 (array!20605) Bool)

(assert (=> b!322867 (= e!232634 (array_inv!8520 (buf!8110 thiss!1793)))))

(declare-fun b!322868 () Bool)

(assert (=> b!322868 (= e!232633 e!232630)))

(declare-fun res!265038 () Bool)

(assert (=> b!322868 (=> (not res!265038) (not e!232630))))

(assert (=> b!322868 (= res!265038 (= (buf!8110 (_2!13444 lt!445565)) (buf!8110 thiss!1793)))))

(declare-datatypes ((tuple2!23632 0))(
  ( (tuple2!23633 (_1!13445 Bool) (_2!13445 BitStream!14098)) )
))
(declare-fun lt!445566 () tuple2!23632)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23630)

(assert (=> b!322868 (= lt!445565 (readNBitsLSBFirstsLoop!0 (_2!13445 lt!445566) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13445 lt!445566) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14098) tuple2!23632)

(assert (=> b!322868 (= lt!445566 (readBit!0 thiss!1793))))

(declare-fun b!322869 () Bool)

(declare-fun res!265039 () Bool)

(assert (=> b!322869 (=> (not res!265039) (not e!232632))))

(assert (=> b!322869 (= res!265039 (= (bvand (_1!13444 lt!445565) (onesLSBLong!0 nBits!548)) (_1!13444 lt!445565)))))

(declare-fun b!322870 () Bool)

(declare-fun res!265041 () Bool)

(assert (=> b!322870 (=> (not res!265041) (not e!232633))))

(assert (=> b!322870 (= res!265041 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(assert (= (and start!71984 res!265043) b!322865))

(assert (= (and b!322865 res!265040) b!322866))

(assert (= (and b!322866 res!265045) b!322870))

(assert (= (and b!322870 res!265041) b!322868))

(assert (= (and b!322868 res!265038) b!322864))

(assert (= (and b!322864 res!265037) b!322862))

(assert (= (and b!322862 res!265044) b!322869))

(assert (= (and b!322869 res!265039) b!322863))

(assert (= (and b!322863 res!265042) b!322861))

(assert (= start!71984 b!322867))

(declare-fun m!461097 () Bool)

(assert (=> b!322867 m!461097))

(declare-fun m!461099 () Bool)

(assert (=> b!322869 m!461099))

(declare-fun m!461101 () Bool)

(assert (=> b!322861 m!461101))

(declare-fun m!461103 () Bool)

(assert (=> start!71984 m!461103))

(declare-fun m!461105 () Bool)

(assert (=> b!322862 m!461105))

(declare-fun m!461107 () Bool)

(assert (=> b!322865 m!461107))

(declare-fun m!461109 () Bool)

(assert (=> b!322864 m!461109))

(declare-fun m!461111 () Bool)

(assert (=> b!322864 m!461111))

(declare-fun m!461113 () Bool)

(assert (=> b!322866 m!461113))

(declare-fun m!461115 () Bool)

(assert (=> b!322868 m!461115))

(declare-fun m!461117 () Bool)

(assert (=> b!322868 m!461117))

(push 1)

(assert (not b!322868))

(assert (not b!322869))

(assert (not b!322864))

(assert (not b!322867))

(assert (not start!71984))

(assert (not b!322865))

(assert (not b!322861))

(assert (not b!322866))

(assert (not b!322862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105942 () Bool)

(assert (=> d!105942 (= (onesLSBLong!0 nBits!548) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!548))))))

(assert (=> b!322869 d!105942))

(declare-fun d!105944 () Bool)

(declare-fun e!232687 () Bool)

(assert (=> d!105944 e!232687))

(declare-fun res!265120 () Bool)

(assert (=> d!105944 (=> (not res!265120) (not e!232687))))

(declare-fun lt!445627 () (_ BitVec 64))

(declare-fun lt!445625 () (_ BitVec 64))

(declare-fun lt!445626 () (_ BitVec 64))

(assert (=> d!105944 (= res!265120 (= lt!445625 (bvsub lt!445626 lt!445627)))))

(assert (=> d!105944 (or (= (bvand lt!445626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445626 lt!445627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105944 (= lt!445627 (remainingBits!0 ((_ sign_extend 32) (size!8968 (buf!8110 (_2!13444 lt!445565)))) ((_ sign_extend 32) (currentByte!14966 (_2!13444 lt!445565))) ((_ sign_extend 32) (currentBit!14961 (_2!13444 lt!445565)))))))

(declare-fun lt!445628 () (_ BitVec 64))

(declare-fun lt!445623 () (_ BitVec 64))

(assert (=> d!105944 (= lt!445626 (bvmul lt!445628 lt!445623))))

(assert (=> d!105944 (or (= lt!445628 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445623 (bvsdiv (bvmul lt!445628 lt!445623) lt!445628)))))

(assert (=> d!105944 (= lt!445623 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105944 (= lt!445628 ((_ sign_extend 32) (size!8968 (buf!8110 (_2!13444 lt!445565)))))))

(assert (=> d!105944 (= lt!445625 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14966 (_2!13444 lt!445565))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14961 (_2!13444 lt!445565)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105944 (invariant!0 (currentBit!14961 (_2!13444 lt!445565)) (currentByte!14966 (_2!13444 lt!445565)) (size!8968 (buf!8110 (_2!13444 lt!445565))))))

(assert (=> d!105944 (= (bitIndex!0 (size!8968 (buf!8110 (_2!13444 lt!445565))) (currentByte!14966 (_2!13444 lt!445565)) (currentBit!14961 (_2!13444 lt!445565))) lt!445625)))

(declare-fun b!322956 () Bool)

(declare-fun res!265119 () Bool)

(assert (=> b!322956 (=> (not res!265119) (not e!232687))))

(assert (=> b!322956 (= res!265119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445625))))

(declare-fun b!322957 () Bool)

(declare-fun lt!445624 () (_ BitVec 64))

(assert (=> b!322957 (= e!232687 (bvsle lt!445625 (bvmul lt!445624 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322957 (or (= lt!445624 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445624 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445624)))))

(assert (=> b!322957 (= lt!445624 ((_ sign_extend 32) (size!8968 (buf!8110 (_2!13444 lt!445565)))))))

(assert (= (and d!105944 res!265120) b!322956))

(assert (= (and b!322956 res!265119) b!322957))

(declare-fun m!461177 () Bool)

(assert (=> d!105944 m!461177))

(declare-fun m!461179 () Bool)

(assert (=> d!105944 m!461179))

(assert (=> b!322864 d!105944))

(declare-fun d!105956 () Bool)

(declare-fun e!232688 () Bool)

(assert (=> d!105956 e!232688))

(declare-fun res!265122 () Bool)

(assert (=> d!105956 (=> (not res!265122) (not e!232688))))

(declare-fun lt!445635 () (_ BitVec 64))

(declare-fun lt!445633 () (_ BitVec 64))

(declare-fun lt!445634 () (_ BitVec 64))

(assert (=> d!105956 (= res!265122 (= lt!445633 (bvsub lt!445634 lt!445635)))))

(assert (=> d!105956 (or (= (bvand lt!445634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445634 lt!445635) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105956 (= lt!445635 (remainingBits!0 ((_ sign_extend 32) (size!8968 (buf!8110 thiss!1793))) ((_ sign_extend 32) (currentByte!14966 thiss!1793)) ((_ sign_extend 32) (currentBit!14961 thiss!1793))))))

(declare-fun lt!445636 () (_ BitVec 64))

(declare-fun lt!445631 () (_ BitVec 64))

(assert (=> d!105956 (= lt!445634 (bvmul lt!445636 lt!445631))))

(assert (=> d!105956 (or (= lt!445636 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445631 (bvsdiv (bvmul lt!445636 lt!445631) lt!445636)))))

(assert (=> d!105956 (= lt!445631 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105956 (= lt!445636 ((_ sign_extend 32) (size!8968 (buf!8110 thiss!1793))))))

(assert (=> d!105956 (= lt!445633 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14966 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14961 thiss!1793))))))

(assert (=> d!105956 (invariant!0 (currentBit!14961 thiss!1793) (currentByte!14966 thiss!1793) (size!8968 (buf!8110 thiss!1793)))))

(assert (=> d!105956 (= (bitIndex!0 (size!8968 (buf!8110 thiss!1793)) (currentByte!14966 thiss!1793) (currentBit!14961 thiss!1793)) lt!445633)))

(declare-fun b!322958 () Bool)

(declare-fun res!265121 () Bool)

(assert (=> b!322958 (=> (not res!265121) (not e!232688))))

(assert (=> b!322958 (= res!265121 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445633))))

(declare-fun b!322959 () Bool)

(declare-fun lt!445632 () (_ BitVec 64))

(assert (=> b!322959 (= e!232688 (bvsle lt!445633 (bvmul lt!445632 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322959 (or (= lt!445632 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445632 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445632)))))

(assert (=> b!322959 (= lt!445632 ((_ sign_extend 32) (size!8968 (buf!8110 thiss!1793))))))

(assert (= (and d!105956 res!265122) b!322958))

(assert (= (and b!322958 res!265121) b!322959))

(declare-fun m!461181 () Bool)

(assert (=> d!105956 m!461181))

(declare-fun m!461183 () Bool)

(assert (=> d!105956 m!461183))

(assert (=> b!322864 d!105956))

(declare-fun d!105958 () Bool)

(assert (=> d!105958 (= (onesLSBLong!0 i!743) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!743))))))

(assert (=> b!322862 d!105958))

(declare-fun d!105960 () Bool)

(assert (=> d!105960 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14961 thiss!1793) (currentByte!14966 thiss!1793) (size!8968 (buf!8110 thiss!1793))))))

(declare-fun bs!27899 () Bool)

(assert (= bs!27899 d!105960))

(assert (=> bs!27899 m!461183))

(assert (=> start!71984 d!105960))

(declare-fun b!323006 () Bool)

(declare-fun e!232713 () Bool)

(declare-fun lt!445713 () tuple2!23630)

(declare-fun lt!445714 () (_ BitVec 64))

(declare-datatypes ((tuple2!23646 0))(
  ( (tuple2!23647 (_1!13452 BitStream!14098) (_2!13452 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14098) tuple2!23646)

(assert (=> b!323006 (= e!232713 (= (= (bvand (bvlshr (_1!13444 lt!445713) lt!445714) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13452 (readBitPure!0 (_2!13445 lt!445566)))))))

(assert (=> b!323006 (and (bvsge lt!445714 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!445714 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!323006 (= lt!445714 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun b!323007 () Bool)

(declare-fun res!265159 () Bool)

(declare-fun e!232711 () Bool)

(assert (=> b!323007 (=> (not res!265159) (not e!232711))))

(assert (=> b!323007 (= res!265159 (= (bvand (_1!13444 lt!445713) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13445 lt!445566) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!323008 () Bool)

(declare-fun e!232712 () tuple2!23630)

(declare-fun lt!445711 () tuple2!23630)

(assert (=> b!323008 (= e!232712 (tuple2!23631 (_1!13444 lt!445711) (_2!13444 lt!445711)))))

(declare-fun lt!445712 () tuple2!23632)

(assert (=> b!323008 (= lt!445712 (readBit!0 (_2!13445 lt!445566)))))

(assert (=> b!323008 (= lt!445711 (readNBitsLSBFirstsLoop!0 (_2!13445 lt!445712) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13445 lt!445566) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13445 lt!445712) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!323009 () Bool)

(declare-fun res!265160 () Bool)

(assert (=> b!323009 (=> (not res!265160) (not e!232711))))

(declare-fun lt!445710 () (_ BitVec 64))

(declare-fun lt!445715 () (_ BitVec 64))

(assert (=> b!323009 (= res!265160 (= (bitIndex!0 (size!8968 (buf!8110 (_2!13444 lt!445713))) (currentByte!14966 (_2!13444 lt!445713)) (currentBit!14961 (_2!13444 lt!445713))) (bvadd lt!445710 lt!445715)))))

(assert (=> b!323009 (or (not (= (bvand lt!445710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445715 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445710 lt!445715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323009 (= lt!445715 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!323009 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!323009 (= lt!445710 (bitIndex!0 (size!8968 (buf!8110 (_2!13445 lt!445566))) (currentByte!14966 (_2!13445 lt!445566)) (currentBit!14961 (_2!13445 lt!445566))))))

(declare-fun b!323010 () Bool)

(assert (=> b!323010 (= e!232712 (tuple2!23631 (bvor acc!161 (ite (_1!13445 lt!445566) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13445 lt!445566)))))

(declare-fun b!323011 () Bool)

(declare-fun res!265162 () Bool)

(assert (=> b!323011 (=> (not res!265162) (not e!232711))))

(assert (=> b!323011 (= res!265162 (= (bvand (_1!13444 lt!445713) (onesLSBLong!0 nBits!548)) (_1!13444 lt!445713)))))

(declare-fun d!105962 () Bool)

(assert (=> d!105962 e!232711))

(declare-fun res!265161 () Bool)

(assert (=> d!105962 (=> (not res!265161) (not e!232711))))

(assert (=> d!105962 (= res!265161 (= (buf!8110 (_2!13444 lt!445713)) (buf!8110 (_2!13445 lt!445566))))))

(assert (=> d!105962 (= lt!445713 e!232712)))

(declare-fun c!15442 () Bool)

(assert (=> d!105962 (= c!15442 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!105962 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!105962 (= (readNBitsLSBFirstsLoop!0 (_2!13445 lt!445566) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13445 lt!445566) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!445713)))

(declare-fun b!323012 () Bool)

(assert (=> b!323012 (= e!232711 e!232713)))

(declare-fun res!265163 () Bool)

(assert (=> b!323012 (=> res!265163 e!232713)))

(assert (=> b!323012 (= res!265163 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(assert (= (and d!105962 c!15442) b!323010))

(assert (= (and d!105962 (not c!15442)) b!323008))

(assert (= (and d!105962 res!265161) b!323009))

(assert (= (and b!323009 res!265160) b!323007))

(assert (= (and b!323007 res!265159) b!323011))

(assert (= (and b!323011 res!265162) b!323012))

(assert (= (and b!323012 (not res!265163)) b!323006))

(declare-fun m!461213 () Bool)

(assert (=> b!323006 m!461213))

(declare-fun m!461215 () Bool)

(assert (=> b!323007 m!461215))

(declare-fun m!461217 () Bool)

(assert (=> b!323009 m!461217))

(declare-fun m!461219 () Bool)

(assert (=> b!323009 m!461219))

(declare-fun m!461221 () Bool)

(assert (=> b!323008 m!461221))

(declare-fun m!461223 () Bool)

(assert (=> b!323008 m!461223))

(assert (=> b!323011 m!461099))

(assert (=> b!322868 d!105962))

(declare-fun d!105982 () Bool)

(declare-fun e!232727 () Bool)

(assert (=> d!105982 e!232727))

(declare-fun res!265169 () Bool)

(assert (=> d!105982 (=> (not res!265169) (not e!232727))))

(declare-datatypes ((Unit!22034 0))(
  ( (Unit!22035) )
))
(declare-datatypes ((tuple2!23650 0))(
  ( (tuple2!23651 (_1!13454 Unit!22034) (_2!13454 BitStream!14098)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14098) tuple2!23650)

(assert (=> d!105982 (= res!265169 (= (buf!8110 (_2!13454 (increaseBitIndex!0 thiss!1793))) (buf!8110 thiss!1793)))))

(declare-fun lt!445751 () Bool)

(assert (=> d!105982 (= lt!445751 (not (= (bvand ((_ sign_extend 24) (select (arr!10060 (buf!8110 thiss!1793)) (currentByte!14966 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14961 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445756 () tuple2!23632)

(assert (=> d!105982 (= lt!445756 (tuple2!23633 (not (= (bvand ((_ sign_extend 24) (select (arr!10060 (buf!8110 thiss!1793)) (currentByte!14966 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14961 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13454 (increaseBitIndex!0 thiss!1793))))))

(assert (=> d!105982 (validate_offset_bit!0 ((_ sign_extend 32) (size!8968 (buf!8110 thiss!1793))) ((_ sign_extend 32) (currentByte!14966 thiss!1793)) ((_ sign_extend 32) (currentBit!14961 thiss!1793)))))

(assert (=> d!105982 (= (readBit!0 thiss!1793) lt!445756)))

(declare-fun lt!445755 () (_ BitVec 64))

(declare-fun lt!445754 () (_ BitVec 64))

(declare-fun b!323018 () Bool)

(assert (=> b!323018 (= e!232727 (= (bitIndex!0 (size!8968 (buf!8110 (_2!13454 (increaseBitIndex!0 thiss!1793)))) (currentByte!14966 (_2!13454 (increaseBitIndex!0 thiss!1793))) (currentBit!14961 (_2!13454 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!445754 lt!445755)))))

(assert (=> b!323018 (or (not (= (bvand lt!445754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445755 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445754 lt!445755) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323018 (= lt!445755 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!323018 (= lt!445754 (bitIndex!0 (size!8968 (buf!8110 thiss!1793)) (currentByte!14966 thiss!1793) (currentBit!14961 thiss!1793)))))

(declare-fun lt!445757 () Bool)

(assert (=> b!323018 (= lt!445757 (not (= (bvand ((_ sign_extend 24) (select (arr!10060 (buf!8110 thiss!1793)) (currentByte!14966 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14961 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445753 () Bool)

(assert (=> b!323018 (= lt!445753 (not (= (bvand ((_ sign_extend 24) (select (arr!10060 (buf!8110 thiss!1793)) (currentByte!14966 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14961 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445752 () Bool)

(assert (=> b!323018 (= lt!445752 (not (= (bvand ((_ sign_extend 24) (select (arr!10060 (buf!8110 thiss!1793)) (currentByte!14966 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14961 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105982 res!265169) b!323018))

(declare-fun m!461235 () Bool)

(assert (=> d!105982 m!461235))

(declare-fun m!461237 () Bool)

(assert (=> d!105982 m!461237))

(declare-fun m!461239 () Bool)

(assert (=> d!105982 m!461239))

(assert (=> d!105982 m!461101))

(assert (=> b!323018 m!461235))

(declare-fun m!461241 () Bool)

(assert (=> b!323018 m!461241))

(assert (=> b!323018 m!461237))

(assert (=> b!323018 m!461239))

(assert (=> b!323018 m!461111))

(assert (=> b!322868 d!105982))

(declare-fun d!105990 () Bool)

(assert (=> d!105990 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8968 (buf!8110 thiss!1793))) ((_ sign_extend 32) (currentByte!14966 thiss!1793)) ((_ sign_extend 32) (currentBit!14961 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8968 (buf!8110 thiss!1793))) ((_ sign_extend 32) (currentByte!14966 thiss!1793)) ((_ sign_extend 32) (currentBit!14961 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27904 () Bool)

(assert (= bs!27904 d!105990))

(assert (=> bs!27904 m!461181))

(assert (=> b!322861 d!105990))

(declare-fun d!105992 () Bool)

(assert (=> d!105992 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322866 d!105992))

(declare-fun d!105994 () Bool)

(assert (=> d!105994 (= (array_inv!8520 (buf!8110 thiss!1793)) (bvsge (size!8968 (buf!8110 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322867 d!105994))

(declare-fun d!105996 () Bool)

(assert (=> d!105996 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8968 (buf!8110 thiss!1793))) ((_ sign_extend 32) (currentByte!14966 thiss!1793)) ((_ sign_extend 32) (currentBit!14961 thiss!1793)) lt!445568) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8968 (buf!8110 thiss!1793))) ((_ sign_extend 32) (currentByte!14966 thiss!1793)) ((_ sign_extend 32) (currentBit!14961 thiss!1793))) lt!445568))))

(declare-fun bs!27905 () Bool)

(assert (= bs!27905 d!105996))

(assert (=> bs!27905 m!461181))

(assert (=> b!322865 d!105996))

(push 1)

(assert (not d!105956))

(assert (not b!323011))

(assert (not b!323006))

(assert (not d!105960))

(assert (not d!105996))

(assert (not b!323009))

(assert (not d!105944))

(assert (not b!323018))

(assert (not d!105982))

(assert (not b!323008))

(assert (not d!105990))

(assert (not b!323007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

