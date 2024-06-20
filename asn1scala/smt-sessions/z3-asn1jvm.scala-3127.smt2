; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71920 () Bool)

(assert start!71920)

(declare-fun res!264783 () Bool)

(declare-fun e!232419 () Bool)

(assert (=> start!71920 (=> (not res!264783) (not e!232419))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71920 (= res!264783 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71920 e!232419))

(assert (=> start!71920 true))

(declare-datatypes ((array!20580 0))(
  ( (array!20581 (arr!10049 (Array (_ BitVec 32) (_ BitVec 8))) (size!8957 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14076 0))(
  ( (BitStream!14077 (buf!8099 array!20580) (currentByte!14949 (_ BitVec 32)) (currentBit!14944 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14076)

(declare-fun e!232422 () Bool)

(declare-fun inv!12 (BitStream!14076) Bool)

(assert (=> start!71920 (and (inv!12 thiss!1793) e!232422)))

(declare-fun b!322556 () Bool)

(declare-fun e!232421 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!322556 (= e!232421 (not (invariant!0 (currentBit!14944 thiss!1793) (currentByte!14949 thiss!1793) (size!8957 (buf!8099 thiss!1793)))))))

(declare-fun b!322557 () Bool)

(assert (=> b!322557 (= e!232419 e!232421)))

(declare-fun res!264787 () Bool)

(assert (=> b!322557 (=> (not res!264787) (not e!232421))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((tuple2!23578 0))(
  ( (tuple2!23579 (_1!13418 Bool) (_2!13418 BitStream!14076)) )
))
(declare-fun lt!445346 () tuple2!23578)

(declare-datatypes ((tuple2!23580 0))(
  ( (tuple2!23581 (_1!13419 (_ BitVec 64)) (_2!13419 BitStream!14076)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23580)

(assert (=> b!322557 (= res!264787 (= (buf!8099 (_2!13419 (readNBitsLSBFirstsLoop!0 (_2!13418 lt!445346) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13418 lt!445346) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!8099 thiss!1793)))))

(declare-fun readBit!0 (BitStream!14076) tuple2!23578)

(assert (=> b!322557 (= lt!445346 (readBit!0 thiss!1793))))

(declare-fun b!322558 () Bool)

(declare-fun res!264785 () Bool)

(assert (=> b!322558 (=> (not res!264785) (not e!232419))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322558 (= res!264785 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322559 () Bool)

(declare-fun res!264784 () Bool)

(assert (=> b!322559 (=> (not res!264784) (not e!232419))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322559 (= res!264784 (validate_offset_bits!1 ((_ sign_extend 32) (size!8957 (buf!8099 thiss!1793))) ((_ sign_extend 32) (currentByte!14949 thiss!1793)) ((_ sign_extend 32) (currentBit!14944 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322560 () Bool)

(declare-fun res!264786 () Bool)

(assert (=> b!322560 (=> (not res!264786) (not e!232419))))

(assert (=> b!322560 (= res!264786 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322561 () Bool)

(declare-fun array_inv!8509 (array!20580) Bool)

(assert (=> b!322561 (= e!232422 (array_inv!8509 (buf!8099 thiss!1793)))))

(assert (= (and start!71920 res!264783) b!322559))

(assert (= (and b!322559 res!264784) b!322558))

(assert (= (and b!322558 res!264785) b!322560))

(assert (= (and b!322560 res!264786) b!322557))

(assert (= (and b!322557 res!264787) b!322556))

(assert (= start!71920 b!322561))

(declare-fun m!460835 () Bool)

(assert (=> b!322556 m!460835))

(declare-fun m!460837 () Bool)

(assert (=> b!322558 m!460837))

(declare-fun m!460839 () Bool)

(assert (=> start!71920 m!460839))

(declare-fun m!460841 () Bool)

(assert (=> b!322559 m!460841))

(declare-fun m!460843 () Bool)

(assert (=> b!322557 m!460843))

(declare-fun m!460845 () Bool)

(assert (=> b!322557 m!460845))

(declare-fun m!460847 () Bool)

(assert (=> b!322561 m!460847))

(check-sat (not b!322561) (not b!322557) (not b!322559) (not b!322556) (not start!71920) (not b!322558))
(check-sat)
(get-model)

(declare-fun d!105886 () Bool)

(assert (=> d!105886 (= (invariant!0 (currentBit!14944 thiss!1793) (currentByte!14949 thiss!1793) (size!8957 (buf!8099 thiss!1793))) (and (bvsge (currentBit!14944 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14944 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14949 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14949 thiss!1793) (size!8957 (buf!8099 thiss!1793))) (and (= (currentBit!14944 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14949 thiss!1793) (size!8957 (buf!8099 thiss!1793)))))))))

(assert (=> b!322556 d!105886))

(declare-fun d!105888 () Bool)

(assert (=> d!105888 (= (array_inv!8509 (buf!8099 thiss!1793)) (bvsge (size!8957 (buf!8099 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322561 d!105888))

(declare-fun d!105890 () Bool)

(assert (=> d!105890 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14944 thiss!1793) (currentByte!14949 thiss!1793) (size!8957 (buf!8099 thiss!1793))))))

(declare-fun bs!27879 () Bool)

(assert (= bs!27879 d!105890))

(assert (=> bs!27879 m!460835))

(assert (=> start!71920 d!105890))

(declare-fun d!105892 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105892 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8957 (buf!8099 thiss!1793))) ((_ sign_extend 32) (currentByte!14949 thiss!1793)) ((_ sign_extend 32) (currentBit!14944 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8957 (buf!8099 thiss!1793))) ((_ sign_extend 32) (currentByte!14949 thiss!1793)) ((_ sign_extend 32) (currentBit!14944 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27880 () Bool)

(assert (= bs!27880 d!105892))

(declare-fun m!460863 () Bool)

(assert (=> bs!27880 m!460863))

(assert (=> b!322559 d!105892))

(declare-fun d!105894 () Bool)

(assert (=> d!105894 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322558 d!105894))

(declare-fun b!322595 () Bool)

(declare-fun res!264813 () Bool)

(declare-fun e!232443 () Bool)

(assert (=> b!322595 (=> (not res!264813) (not e!232443))))

(declare-fun lt!445363 () (_ BitVec 64))

(declare-fun lt!445364 () (_ BitVec 64))

(declare-fun lt!445362 () tuple2!23580)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322595 (= res!264813 (= (bitIndex!0 (size!8957 (buf!8099 (_2!13419 lt!445362))) (currentByte!14949 (_2!13419 lt!445362)) (currentBit!14944 (_2!13419 lt!445362))) (bvadd lt!445363 lt!445364)))))

(assert (=> b!322595 (or (not (= (bvand lt!445363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445364 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445363 lt!445364) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322595 (= lt!445364 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!322595 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!322595 (= lt!445363 (bitIndex!0 (size!8957 (buf!8099 (_2!13418 lt!445346))) (currentByte!14949 (_2!13418 lt!445346)) (currentBit!14944 (_2!13418 lt!445346))))))

(declare-fun b!322596 () Bool)

(declare-fun e!232441 () tuple2!23580)

(declare-fun lt!445365 () tuple2!23580)

(assert (=> b!322596 (= e!232441 (tuple2!23581 (_1!13419 lt!445365) (_2!13419 lt!445365)))))

(declare-fun lt!445366 () tuple2!23578)

(assert (=> b!322596 (= lt!445366 (readBit!0 (_2!13418 lt!445346)))))

(assert (=> b!322596 (= lt!445365 (readNBitsLSBFirstsLoop!0 (_2!13418 lt!445366) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13418 lt!445346) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13418 lt!445366) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!445367 () (_ BitVec 64))

(declare-fun e!232442 () Bool)

(declare-fun b!322597 () Bool)

(declare-datatypes ((tuple2!23590 0))(
  ( (tuple2!23591 (_1!13424 BitStream!14076) (_2!13424 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14076) tuple2!23590)

(assert (=> b!322597 (= e!232442 (= (= (bvand (bvlshr (_1!13419 lt!445362) lt!445367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13424 (readBitPure!0 (_2!13418 lt!445346)))))))

(assert (=> b!322597 (and (bvsge lt!445367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!445367 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!322597 (= lt!445367 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun b!322598 () Bool)

(declare-fun res!264815 () Bool)

(assert (=> b!322598 (=> (not res!264815) (not e!232443))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322598 (= res!264815 (= (bvand (_1!13419 lt!445362) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13418 lt!445346) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!322594 () Bool)

(assert (=> b!322594 (= e!232441 (tuple2!23581 (bvor acc!161 (ite (_1!13418 lt!445346) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13418 lt!445346)))))

(declare-fun d!105896 () Bool)

(assert (=> d!105896 e!232443))

(declare-fun res!264816 () Bool)

(assert (=> d!105896 (=> (not res!264816) (not e!232443))))

(assert (=> d!105896 (= res!264816 (= (buf!8099 (_2!13419 lt!445362)) (buf!8099 (_2!13418 lt!445346))))))

(assert (=> d!105896 (= lt!445362 e!232441)))

(declare-fun c!15427 () Bool)

(assert (=> d!105896 (= c!15427 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!105896 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!105896 (= (readNBitsLSBFirstsLoop!0 (_2!13418 lt!445346) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13418 lt!445346) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!445362)))

(declare-fun b!322599 () Bool)

(assert (=> b!322599 (= e!232443 e!232442)))

(declare-fun res!264817 () Bool)

(assert (=> b!322599 (=> res!264817 e!232442)))

(assert (=> b!322599 (= res!264817 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun b!322600 () Bool)

(declare-fun res!264814 () Bool)

(assert (=> b!322600 (=> (not res!264814) (not e!232443))))

(assert (=> b!322600 (= res!264814 (= (bvand (_1!13419 lt!445362) (onesLSBLong!0 nBits!548)) (_1!13419 lt!445362)))))

(assert (= (and d!105896 c!15427) b!322594))

(assert (= (and d!105896 (not c!15427)) b!322596))

(assert (= (and d!105896 res!264816) b!322595))

(assert (= (and b!322595 res!264813) b!322598))

(assert (= (and b!322598 res!264815) b!322600))

(assert (= (and b!322600 res!264814) b!322599))

(assert (= (and b!322599 (not res!264817)) b!322597))

(declare-fun m!460869 () Bool)

(assert (=> b!322598 m!460869))

(declare-fun m!460871 () Bool)

(assert (=> b!322596 m!460871))

(declare-fun m!460873 () Bool)

(assert (=> b!322596 m!460873))

(declare-fun m!460875 () Bool)

(assert (=> b!322597 m!460875))

(declare-fun m!460877 () Bool)

(assert (=> b!322600 m!460877))

(declare-fun m!460879 () Bool)

(assert (=> b!322595 m!460879))

(declare-fun m!460881 () Bool)

(assert (=> b!322595 m!460881))

(assert (=> b!322557 d!105896))

(declare-fun d!105920 () Bool)

(declare-fun e!232475 () Bool)

(assert (=> d!105920 e!232475))

(declare-fun res!264853 () Bool)

(assert (=> d!105920 (=> (not res!264853) (not e!232475))))

(declare-datatypes ((Unit!22030 0))(
  ( (Unit!22031) )
))
(declare-datatypes ((tuple2!23592 0))(
  ( (tuple2!23593 (_1!13425 Unit!22030) (_2!13425 BitStream!14076)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14076) tuple2!23592)

(assert (=> d!105920 (= res!264853 (= (buf!8099 (_2!13425 (increaseBitIndex!0 thiss!1793))) (buf!8099 thiss!1793)))))

(declare-fun lt!445441 () Bool)

(assert (=> d!105920 (= lt!445441 (not (= (bvand ((_ sign_extend 24) (select (arr!10049 (buf!8099 thiss!1793)) (currentByte!14949 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14944 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445443 () tuple2!23578)

(assert (=> d!105920 (= lt!445443 (tuple2!23579 (not (= (bvand ((_ sign_extend 24) (select (arr!10049 (buf!8099 thiss!1793)) (currentByte!14949 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14944 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13425 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105920 (validate_offset_bit!0 ((_ sign_extend 32) (size!8957 (buf!8099 thiss!1793))) ((_ sign_extend 32) (currentByte!14949 thiss!1793)) ((_ sign_extend 32) (currentBit!14944 thiss!1793)))))

(assert (=> d!105920 (= (readBit!0 thiss!1793) lt!445443)))

(declare-fun lt!445444 () (_ BitVec 64))

(declare-fun lt!445445 () (_ BitVec 64))

(declare-fun b!322648 () Bool)

(assert (=> b!322648 (= e!232475 (= (bitIndex!0 (size!8957 (buf!8099 (_2!13425 (increaseBitIndex!0 thiss!1793)))) (currentByte!14949 (_2!13425 (increaseBitIndex!0 thiss!1793))) (currentBit!14944 (_2!13425 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!445444 lt!445445)))))

(assert (=> b!322648 (or (not (= (bvand lt!445444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445445 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445444 lt!445445) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322648 (= lt!445445 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322648 (= lt!445444 (bitIndex!0 (size!8957 (buf!8099 thiss!1793)) (currentByte!14949 thiss!1793) (currentBit!14944 thiss!1793)))))

(declare-fun lt!445439 () Bool)

(assert (=> b!322648 (= lt!445439 (not (= (bvand ((_ sign_extend 24) (select (arr!10049 (buf!8099 thiss!1793)) (currentByte!14949 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14944 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445440 () Bool)

(assert (=> b!322648 (= lt!445440 (not (= (bvand ((_ sign_extend 24) (select (arr!10049 (buf!8099 thiss!1793)) (currentByte!14949 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14944 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445442 () Bool)

(assert (=> b!322648 (= lt!445442 (not (= (bvand ((_ sign_extend 24) (select (arr!10049 (buf!8099 thiss!1793)) (currentByte!14949 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14944 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105920 res!264853) b!322648))

(declare-fun m!460923 () Bool)

(assert (=> d!105920 m!460923))

(declare-fun m!460925 () Bool)

(assert (=> d!105920 m!460925))

(declare-fun m!460927 () Bool)

(assert (=> d!105920 m!460927))

(declare-fun m!460929 () Bool)

(assert (=> d!105920 m!460929))

(assert (=> b!322648 m!460925))

(assert (=> b!322648 m!460923))

(declare-fun m!460931 () Bool)

(assert (=> b!322648 m!460931))

(declare-fun m!460933 () Bool)

(assert (=> b!322648 m!460933))

(assert (=> b!322648 m!460927))

(assert (=> b!322557 d!105920))

(check-sat (not b!322600) (not b!322597) (not b!322648) (not d!105890) (not b!322598) (not b!322596) (not d!105920) (not d!105892) (not b!322595))
