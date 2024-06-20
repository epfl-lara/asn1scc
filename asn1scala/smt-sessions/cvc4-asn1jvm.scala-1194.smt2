; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33882 () Bool)

(assert start!33882)

(declare-fun b!161858 () Bool)

(declare-fun e!111578 () Bool)

(declare-fun e!111576 () Bool)

(assert (=> b!161858 (= e!111578 (not e!111576))))

(declare-fun res!134934 () Bool)

(assert (=> b!161858 (=> res!134934 e!111576)))

(declare-datatypes ((array!8020 0))(
  ( (array!8021 (arr!4518 (Array (_ BitVec 32) (_ BitVec 8))) (size!3597 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6362 0))(
  ( (BitStream!6363 (buf!4055 array!8020) (currentByte!7549 (_ BitVec 32)) (currentBit!7544 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6362)

(declare-fun lt!254893 () array!8020)

(declare-datatypes ((Unit!11158 0))(
  ( (Unit!11159) )
))
(declare-datatypes ((tuple3!922 0))(
  ( (tuple3!923 (_1!7812 Unit!11158) (_2!7812 (_ BitVec 8)) (_3!578 BitStream!6362)) )
))
(declare-fun lt!254888 () tuple3!922)

(declare-fun arrayRangesEq!549 (array!8020 array!8020 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161858 (= res!134934 (not (arrayRangesEq!549 (buf!4055 thiss!1602) lt!254893 #b00000000000000000000000000000000 (bvsub (currentByte!7549 (_3!578 lt!254888)) #b00000000000000000000000000000001))))))

(declare-fun lt!254885 () (_ BitVec 8))

(assert (=> b!161858 (arrayRangesEq!549 (buf!4055 thiss!1602) (array!8021 (store (arr!4518 (buf!4055 thiss!1602)) (bvsub (currentByte!7549 (_3!578 lt!254888)) #b00000000000000000000000000000001) lt!254885) (size!3597 (buf!4055 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7549 (_3!578 lt!254888)) #b00000000000000000000000000000001))))

(declare-fun lt!254886 () Unit!11158)

(declare-fun arrayUpdatedAtPrefixLemma!157 (array!8020 (_ BitVec 32) (_ BitVec 8)) Unit!11158)

(assert (=> b!161858 (= lt!254886 (arrayUpdatedAtPrefixLemma!157 (buf!4055 thiss!1602) (bvsub (currentByte!7549 (_3!578 lt!254888)) #b00000000000000000000000000000001) lt!254885))))

(assert (=> b!161858 (= lt!254885 (select (arr!4518 (buf!4055 (_3!578 lt!254888))) (bvsub (currentByte!7549 (_3!578 lt!254888)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254887 () (_ BitVec 8))

(declare-fun lt!254892 () (_ BitVec 8))

(declare-fun lt!254889 () Bool)

(declare-fun lt!254891 () (_ BitVec 32))

(declare-fun lt!254890 () (_ BitVec 32))

(declare-fun lt!254895 () (_ BitVec 8))

(declare-fun Unit!11160 () Unit!11158)

(declare-fun Unit!11161 () Unit!11158)

(assert (=> b!161858 (= lt!254888 (ite lt!254889 (let ((bdg!9735 ((_ extract 7 0) (bvnot lt!254890)))) (let ((bdg!9736 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4518 (buf!4055 thiss!1602)) (currentByte!7549 thiss!1602) lt!254895) (currentByte!7549 thiss!1602) lt!254892) (bvadd #b00000000000000000000000000000001 (currentByte!7549 thiss!1602)))) ((_ sign_extend 24) bdg!9735))))) (tuple3!923 Unit!11160 bdg!9735 (BitStream!6363 (array!8021 (store (arr!4518 (array!8021 (store (arr!4518 lt!254893) (bvadd #b00000000000000000000000000000001 (currentByte!7549 thiss!1602)) bdg!9736) (size!3597 lt!254893))) (bvadd #b00000000000000000000000000000001 (currentByte!7549 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9736) (bvshl ((_ sign_extend 24) v!222) lt!254891)))) (size!3597 (array!8021 (store (arr!4518 lt!254893) (bvadd #b00000000000000000000000000000001 (currentByte!7549 thiss!1602)) bdg!9736) (size!3597 lt!254893)))) (bvadd #b00000000000000000000000000000001 (currentByte!7549 thiss!1602)) (currentBit!7544 thiss!1602))))) (tuple3!923 Unit!11161 lt!254887 (BitStream!6363 lt!254893 (bvadd #b00000000000000000000000000000001 (currentByte!7549 thiss!1602)) (currentBit!7544 thiss!1602)))))))

(declare-fun lt!254894 () (_ BitVec 32))

(assert (=> b!161858 (= lt!254889 (bvsgt lt!254894 #b00000000000000000000000000000000))))

(declare-fun e!111579 () Bool)

(assert (=> b!161858 e!111579))

(declare-fun res!134933 () Bool)

(assert (=> b!161858 (=> res!134933 e!111579)))

(assert (=> b!161858 (= res!134933 (bvsge (currentByte!7549 thiss!1602) (size!3597 (buf!4055 thiss!1602))))))

(assert (=> b!161858 (= lt!254893 (array!8021 (store (store (arr!4518 (buf!4055 thiss!1602)) (currentByte!7549 thiss!1602) lt!254895) (currentByte!7549 thiss!1602) lt!254892) (size!3597 (buf!4055 thiss!1602))))))

(assert (=> b!161858 (= lt!254892 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254895) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254894))))))

(assert (=> b!161858 (= lt!254895 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4518 (buf!4055 thiss!1602)) (currentByte!7549 thiss!1602))) lt!254890)))))

(assert (=> b!161858 (= lt!254890 ((_ sign_extend 24) lt!254887))))

(assert (=> b!161858 (= lt!254887 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254891)))))))

(assert (=> b!161858 (= lt!254891 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254894))))))

(assert (=> b!161858 (= lt!254894 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7544 thiss!1602))))))

(declare-fun b!161860 () Bool)

(declare-fun res!134936 () Bool)

(assert (=> b!161860 (=> res!134936 e!111576)))

(assert (=> b!161860 (= res!134936 lt!254889)))

(declare-fun b!161861 () Bool)

(assert (=> b!161861 (= e!111576 (arrayRangesEq!549 (buf!4055 thiss!1602) (buf!4055 (_3!578 lt!254888)) #b00000000000000000000000000000000 (currentByte!7549 thiss!1602)))))

(declare-fun b!161862 () Bool)

(declare-fun e!111575 () Bool)

(declare-fun array_inv!3344 (array!8020) Bool)

(assert (=> b!161862 (= e!111575 (array_inv!3344 (buf!4055 thiss!1602)))))

(declare-fun b!161859 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161859 (= e!111579 (byteRangesEq!0 (select (arr!4518 (buf!4055 thiss!1602)) (currentByte!7549 thiss!1602)) lt!254892 #b00000000000000000000000000000000 (currentBit!7544 thiss!1602)))))

(declare-fun res!134935 () Bool)

(assert (=> start!33882 (=> (not res!134935) (not e!111578))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33882 (= res!134935 (validate_offset_byte!0 ((_ sign_extend 32) (size!3597 (buf!4055 thiss!1602))) ((_ sign_extend 32) (currentByte!7549 thiss!1602)) ((_ sign_extend 32) (currentBit!7544 thiss!1602))))))

(assert (=> start!33882 e!111578))

(declare-fun inv!12 (BitStream!6362) Bool)

(assert (=> start!33882 (and (inv!12 thiss!1602) e!111575)))

(assert (=> start!33882 true))

(assert (= (and start!33882 res!134935) b!161858))

(assert (= (and b!161858 (not res!134933)) b!161859))

(assert (= (and b!161858 (not res!134934)) b!161860))

(assert (= (and b!161860 (not res!134936)) b!161861))

(assert (= start!33882 b!161862))

(declare-fun m!256811 () Bool)

(assert (=> b!161861 m!256811))

(declare-fun m!256813 () Bool)

(assert (=> b!161862 m!256813))

(declare-fun m!256815 () Bool)

(assert (=> start!33882 m!256815))

(declare-fun m!256817 () Bool)

(assert (=> start!33882 m!256817))

(declare-fun m!256819 () Bool)

(assert (=> b!161858 m!256819))

(declare-fun m!256821 () Bool)

(assert (=> b!161858 m!256821))

(declare-fun m!256823 () Bool)

(assert (=> b!161858 m!256823))

(declare-fun m!256825 () Bool)

(assert (=> b!161858 m!256825))

(declare-fun m!256827 () Bool)

(assert (=> b!161858 m!256827))

(declare-fun m!256829 () Bool)

(assert (=> b!161858 m!256829))

(declare-fun m!256831 () Bool)

(assert (=> b!161858 m!256831))

(declare-fun m!256833 () Bool)

(assert (=> b!161858 m!256833))

(declare-fun m!256835 () Bool)

(assert (=> b!161858 m!256835))

(declare-fun m!256837 () Bool)

(assert (=> b!161858 m!256837))

(declare-fun m!256839 () Bool)

(assert (=> b!161858 m!256839))

(declare-fun m!256841 () Bool)

(assert (=> b!161858 m!256841))

(assert (=> b!161859 m!256839))

(assert (=> b!161859 m!256839))

(declare-fun m!256843 () Bool)

(assert (=> b!161859 m!256843))

(push 1)

(assert (not b!161861))

(assert (not b!161859))

(assert (not b!161862))

(assert (not b!161858))

(assert (not start!33882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

