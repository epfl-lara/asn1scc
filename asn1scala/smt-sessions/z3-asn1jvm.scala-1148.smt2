; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32526 () Bool)

(assert start!32526)

(declare-fun res!133729 () Bool)

(declare-fun e!109626 () Bool)

(assert (=> start!32526 (=> (not res!133729) (not e!109626))))

(declare-datatypes ((array!7644 0))(
  ( (array!7645 (arr!4379 (Array (_ BitVec 32) (_ BitVec 8))) (size!3458 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6084 0))(
  ( (BitStream!6085 (buf!3916 array!7644) (currentByte!7171 (_ BitVec 32)) (currentBit!7166 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6084)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32526 (= res!133729 (validate_offset_byte!0 ((_ sign_extend 32) (size!3458 (buf!3916 thiss!1602))) ((_ sign_extend 32) (currentByte!7171 thiss!1602)) ((_ sign_extend 32) (currentBit!7166 thiss!1602))))))

(assert (=> start!32526 e!109626))

(declare-fun e!109627 () Bool)

(declare-fun inv!12 (BitStream!6084) Bool)

(assert (=> start!32526 (and (inv!12 thiss!1602) e!109627)))

(assert (=> start!32526 true))

(declare-fun b!160237 () Bool)

(declare-fun lt!252894 () array!7644)

(declare-datatypes ((Unit!10950 0))(
  ( (Unit!10951) )
))
(declare-datatypes ((tuple3!818 0))(
  ( (tuple3!819 (_1!7760 Unit!10950) (_2!7760 (_ BitVec 8)) (_3!526 BitStream!6084)) )
))
(declare-fun lt!252893 () tuple3!818)

(declare-fun arrayRangesEq!509 (array!7644 array!7644 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160237 (= e!109626 (not (arrayRangesEq!509 (buf!3916 thiss!1602) lt!252894 #b00000000000000000000000000000000 (bvsub (currentByte!7171 (_3!526 lt!252893)) #b00000000000000000000000000000001))))))

(declare-fun lt!252891 () (_ BitVec 8))

(assert (=> b!160237 (arrayRangesEq!509 (buf!3916 thiss!1602) (array!7645 (store (arr!4379 (buf!3916 thiss!1602)) (bvsub (currentByte!7171 (_3!526 lt!252893)) #b00000000000000000000000000000001) lt!252891) (size!3458 (buf!3916 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7171 (_3!526 lt!252893)) #b00000000000000000000000000000001))))

(declare-fun lt!252892 () Unit!10950)

(declare-fun arrayUpdatedAtPrefixLemma!117 (array!7644 (_ BitVec 32) (_ BitVec 8)) Unit!10950)

(assert (=> b!160237 (= lt!252892 (arrayUpdatedAtPrefixLemma!117 (buf!3916 thiss!1602) (bvsub (currentByte!7171 (_3!526 lt!252893)) #b00000000000000000000000000000001) lt!252891))))

(assert (=> b!160237 (= lt!252891 (select (arr!4379 (buf!3916 (_3!526 lt!252893))) (bvsub (currentByte!7171 (_3!526 lt!252893)) #b00000000000000000000000000000001)))))

(declare-fun lt!252898 () (_ BitVec 32))

(declare-fun lt!252895 () (_ BitVec 8))

(declare-fun lt!252897 () (_ BitVec 8))

(declare-fun lt!252899 () (_ BitVec 32))

(declare-fun lt!252900 () (_ BitVec 8))

(declare-fun lt!252896 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun Unit!10952 () Unit!10950)

(declare-fun Unit!10953 () Unit!10950)

(assert (=> b!160237 (= lt!252893 (ite (bvsgt lt!252898 #b00000000000000000000000000000000) (let ((bdg!9489 ((_ extract 7 0) (bvnot lt!252896)))) (let ((bdg!9490 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4379 (buf!3916 thiss!1602)) (currentByte!7171 thiss!1602) lt!252897) (currentByte!7171 thiss!1602) lt!252900) (bvadd #b00000000000000000000000000000001 (currentByte!7171 thiss!1602)))) ((_ sign_extend 24) bdg!9489))))) (tuple3!819 Unit!10952 bdg!9489 (BitStream!6085 (array!7645 (store (arr!4379 (array!7645 (store (arr!4379 lt!252894) (bvadd #b00000000000000000000000000000001 (currentByte!7171 thiss!1602)) bdg!9490) (size!3458 lt!252894))) (bvadd #b00000000000000000000000000000001 (currentByte!7171 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9490) (bvshl ((_ sign_extend 24) v!222) lt!252899)))) (size!3458 (array!7645 (store (arr!4379 lt!252894) (bvadd #b00000000000000000000000000000001 (currentByte!7171 thiss!1602)) bdg!9490) (size!3458 lt!252894)))) (bvadd #b00000000000000000000000000000001 (currentByte!7171 thiss!1602)) (currentBit!7166 thiss!1602))))) (tuple3!819 Unit!10953 lt!252895 (BitStream!6085 lt!252894 (bvadd #b00000000000000000000000000000001 (currentByte!7171 thiss!1602)) (currentBit!7166 thiss!1602)))))))

(declare-fun e!109628 () Bool)

(assert (=> b!160237 e!109628))

(declare-fun res!133730 () Bool)

(assert (=> b!160237 (=> res!133730 e!109628)))

(assert (=> b!160237 (= res!133730 (bvsge (currentByte!7171 thiss!1602) (size!3458 (buf!3916 thiss!1602))))))

(assert (=> b!160237 (= lt!252894 (array!7645 (store (store (arr!4379 (buf!3916 thiss!1602)) (currentByte!7171 thiss!1602) lt!252897) (currentByte!7171 thiss!1602) lt!252900) (size!3458 (buf!3916 thiss!1602))))))

(assert (=> b!160237 (= lt!252900 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252897) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252898))))))

(assert (=> b!160237 (= lt!252897 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4379 (buf!3916 thiss!1602)) (currentByte!7171 thiss!1602))) lt!252896)))))

(assert (=> b!160237 (= lt!252896 ((_ sign_extend 24) lt!252895))))

(assert (=> b!160237 (= lt!252895 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252899)))))))

(assert (=> b!160237 (= lt!252899 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252898))))))

(assert (=> b!160237 (= lt!252898 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7166 thiss!1602))))))

(declare-fun b!160238 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160238 (= e!109628 (byteRangesEq!0 (select (arr!4379 (buf!3916 thiss!1602)) (currentByte!7171 thiss!1602)) lt!252900 #b00000000000000000000000000000000 (currentBit!7166 thiss!1602)))))

(declare-fun b!160239 () Bool)

(declare-fun array_inv!3205 (array!7644) Bool)

(assert (=> b!160239 (= e!109627 (array_inv!3205 (buf!3916 thiss!1602)))))

(assert (= (and start!32526 res!133729) b!160237))

(assert (= (and b!160237 (not res!133730)) b!160238))

(assert (= start!32526 b!160239))

(declare-fun m!252939 () Bool)

(assert (=> start!32526 m!252939))

(declare-fun m!252941 () Bool)

(assert (=> start!32526 m!252941))

(declare-fun m!252943 () Bool)

(assert (=> b!160237 m!252943))

(declare-fun m!252945 () Bool)

(assert (=> b!160237 m!252945))

(declare-fun m!252947 () Bool)

(assert (=> b!160237 m!252947))

(declare-fun m!252949 () Bool)

(assert (=> b!160237 m!252949))

(declare-fun m!252951 () Bool)

(assert (=> b!160237 m!252951))

(declare-fun m!252953 () Bool)

(assert (=> b!160237 m!252953))

(declare-fun m!252955 () Bool)

(assert (=> b!160237 m!252955))

(declare-fun m!252957 () Bool)

(assert (=> b!160237 m!252957))

(declare-fun m!252959 () Bool)

(assert (=> b!160237 m!252959))

(declare-fun m!252961 () Bool)

(assert (=> b!160237 m!252961))

(declare-fun m!252963 () Bool)

(assert (=> b!160237 m!252963))

(declare-fun m!252965 () Bool)

(assert (=> b!160237 m!252965))

(assert (=> b!160238 m!252953))

(assert (=> b!160238 m!252953))

(declare-fun m!252967 () Bool)

(assert (=> b!160238 m!252967))

(declare-fun m!252969 () Bool)

(assert (=> b!160239 m!252969))

(check-sat (not b!160239) (not b!160238) (not b!160237) (not start!32526))
(check-sat)
