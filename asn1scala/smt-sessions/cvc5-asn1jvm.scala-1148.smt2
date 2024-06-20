; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32524 () Bool)

(assert start!32524)

(declare-fun res!133723 () Bool)

(declare-fun e!109615 () Bool)

(assert (=> start!32524 (=> (not res!133723) (not e!109615))))

(declare-datatypes ((array!7642 0))(
  ( (array!7643 (arr!4378 (Array (_ BitVec 32) (_ BitVec 8))) (size!3457 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6082 0))(
  ( (BitStream!6083 (buf!3915 array!7642) (currentByte!7170 (_ BitVec 32)) (currentBit!7165 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6082)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32524 (= res!133723 (validate_offset_byte!0 ((_ sign_extend 32) (size!3457 (buf!3915 thiss!1602))) ((_ sign_extend 32) (currentByte!7170 thiss!1602)) ((_ sign_extend 32) (currentBit!7165 thiss!1602))))))

(assert (=> start!32524 e!109615))

(declare-fun e!109616 () Bool)

(declare-fun inv!12 (BitStream!6082) Bool)

(assert (=> start!32524 (and (inv!12 thiss!1602) e!109616)))

(assert (=> start!32524 true))

(declare-fun b!160228 () Bool)

(declare-datatypes ((Unit!10946 0))(
  ( (Unit!10947) )
))
(declare-datatypes ((tuple3!816 0))(
  ( (tuple3!817 (_1!7759 Unit!10946) (_2!7759 (_ BitVec 8)) (_3!525 BitStream!6082)) )
))
(declare-fun lt!252862 () tuple3!816)

(declare-fun lt!252863 () array!7642)

(declare-fun arrayRangesEq!508 (array!7642 array!7642 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160228 (= e!109615 (not (arrayRangesEq!508 (buf!3915 thiss!1602) lt!252863 #b00000000000000000000000000000000 (bvsub (currentByte!7170 (_3!525 lt!252862)) #b00000000000000000000000000000001))))))

(declare-fun lt!252866 () (_ BitVec 8))

(assert (=> b!160228 (arrayRangesEq!508 (buf!3915 thiss!1602) (array!7643 (store (arr!4378 (buf!3915 thiss!1602)) (bvsub (currentByte!7170 (_3!525 lt!252862)) #b00000000000000000000000000000001) lt!252866) (size!3457 (buf!3915 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7170 (_3!525 lt!252862)) #b00000000000000000000000000000001))))

(declare-fun lt!252865 () Unit!10946)

(declare-fun arrayUpdatedAtPrefixLemma!116 (array!7642 (_ BitVec 32) (_ BitVec 8)) Unit!10946)

(assert (=> b!160228 (= lt!252865 (arrayUpdatedAtPrefixLemma!116 (buf!3915 thiss!1602) (bvsub (currentByte!7170 (_3!525 lt!252862)) #b00000000000000000000000000000001) lt!252866))))

(assert (=> b!160228 (= lt!252866 (select (arr!4378 (buf!3915 (_3!525 lt!252862))) (bvsub (currentByte!7170 (_3!525 lt!252862)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252861 () (_ BitVec 32))

(declare-fun lt!252869 () (_ BitVec 32))

(declare-fun lt!252867 () (_ BitVec 8))

(declare-fun lt!252868 () (_ BitVec 8))

(declare-fun lt!252870 () (_ BitVec 8))

(declare-fun lt!252864 () (_ BitVec 32))

(declare-fun Unit!10948 () Unit!10946)

(declare-fun Unit!10949 () Unit!10946)

(assert (=> b!160228 (= lt!252862 (ite (bvsgt lt!252869 #b00000000000000000000000000000000) (let ((bdg!9489 ((_ extract 7 0) (bvnot lt!252864)))) (let ((bdg!9490 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4378 (buf!3915 thiss!1602)) (currentByte!7170 thiss!1602) lt!252868) (currentByte!7170 thiss!1602) lt!252867) (bvadd #b00000000000000000000000000000001 (currentByte!7170 thiss!1602)))) ((_ sign_extend 24) bdg!9489))))) (tuple3!817 Unit!10948 bdg!9489 (BitStream!6083 (array!7643 (store (arr!4378 (array!7643 (store (arr!4378 lt!252863) (bvadd #b00000000000000000000000000000001 (currentByte!7170 thiss!1602)) bdg!9490) (size!3457 lt!252863))) (bvadd #b00000000000000000000000000000001 (currentByte!7170 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9490) (bvshl ((_ sign_extend 24) v!222) lt!252861)))) (size!3457 (array!7643 (store (arr!4378 lt!252863) (bvadd #b00000000000000000000000000000001 (currentByte!7170 thiss!1602)) bdg!9490) (size!3457 lt!252863)))) (bvadd #b00000000000000000000000000000001 (currentByte!7170 thiss!1602)) (currentBit!7165 thiss!1602))))) (tuple3!817 Unit!10949 lt!252870 (BitStream!6083 lt!252863 (bvadd #b00000000000000000000000000000001 (currentByte!7170 thiss!1602)) (currentBit!7165 thiss!1602)))))))

(declare-fun e!109617 () Bool)

(assert (=> b!160228 e!109617))

(declare-fun res!133724 () Bool)

(assert (=> b!160228 (=> res!133724 e!109617)))

(assert (=> b!160228 (= res!133724 (bvsge (currentByte!7170 thiss!1602) (size!3457 (buf!3915 thiss!1602))))))

(assert (=> b!160228 (= lt!252863 (array!7643 (store (store (arr!4378 (buf!3915 thiss!1602)) (currentByte!7170 thiss!1602) lt!252868) (currentByte!7170 thiss!1602) lt!252867) (size!3457 (buf!3915 thiss!1602))))))

(assert (=> b!160228 (= lt!252867 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252868) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252869))))))

(assert (=> b!160228 (= lt!252868 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4378 (buf!3915 thiss!1602)) (currentByte!7170 thiss!1602))) lt!252864)))))

(assert (=> b!160228 (= lt!252864 ((_ sign_extend 24) lt!252870))))

(assert (=> b!160228 (= lt!252870 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252861)))))))

(assert (=> b!160228 (= lt!252861 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252869))))))

(assert (=> b!160228 (= lt!252869 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7165 thiss!1602))))))

(declare-fun b!160229 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160229 (= e!109617 (byteRangesEq!0 (select (arr!4378 (buf!3915 thiss!1602)) (currentByte!7170 thiss!1602)) lt!252867 #b00000000000000000000000000000000 (currentBit!7165 thiss!1602)))))

(declare-fun b!160230 () Bool)

(declare-fun array_inv!3204 (array!7642) Bool)

(assert (=> b!160230 (= e!109616 (array_inv!3204 (buf!3915 thiss!1602)))))

(assert (= (and start!32524 res!133723) b!160228))

(assert (= (and b!160228 (not res!133724)) b!160229))

(assert (= start!32524 b!160230))

(declare-fun m!252907 () Bool)

(assert (=> start!32524 m!252907))

(declare-fun m!252909 () Bool)

(assert (=> start!32524 m!252909))

(declare-fun m!252911 () Bool)

(assert (=> b!160228 m!252911))

(declare-fun m!252913 () Bool)

(assert (=> b!160228 m!252913))

(declare-fun m!252915 () Bool)

(assert (=> b!160228 m!252915))

(declare-fun m!252917 () Bool)

(assert (=> b!160228 m!252917))

(declare-fun m!252919 () Bool)

(assert (=> b!160228 m!252919))

(declare-fun m!252921 () Bool)

(assert (=> b!160228 m!252921))

(declare-fun m!252923 () Bool)

(assert (=> b!160228 m!252923))

(declare-fun m!252925 () Bool)

(assert (=> b!160228 m!252925))

(declare-fun m!252927 () Bool)

(assert (=> b!160228 m!252927))

(declare-fun m!252929 () Bool)

(assert (=> b!160228 m!252929))

(declare-fun m!252931 () Bool)

(assert (=> b!160228 m!252931))

(declare-fun m!252933 () Bool)

(assert (=> b!160228 m!252933))

(assert (=> b!160229 m!252923))

(assert (=> b!160229 m!252923))

(declare-fun m!252935 () Bool)

(assert (=> b!160229 m!252935))

(declare-fun m!252937 () Bool)

(assert (=> b!160230 m!252937))

(push 1)

(assert (not b!160230))

(assert (not b!160229))

(assert (not b!160228))

(assert (not start!32524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

