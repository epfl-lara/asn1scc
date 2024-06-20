; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32162 () Bool)

(assert start!32162)

(declare-fun b!159239 () Bool)

(declare-fun e!108672 () Bool)

(declare-datatypes ((array!7567 0))(
  ( (array!7568 (arr!4350 (Array (_ BitVec 32) (_ BitVec 8))) (size!3429 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6026 0))(
  ( (BitStream!6027 (buf!3887 array!7567) (currentByte!7112 (_ BitVec 32)) (currentBit!7107 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6026)

(declare-fun lt!251369 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159239 (= e!108672 (byteRangesEq!0 (select (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 thiss!1602)) lt!251369 #b00000000000000000000000000000000 (currentBit!7107 thiss!1602)))))

(declare-fun b!159240 () Bool)

(declare-fun e!108675 () Bool)

(declare-fun array_inv!3176 (array!7567) Bool)

(assert (=> b!159240 (= e!108675 (array_inv!3176 (buf!3887 thiss!1602)))))

(declare-fun res!132911 () Bool)

(declare-fun e!108673 () Bool)

(assert (=> start!32162 (=> (not res!132911) (not e!108673))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32162 (= res!132911 (validate_offset_byte!0 ((_ sign_extend 32) (size!3429 (buf!3887 thiss!1602))) ((_ sign_extend 32) (currentByte!7112 thiss!1602)) ((_ sign_extend 32) (currentBit!7107 thiss!1602))))))

(assert (=> start!32162 e!108673))

(declare-fun inv!12 (BitStream!6026) Bool)

(assert (=> start!32162 (and (inv!12 thiss!1602) e!108675)))

(assert (=> start!32162 true))

(declare-fun b!159241 () Bool)

(declare-fun e!108674 () Bool)

(assert (=> b!159241 (= e!108673 (not e!108674))))

(declare-fun res!132910 () Bool)

(assert (=> b!159241 (=> res!132910 e!108674)))

(declare-datatypes ((Unit!10807 0))(
  ( (Unit!10808) )
))
(declare-datatypes ((tuple3!760 0))(
  ( (tuple3!761 (_1!7728 Unit!10807) (_2!7728 (_ BitVec 8)) (_3!497 BitStream!6026)) )
))
(declare-fun lt!251362 () tuple3!760)

(declare-fun lt!251368 () array!7567)

(declare-fun arrayRangesEq!480 (array!7567 array!7567 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159241 (= res!132910 (not (arrayRangesEq!480 (buf!3887 thiss!1602) lt!251368 #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001))))))

(declare-fun lt!251363 () (_ BitVec 8))

(assert (=> b!159241 (arrayRangesEq!480 (buf!3887 thiss!1602) (array!7568 (store (arr!4350 (buf!3887 thiss!1602)) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) lt!251363) (size!3429 (buf!3887 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001))))

(declare-fun lt!251358 () Unit!10807)

(declare-fun arrayUpdatedAtPrefixLemma!88 (array!7567 (_ BitVec 32) (_ BitVec 8)) Unit!10807)

(assert (=> b!159241 (= lt!251358 (arrayUpdatedAtPrefixLemma!88 (buf!3887 thiss!1602) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) lt!251363))))

(assert (=> b!159241 (= lt!251363 (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251360 () (_ BitVec 32))

(declare-fun lt!251359 () (_ BitVec 32))

(declare-fun lt!251366 () (_ BitVec 8))

(declare-fun lt!251364 () (_ BitVec 8))

(declare-fun lt!251370 () (_ BitVec 32))

(declare-fun Unit!10809 () Unit!10807)

(declare-fun Unit!10810 () Unit!10807)

(assert (=> b!159241 (= lt!251362 (ite (bvsgt lt!251360 #b00000000000000000000000000000000) (let ((bdg!9335 ((_ extract 7 0) (bvnot lt!251359)))) (let ((bdg!9336 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 thiss!1602) lt!251364) (currentByte!7112 thiss!1602) lt!251369) (bvadd #b00000000000000000000000000000001 (currentByte!7112 thiss!1602)))) ((_ sign_extend 24) bdg!9335))))) (tuple3!761 Unit!10809 bdg!9335 (BitStream!6027 (array!7568 (store (arr!4350 (array!7568 (store (arr!4350 lt!251368) (bvadd #b00000000000000000000000000000001 (currentByte!7112 thiss!1602)) bdg!9336) (size!3429 lt!251368))) (bvadd #b00000000000000000000000000000001 (currentByte!7112 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9336) (bvshl ((_ sign_extend 24) v!222) lt!251370)))) (size!3429 (array!7568 (store (arr!4350 lt!251368) (bvadd #b00000000000000000000000000000001 (currentByte!7112 thiss!1602)) bdg!9336) (size!3429 lt!251368)))) (bvadd #b00000000000000000000000000000001 (currentByte!7112 thiss!1602)) (currentBit!7107 thiss!1602))))) (tuple3!761 Unit!10810 lt!251366 (BitStream!6027 lt!251368 (bvadd #b00000000000000000000000000000001 (currentByte!7112 thiss!1602)) (currentBit!7107 thiss!1602)))))))

(assert (=> b!159241 e!108672))

(declare-fun res!132908 () Bool)

(assert (=> b!159241 (=> res!132908 e!108672)))

(assert (=> b!159241 (= res!132908 (bvsge (currentByte!7112 thiss!1602) (size!3429 (buf!3887 thiss!1602))))))

(assert (=> b!159241 (= lt!251368 (array!7568 (store (store (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 thiss!1602) lt!251364) (currentByte!7112 thiss!1602) lt!251369) (size!3429 (buf!3887 thiss!1602))))))

(assert (=> b!159241 (= lt!251369 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251364) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251360))))))

(assert (=> b!159241 (= lt!251364 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 thiss!1602))) lt!251359)))))

(assert (=> b!159241 (= lt!251359 ((_ sign_extend 24) lt!251366))))

(assert (=> b!159241 (= lt!251366 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251370)))))))

(assert (=> b!159241 (= lt!251370 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251360))))))

(assert (=> b!159241 (= lt!251360 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7107 thiss!1602))))))

(declare-fun b!159242 () Bool)

(assert (=> b!159242 (= e!108674 (bvsle #b00000000000000000000000000000000 (currentByte!7112 thiss!1602)))))

(assert (=> b!159242 (arrayRangesEq!480 (buf!3887 thiss!1602) (buf!3887 (_3!497 lt!251362)) #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001))))

(declare-fun lt!251361 () Unit!10807)

(declare-fun arrayRangesEqTransitive!123 (array!7567 array!7567 array!7567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10807)

(assert (=> b!159242 (= lt!251361 (arrayRangesEqTransitive!123 (buf!3887 thiss!1602) lt!251368 (buf!3887 (_3!497 lt!251362)) #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) (currentByte!7112 (_3!497 lt!251362))))))

(assert (=> b!159242 (arrayRangesEq!480 lt!251368 (array!7568 (store (store (store (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 thiss!1602) lt!251364) (currentByte!7112 thiss!1602) lt!251369) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) (size!3429 (buf!3887 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7112 (_3!497 lt!251362)))))

(declare-fun lt!251367 () Unit!10807)

(assert (=> b!159242 (= lt!251367 (arrayUpdatedAtPrefixLemma!88 lt!251368 (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))))))

(assert (=> b!159242 (arrayRangesEq!480 (buf!3887 thiss!1602) (array!7568 (store (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) (size!3429 (buf!3887 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7112 (_3!497 lt!251362)))))

(declare-fun lt!251365 () Unit!10807)

(assert (=> b!159242 (= lt!251365 (arrayUpdatedAtPrefixLemma!88 (buf!3887 thiss!1602) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))))))

(declare-fun b!159243 () Bool)

(declare-fun res!132909 () Bool)

(assert (=> b!159243 (=> res!132909 e!108674)))

(assert (=> b!159243 (= res!132909 (bvsle lt!251360 #b00000000000000000000000000000000))))

(assert (= (and start!32162 res!132911) b!159241))

(assert (= (and b!159241 (not res!132908)) b!159239))

(assert (= (and b!159241 (not res!132910)) b!159243))

(assert (= (and b!159243 (not res!132909)) b!159242))

(assert (= start!32162 b!159240))

(declare-fun m!250697 () Bool)

(assert (=> b!159239 m!250697))

(assert (=> b!159239 m!250697))

(declare-fun m!250699 () Bool)

(assert (=> b!159239 m!250699))

(declare-fun m!250701 () Bool)

(assert (=> b!159240 m!250701))

(declare-fun m!250703 () Bool)

(assert (=> b!159241 m!250703))

(declare-fun m!250705 () Bool)

(assert (=> b!159241 m!250705))

(declare-fun m!250707 () Bool)

(assert (=> b!159241 m!250707))

(declare-fun m!250709 () Bool)

(assert (=> b!159241 m!250709))

(declare-fun m!250711 () Bool)

(assert (=> b!159241 m!250711))

(declare-fun m!250713 () Bool)

(assert (=> b!159241 m!250713))

(declare-fun m!250715 () Bool)

(assert (=> b!159241 m!250715))

(declare-fun m!250717 () Bool)

(assert (=> b!159241 m!250717))

(declare-fun m!250719 () Bool)

(assert (=> b!159241 m!250719))

(declare-fun m!250721 () Bool)

(assert (=> b!159241 m!250721))

(declare-fun m!250723 () Bool)

(assert (=> b!159241 m!250723))

(assert (=> b!159241 m!250697))

(declare-fun m!250725 () Bool)

(assert (=> b!159242 m!250725))

(declare-fun m!250727 () Bool)

(assert (=> b!159242 m!250727))

(declare-fun m!250729 () Bool)

(assert (=> b!159242 m!250729))

(declare-fun m!250731 () Bool)

(assert (=> b!159242 m!250731))

(assert (=> b!159242 m!250729))

(declare-fun m!250733 () Bool)

(assert (=> b!159242 m!250733))

(assert (=> b!159242 m!250719))

(declare-fun m!250735 () Bool)

(assert (=> b!159242 m!250735))

(declare-fun m!250737 () Bool)

(assert (=> b!159242 m!250737))

(assert (=> b!159242 m!250709))

(declare-fun m!250739 () Bool)

(assert (=> b!159242 m!250739))

(assert (=> b!159242 m!250729))

(declare-fun m!250741 () Bool)

(assert (=> b!159242 m!250741))

(declare-fun m!250743 () Bool)

(assert (=> start!32162 m!250743))

(declare-fun m!250745 () Bool)

(assert (=> start!32162 m!250745))

(push 1)

(assert (not b!159239))

(assert (not b!159240))

(assert (not start!32162))

(assert (not b!159242))

(assert (not b!159241))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53475 () Bool)

(assert (=> d!53475 (= (byteRangesEq!0 (select (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 thiss!1602)) lt!251369 #b00000000000000000000000000000000 (currentBit!7107 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7107 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7107 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!251369) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7107 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13262 () Bool)

(assert (= bs!13262 d!53475))

(declare-fun m!250789 () Bool)

(assert (=> bs!13262 m!250789))

(declare-fun m!250791 () Bool)

(assert (=> bs!13262 m!250791))

(assert (=> b!159239 d!53475))

(declare-fun d!53489 () Bool)

(assert (=> d!53489 (= (array_inv!3176 (buf!3887 thiss!1602)) (bvsge (size!3429 (buf!3887 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159240 d!53489))

(declare-fun d!53491 () Bool)

(declare-fun res!132935 () Bool)

(declare-fun e!108699 () Bool)

(assert (=> d!53491 (=> res!132935 e!108699)))

(assert (=> d!53491 (= res!132935 (= #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)))))

(assert (=> d!53491 (= (arrayRangesEq!480 (buf!3887 thiss!1602) lt!251368 #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)) e!108699)))

(declare-fun b!159267 () Bool)

(declare-fun e!108700 () Bool)

(assert (=> b!159267 (= e!108699 e!108700)))

(declare-fun res!132936 () Bool)

(assert (=> b!159267 (=> (not res!132936) (not e!108700))))

(assert (=> b!159267 (= res!132936 (= (select (arr!4350 (buf!3887 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4350 lt!251368) #b00000000000000000000000000000000)))))

(declare-fun b!159268 () Bool)

(assert (=> b!159268 (= e!108700 (arrayRangesEq!480 (buf!3887 thiss!1602) lt!251368 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)))))

(assert (= (and d!53491 (not res!132935)) b!159267))

(assert (= (and b!159267 res!132936) b!159268))

(declare-fun m!250793 () Bool)

(assert (=> b!159267 m!250793))

(declare-fun m!250795 () Bool)

(assert (=> b!159267 m!250795))

(declare-fun m!250797 () Bool)

(assert (=> b!159268 m!250797))

(assert (=> b!159241 d!53491))

(declare-fun d!53493 () Bool)

(declare-fun res!132937 () Bool)

(declare-fun e!108701 () Bool)

(assert (=> d!53493 (=> res!132937 e!108701)))

(assert (=> d!53493 (= res!132937 (= #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)))))

(assert (=> d!53493 (= (arrayRangesEq!480 (buf!3887 thiss!1602) (array!7568 (store (arr!4350 (buf!3887 thiss!1602)) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) lt!251363) (size!3429 (buf!3887 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)) e!108701)))

(declare-fun b!159269 () Bool)

(declare-fun e!108702 () Bool)

(assert (=> b!159269 (= e!108701 e!108702)))

(declare-fun res!132938 () Bool)

(assert (=> b!159269 (=> (not res!132938) (not e!108702))))

(assert (=> b!159269 (= res!132938 (= (select (arr!4350 (buf!3887 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4350 (array!7568 (store (arr!4350 (buf!3887 thiss!1602)) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) lt!251363) (size!3429 (buf!3887 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159270 () Bool)

(assert (=> b!159270 (= e!108702 (arrayRangesEq!480 (buf!3887 thiss!1602) (array!7568 (store (arr!4350 (buf!3887 thiss!1602)) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) lt!251363) (size!3429 (buf!3887 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)))))

(assert (= (and d!53493 (not res!132937)) b!159269))

(assert (= (and b!159269 res!132938) b!159270))

(assert (=> b!159269 m!250793))

(declare-fun m!250799 () Bool)

(assert (=> b!159269 m!250799))

(declare-fun m!250801 () Bool)

(assert (=> b!159270 m!250801))

(assert (=> b!159241 d!53493))

(declare-fun d!53495 () Bool)

(declare-fun e!108705 () Bool)

(assert (=> d!53495 e!108705))

(declare-fun res!132941 () Bool)

(assert (=> d!53495 (=> (not res!132941) (not e!108705))))

(assert (=> d!53495 (= res!132941 (and (bvsge (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) (size!3429 (buf!3887 thiss!1602)))))))

(declare-fun lt!251381 () Unit!10807)

(declare-fun choose!123 (array!7567 (_ BitVec 32) (_ BitVec 8)) Unit!10807)

(assert (=> d!53495 (= lt!251381 (choose!123 (buf!3887 thiss!1602) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) lt!251363))))

(assert (=> d!53495 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) (size!3429 (buf!3887 thiss!1602))))))

(assert (=> d!53495 (= (arrayUpdatedAtPrefixLemma!88 (buf!3887 thiss!1602) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) lt!251363) lt!251381)))

(declare-fun b!159273 () Bool)

(assert (=> b!159273 (= e!108705 (arrayRangesEq!480 (buf!3887 thiss!1602) (array!7568 (store (arr!4350 (buf!3887 thiss!1602)) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) lt!251363) (size!3429 (buf!3887 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)))))

(assert (= (and d!53495 res!132941) b!159273))

(declare-fun m!250803 () Bool)

(assert (=> d!53495 m!250803))

(assert (=> b!159273 m!250723))

(assert (=> b!159273 m!250717))

(assert (=> b!159241 d!53495))

(declare-fun d!53497 () Bool)

(declare-fun res!132942 () Bool)

(declare-fun e!108706 () Bool)

(assert (=> d!53497 (=> res!132942 e!108706)))

(assert (=> d!53497 (= res!132942 (= #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)))))

(assert (=> d!53497 (= (arrayRangesEq!480 (buf!3887 thiss!1602) (buf!3887 (_3!497 lt!251362)) #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)) e!108706)))

(declare-fun b!159274 () Bool)

(declare-fun e!108707 () Bool)

(assert (=> b!159274 (= e!108706 e!108707)))

(declare-fun res!132943 () Bool)

(assert (=> b!159274 (=> (not res!132943) (not e!108707))))

(assert (=> b!159274 (= res!132943 (= (select (arr!4350 (buf!3887 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) #b00000000000000000000000000000000)))))

(declare-fun b!159275 () Bool)

(assert (=> b!159275 (= e!108707 (arrayRangesEq!480 (buf!3887 thiss!1602) (buf!3887 (_3!497 lt!251362)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)))))

(assert (= (and d!53497 (not res!132942)) b!159274))

(assert (= (and b!159274 res!132943) b!159275))

(assert (=> b!159274 m!250793))

(declare-fun m!250805 () Bool)

(assert (=> b!159274 m!250805))

(declare-fun m!250807 () Bool)

(assert (=> b!159275 m!250807))

(assert (=> b!159242 d!53497))

(declare-fun d!53499 () Bool)

(assert (=> d!53499 (arrayRangesEq!480 (buf!3887 thiss!1602) (buf!3887 (_3!497 lt!251362)) #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001))))

(declare-fun lt!251384 () Unit!10807)

(declare-fun choose!124 (array!7567 array!7567 array!7567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10807)

(assert (=> d!53499 (= lt!251384 (choose!124 (buf!3887 thiss!1602) lt!251368 (buf!3887 (_3!497 lt!251362)) #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) (currentByte!7112 (_3!497 lt!251362))))))

(assert (=> d!53499 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) (currentByte!7112 (_3!497 lt!251362))))))

(assert (=> d!53499 (= (arrayRangesEqTransitive!123 (buf!3887 thiss!1602) lt!251368 (buf!3887 (_3!497 lt!251362)) #b00000000000000000000000000000000 (bvsub (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000001) (currentByte!7112 (_3!497 lt!251362))) lt!251384)))

(declare-fun bs!13263 () Bool)

(assert (= bs!13263 d!53499))

(assert (=> bs!13263 m!250731))

(declare-fun m!250809 () Bool)

(assert (=> bs!13263 m!250809))

(assert (=> b!159242 d!53499))

(declare-fun d!53501 () Bool)

(declare-fun e!108708 () Bool)

(assert (=> d!53501 e!108708))

(declare-fun res!132944 () Bool)

(assert (=> d!53501 (=> (not res!132944) (not e!108708))))

(assert (=> d!53501 (= res!132944 (and (bvsge (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000000) (bvslt (currentByte!7112 (_3!497 lt!251362)) (size!3429 (buf!3887 thiss!1602)))))))

(declare-fun lt!251385 () Unit!10807)

(assert (=> d!53501 (= lt!251385 (choose!123 (buf!3887 thiss!1602) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))))))

(assert (=> d!53501 (and (bvsle #b00000000000000000000000000000000 (currentByte!7112 (_3!497 lt!251362))) (bvslt (currentByte!7112 (_3!497 lt!251362)) (size!3429 (buf!3887 thiss!1602))))))

(assert (=> d!53501 (= (arrayUpdatedAtPrefixLemma!88 (buf!3887 thiss!1602) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) lt!251385)))

(declare-fun b!159276 () Bool)

(assert (=> b!159276 (= e!108708 (arrayRangesEq!480 (buf!3887 thiss!1602) (array!7568 (store (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) (size!3429 (buf!3887 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7112 (_3!497 lt!251362))))))

(assert (= (and d!53501 res!132944) b!159276))

(assert (=> d!53501 m!250729))

(declare-fun m!250811 () Bool)

(assert (=> d!53501 m!250811))

(assert (=> b!159276 m!250739))

(assert (=> b!159276 m!250735))

(assert (=> b!159242 d!53501))

(declare-fun d!53503 () Bool)

(declare-fun res!132945 () Bool)

(declare-fun e!108709 () Bool)

(assert (=> d!53503 (=> res!132945 e!108709)))

(assert (=> d!53503 (= res!132945 (= #b00000000000000000000000000000000 (currentByte!7112 (_3!497 lt!251362))))))

(assert (=> d!53503 (= (arrayRangesEq!480 lt!251368 (array!7568 (store (store (store (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 thiss!1602) lt!251364) (currentByte!7112 thiss!1602) lt!251369) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) (size!3429 (buf!3887 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7112 (_3!497 lt!251362))) e!108709)))

(declare-fun b!159277 () Bool)

(declare-fun e!108710 () Bool)

(assert (=> b!159277 (= e!108709 e!108710)))

(declare-fun res!132946 () Bool)

(assert (=> b!159277 (=> (not res!132946) (not e!108710))))

(assert (=> b!159277 (= res!132946 (= (select (arr!4350 lt!251368) #b00000000000000000000000000000000) (select (arr!4350 (array!7568 (store (store (store (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 thiss!1602) lt!251364) (currentByte!7112 thiss!1602) lt!251369) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) (size!3429 (buf!3887 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159278 () Bool)

(assert (=> b!159278 (= e!108710 (arrayRangesEq!480 lt!251368 (array!7568 (store (store (store (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 thiss!1602) lt!251364) (currentByte!7112 thiss!1602) lt!251369) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) (size!3429 (buf!3887 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7112 (_3!497 lt!251362))))))

(assert (= (and d!53503 (not res!132945)) b!159277))

(assert (= (and b!159277 res!132946) b!159278))

(assert (=> b!159277 m!250795))

(declare-fun m!250813 () Bool)

(assert (=> b!159277 m!250813))

(declare-fun m!250815 () Bool)

(assert (=> b!159278 m!250815))

(assert (=> b!159242 d!53503))

(declare-fun d!53505 () Bool)

(declare-fun e!108711 () Bool)

(assert (=> d!53505 e!108711))

(declare-fun res!132947 () Bool)

(assert (=> d!53505 (=> (not res!132947) (not e!108711))))

(assert (=> d!53505 (= res!132947 (and (bvsge (currentByte!7112 (_3!497 lt!251362)) #b00000000000000000000000000000000) (bvslt (currentByte!7112 (_3!497 lt!251362)) (size!3429 lt!251368))))))

(declare-fun lt!251386 () Unit!10807)

(assert (=> d!53505 (= lt!251386 (choose!123 lt!251368 (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))))))

(assert (=> d!53505 (and (bvsle #b00000000000000000000000000000000 (currentByte!7112 (_3!497 lt!251362))) (bvslt (currentByte!7112 (_3!497 lt!251362)) (size!3429 lt!251368)))))

(assert (=> d!53505 (= (arrayUpdatedAtPrefixLemma!88 lt!251368 (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) lt!251386)))

(declare-fun b!159279 () Bool)

(assert (=> b!159279 (= e!108711 (arrayRangesEq!480 lt!251368 (array!7568 (store (arr!4350 lt!251368) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) (size!3429 lt!251368)) #b00000000000000000000000000000000 (currentByte!7112 (_3!497 lt!251362))))))

(assert (= (and d!53505 res!132947) b!159279))

(assert (=> d!53505 m!250729))

(declare-fun m!250817 () Bool)

(assert (=> d!53505 m!250817))

(declare-fun m!250819 () Bool)

(assert (=> b!159279 m!250819))

(declare-fun m!250821 () Bool)

(assert (=> b!159279 m!250821))

(assert (=> b!159242 d!53505))

(declare-fun d!53507 () Bool)

(declare-fun res!132948 () Bool)

(declare-fun e!108712 () Bool)

(assert (=> d!53507 (=> res!132948 e!108712)))

(assert (=> d!53507 (= res!132948 (= #b00000000000000000000000000000000 (currentByte!7112 (_3!497 lt!251362))))))

(assert (=> d!53507 (= (arrayRangesEq!480 (buf!3887 thiss!1602) (array!7568 (store (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) (size!3429 (buf!3887 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7112 (_3!497 lt!251362))) e!108712)))

(declare-fun b!159280 () Bool)

(declare-fun e!108713 () Bool)

(assert (=> b!159280 (= e!108712 e!108713)))

(declare-fun res!132949 () Bool)

(assert (=> b!159280 (=> (not res!132949) (not e!108713))))

(assert (=> b!159280 (= res!132949 (= (select (arr!4350 (buf!3887 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4350 (array!7568 (store (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) (size!3429 (buf!3887 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159281 () Bool)

(assert (=> b!159281 (= e!108713 (arrayRangesEq!480 (buf!3887 thiss!1602) (array!7568 (store (arr!4350 (buf!3887 thiss!1602)) (currentByte!7112 (_3!497 lt!251362)) (select (arr!4350 (buf!3887 (_3!497 lt!251362))) (currentByte!7112 (_3!497 lt!251362)))) (size!3429 (buf!3887 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7112 (_3!497 lt!251362))))))

(assert (= (and d!53507 (not res!132948)) b!159280))

(assert (= (and b!159280 res!132949) b!159281))

(assert (=> b!159280 m!250793))

(declare-fun m!250823 () Bool)

(assert (=> b!159280 m!250823))

(declare-fun m!250825 () Bool)

(assert (=> b!159281 m!250825))

(assert (=> b!159242 d!53507))

(declare-fun d!53509 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53509 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3429 (buf!3887 thiss!1602))) ((_ sign_extend 32) (currentByte!7112 thiss!1602)) ((_ sign_extend 32) (currentBit!7107 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3429 (buf!3887 thiss!1602))) ((_ sign_extend 32) (currentByte!7112 thiss!1602)) ((_ sign_extend 32) (currentBit!7107 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13264 () Bool)

(assert (= bs!13264 d!53509))

(declare-fun m!250827 () Bool)

