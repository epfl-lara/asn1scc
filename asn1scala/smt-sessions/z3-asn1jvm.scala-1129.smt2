; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32082 () Bool)

(assert start!32082)

(declare-fun res!132598 () Bool)

(declare-fun e!108258 () Bool)

(assert (=> start!32082 (=> (not res!132598) (not e!108258))))

(declare-datatypes ((array!7508 0))(
  ( (array!7509 (arr!4322 (Array (_ BitVec 32) (_ BitVec 8))) (size!3401 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5970 0))(
  ( (BitStream!5971 (buf!3859 array!7508) (currentByte!7083 (_ BitVec 32)) (currentBit!7078 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5970)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32082 (= res!132598 (validate_offset_byte!0 ((_ sign_extend 32) (size!3401 (buf!3859 thiss!1602))) ((_ sign_extend 32) (currentByte!7083 thiss!1602)) ((_ sign_extend 32) (currentBit!7078 thiss!1602))))))

(assert (=> start!32082 e!108258))

(declare-fun e!108255 () Bool)

(declare-fun inv!12 (BitStream!5970) Bool)

(assert (=> start!32082 (and (inv!12 thiss!1602) e!108255)))

(assert (=> start!32082 true))

(declare-fun b!158845 () Bool)

(assert (=> b!158845 (= e!108258 (not true))))

(declare-datatypes ((Unit!10695 0))(
  ( (Unit!10696) )
))
(declare-datatypes ((tuple3!704 0))(
  ( (tuple3!705 (_1!7700 Unit!10695) (_2!7700 (_ BitVec 8)) (_3!469 BitStream!5970)) )
))
(declare-fun lt!250390 () tuple3!704)

(declare-fun lt!250397 () (_ BitVec 8))

(declare-fun arrayRangesEq!452 (array!7508 array!7508 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158845 (arrayRangesEq!452 (buf!3859 thiss!1602) (array!7509 (store (arr!4322 (buf!3859 thiss!1602)) (bvsub (currentByte!7083 (_3!469 lt!250390)) #b00000000000000000000000000000001) lt!250397) (size!3401 (buf!3859 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7083 (_3!469 lt!250390)) #b00000000000000000000000000000001))))

(declare-fun lt!250391 () Unit!10695)

(declare-fun arrayUpdatedAtPrefixLemma!60 (array!7508 (_ BitVec 32) (_ BitVec 8)) Unit!10695)

(assert (=> b!158845 (= lt!250391 (arrayUpdatedAtPrefixLemma!60 (buf!3859 thiss!1602) (bvsub (currentByte!7083 (_3!469 lt!250390)) #b00000000000000000000000000000001) lt!250397))))

(assert (=> b!158845 (= lt!250397 (select (arr!4322 (buf!3859 (_3!469 lt!250390))) (bvsub (currentByte!7083 (_3!469 lt!250390)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250394 () array!7508)

(declare-fun lt!250393 () (_ BitVec 8))

(declare-fun lt!250392 () (_ BitVec 8))

(declare-fun lt!250398 () (_ BitVec 32))

(declare-fun lt!250396 () (_ BitVec 32))

(declare-fun lt!250395 () (_ BitVec 32))

(declare-fun lt!250389 () (_ BitVec 8))

(declare-fun Unit!10697 () Unit!10695)

(declare-fun Unit!10698 () Unit!10695)

(assert (=> b!158845 (= lt!250390 (ite (bvsgt lt!250396 #b00000000000000000000000000000000) (let ((bdg!9216 ((_ extract 7 0) (bvnot lt!250395)))) (let ((bdg!9217 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4322 (buf!3859 thiss!1602)) (currentByte!7083 thiss!1602) lt!250389) (currentByte!7083 thiss!1602) lt!250393) (bvadd #b00000000000000000000000000000001 (currentByte!7083 thiss!1602)))) ((_ sign_extend 24) bdg!9216))))) (tuple3!705 Unit!10697 bdg!9216 (BitStream!5971 (array!7509 (store (arr!4322 (array!7509 (store (arr!4322 lt!250394) (bvadd #b00000000000000000000000000000001 (currentByte!7083 thiss!1602)) bdg!9217) (size!3401 lt!250394))) (bvadd #b00000000000000000000000000000001 (currentByte!7083 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9217) (bvshl ((_ sign_extend 24) v!222) lt!250398)))) (size!3401 (array!7509 (store (arr!4322 lt!250394) (bvadd #b00000000000000000000000000000001 (currentByte!7083 thiss!1602)) bdg!9217) (size!3401 lt!250394)))) (bvadd #b00000000000000000000000000000001 (currentByte!7083 thiss!1602)) (currentBit!7078 thiss!1602))))) (tuple3!705 Unit!10698 lt!250392 (BitStream!5971 lt!250394 (bvadd #b00000000000000000000000000000001 (currentByte!7083 thiss!1602)) (currentBit!7078 thiss!1602)))))))

(declare-fun e!108257 () Bool)

(assert (=> b!158845 e!108257))

(declare-fun res!132599 () Bool)

(assert (=> b!158845 (=> res!132599 e!108257)))

(assert (=> b!158845 (= res!132599 (bvsge (currentByte!7083 thiss!1602) (size!3401 (buf!3859 thiss!1602))))))

(assert (=> b!158845 (= lt!250394 (array!7509 (store (store (arr!4322 (buf!3859 thiss!1602)) (currentByte!7083 thiss!1602) lt!250389) (currentByte!7083 thiss!1602) lt!250393) (size!3401 (buf!3859 thiss!1602))))))

(assert (=> b!158845 (= lt!250393 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250389) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250396))))))

(assert (=> b!158845 (= lt!250389 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4322 (buf!3859 thiss!1602)) (currentByte!7083 thiss!1602))) lt!250395)))))

(assert (=> b!158845 (= lt!250395 ((_ sign_extend 24) lt!250392))))

(assert (=> b!158845 (= lt!250392 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250398)))))))

(assert (=> b!158845 (= lt!250398 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250396))))))

(assert (=> b!158845 (= lt!250396 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7078 thiss!1602))))))

(declare-fun b!158846 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158846 (= e!108257 (byteRangesEq!0 (select (arr!4322 (buf!3859 thiss!1602)) (currentByte!7083 thiss!1602)) lt!250393 #b00000000000000000000000000000000 (currentBit!7078 thiss!1602)))))

(declare-fun b!158847 () Bool)

(declare-fun array_inv!3148 (array!7508) Bool)

(assert (=> b!158847 (= e!108255 (array_inv!3148 (buf!3859 thiss!1602)))))

(assert (= (and start!32082 res!132598) b!158845))

(assert (= (and b!158845 (not res!132599)) b!158846))

(assert (= start!32082 b!158847))

(declare-fun m!249521 () Bool)

(assert (=> start!32082 m!249521))

(declare-fun m!249523 () Bool)

(assert (=> start!32082 m!249523))

(declare-fun m!249525 () Bool)

(assert (=> b!158845 m!249525))

(declare-fun m!249527 () Bool)

(assert (=> b!158845 m!249527))

(declare-fun m!249529 () Bool)

(assert (=> b!158845 m!249529))

(declare-fun m!249531 () Bool)

(assert (=> b!158845 m!249531))

(declare-fun m!249533 () Bool)

(assert (=> b!158845 m!249533))

(declare-fun m!249535 () Bool)

(assert (=> b!158845 m!249535))

(declare-fun m!249537 () Bool)

(assert (=> b!158845 m!249537))

(declare-fun m!249539 () Bool)

(assert (=> b!158845 m!249539))

(declare-fun m!249541 () Bool)

(assert (=> b!158845 m!249541))

(declare-fun m!249543 () Bool)

(assert (=> b!158845 m!249543))

(declare-fun m!249545 () Bool)

(assert (=> b!158845 m!249545))

(assert (=> b!158846 m!249545))

(assert (=> b!158846 m!249545))

(declare-fun m!249547 () Bool)

(assert (=> b!158846 m!249547))

(declare-fun m!249549 () Bool)

(assert (=> b!158847 m!249549))

(check-sat (not b!158845) (not start!32082) (not b!158847) (not b!158846))
