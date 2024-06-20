; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32312 () Bool)

(assert start!32312)

(declare-fun b!159585 () Bool)

(declare-fun e!109047 () Bool)

(declare-fun e!109043 () Bool)

(assert (=> b!159585 (= e!109047 (not e!109043))))

(declare-fun res!133211 () Bool)

(assert (=> b!159585 (=> res!133211 e!109043)))

(declare-datatypes ((array!7606 0))(
  ( (array!7607 (arr!4365 (Array (_ BitVec 32) (_ BitVec 8))) (size!3444 (_ BitVec 32))) )
))
(declare-fun lt!251957 () array!7606)

(declare-datatypes ((BitStream!6056 0))(
  ( (BitStream!6057 (buf!3902 array!7606) (currentByte!7136 (_ BitVec 32)) (currentBit!7131 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!10867 0))(
  ( (Unit!10868) )
))
(declare-datatypes ((tuple3!790 0))(
  ( (tuple3!791 (_1!7743 Unit!10867) (_2!7743 (_ BitVec 8)) (_3!512 BitStream!6056)) )
))
(declare-fun lt!251954 () tuple3!790)

(declare-fun thiss!1602 () BitStream!6056)

(declare-fun arrayRangesEq!495 (array!7606 array!7606 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159585 (= res!133211 (not (arrayRangesEq!495 (buf!3902 thiss!1602) lt!251957 #b00000000000000000000000000000000 (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001))))))

(declare-fun lt!251950 () (_ BitVec 8))

(assert (=> b!159585 (arrayRangesEq!495 (buf!3902 thiss!1602) (array!7607 (store (arr!4365 (buf!3902 thiss!1602)) (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001) lt!251950) (size!3444 (buf!3902 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001))))

(declare-fun lt!251948 () Unit!10867)

(declare-fun arrayUpdatedAtPrefixLemma!103 (array!7606 (_ BitVec 32) (_ BitVec 8)) Unit!10867)

(assert (=> b!159585 (= lt!251948 (arrayUpdatedAtPrefixLemma!103 (buf!3902 thiss!1602) (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001) lt!251950))))

(assert (=> b!159585 (= lt!251950 (select (arr!4365 (buf!3902 (_3!512 lt!251954))) (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001)))))

(declare-fun lt!251955 () (_ BitVec 32))

(declare-fun lt!251952 () (_ BitVec 32))

(declare-fun lt!251951 () (_ BitVec 8))

(declare-fun lt!251958 () (_ BitVec 8))

(declare-fun lt!251956 () Bool)

(declare-fun lt!251953 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun Unit!10869 () Unit!10867)

(declare-fun Unit!10870 () Unit!10867)

(assert (=> b!159585 (= lt!251954 (ite lt!251956 (let ((bdg!9407 ((_ extract 7 0) (bvnot lt!251955)))) (let ((bdg!9408 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4365 (buf!3902 thiss!1602)) (currentByte!7136 thiss!1602) lt!251951) (currentByte!7136 thiss!1602) lt!251953) (bvadd #b00000000000000000000000000000001 (currentByte!7136 thiss!1602)))) ((_ sign_extend 24) bdg!9407))))) (tuple3!791 Unit!10869 bdg!9407 (BitStream!6057 (array!7607 (store (arr!4365 (array!7607 (store (arr!4365 lt!251957) (bvadd #b00000000000000000000000000000001 (currentByte!7136 thiss!1602)) bdg!9408) (size!3444 lt!251957))) (bvadd #b00000000000000000000000000000001 (currentByte!7136 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9408) (bvshl ((_ sign_extend 24) v!222) lt!251952)))) (size!3444 (array!7607 (store (arr!4365 lt!251957) (bvadd #b00000000000000000000000000000001 (currentByte!7136 thiss!1602)) bdg!9408) (size!3444 lt!251957)))) (bvadd #b00000000000000000000000000000001 (currentByte!7136 thiss!1602)) (currentBit!7131 thiss!1602))))) (tuple3!791 Unit!10870 lt!251958 (BitStream!6057 lt!251957 (bvadd #b00000000000000000000000000000001 (currentByte!7136 thiss!1602)) (currentBit!7131 thiss!1602)))))))

(declare-fun lt!251949 () (_ BitVec 32))

(assert (=> b!159585 (= lt!251956 (bvsgt lt!251949 #b00000000000000000000000000000000))))

(declare-fun e!109045 () Bool)

(assert (=> b!159585 e!109045))

(declare-fun res!133210 () Bool)

(assert (=> b!159585 (=> res!133210 e!109045)))

(assert (=> b!159585 (= res!133210 (bvsge (currentByte!7136 thiss!1602) (size!3444 (buf!3902 thiss!1602))))))

(assert (=> b!159585 (= lt!251957 (array!7607 (store (store (arr!4365 (buf!3902 thiss!1602)) (currentByte!7136 thiss!1602) lt!251951) (currentByte!7136 thiss!1602) lt!251953) (size!3444 (buf!3902 thiss!1602))))))

(assert (=> b!159585 (= lt!251953 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251951) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251949))))))

(assert (=> b!159585 (= lt!251951 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4365 (buf!3902 thiss!1602)) (currentByte!7136 thiss!1602))) lt!251955)))))

(assert (=> b!159585 (= lt!251955 ((_ sign_extend 24) lt!251958))))

(assert (=> b!159585 (= lt!251958 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251952)))))))

(assert (=> b!159585 (= lt!251952 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251949))))))

(assert (=> b!159585 (= lt!251949 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7131 thiss!1602))))))

(declare-fun b!159586 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159586 (= e!109045 (byteRangesEq!0 (select (arr!4365 (buf!3902 thiss!1602)) (currentByte!7136 thiss!1602)) lt!251953 #b00000000000000000000000000000000 (currentBit!7131 thiss!1602)))))

(declare-fun b!159588 () Bool)

(declare-fun e!109044 () Bool)

(declare-fun array_inv!3191 (array!7606) Bool)

(assert (=> b!159588 (= e!109044 (array_inv!3191 (buf!3902 thiss!1602)))))

(declare-fun b!159587 () Bool)

(assert (=> b!159587 (= e!109043 (or lt!251956 (bvsgt #b00000000000000000000000000000000 (currentByte!7136 thiss!1602)) (bvsgt (size!3444 (buf!3902 thiss!1602)) (size!3444 (buf!3902 (_3!512 lt!251954)))) (bvsle (currentByte!7136 thiss!1602) (size!3444 (buf!3902 thiss!1602)))))))

(declare-fun res!133209 () Bool)

(assert (=> start!32312 (=> (not res!133209) (not e!109047))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32312 (= res!133209 (validate_offset_byte!0 ((_ sign_extend 32) (size!3444 (buf!3902 thiss!1602))) ((_ sign_extend 32) (currentByte!7136 thiss!1602)) ((_ sign_extend 32) (currentBit!7131 thiss!1602))))))

(assert (=> start!32312 e!109047))

(declare-fun inv!12 (BitStream!6056) Bool)

(assert (=> start!32312 (and (inv!12 thiss!1602) e!109044)))

(assert (=> start!32312 true))

(assert (= (and start!32312 res!133209) b!159585))

(assert (= (and b!159585 (not res!133210)) b!159586))

(assert (= (and b!159585 (not res!133211)) b!159587))

(assert (= start!32312 b!159588))

(declare-fun m!251615 () Bool)

(assert (=> b!159585 m!251615))

(declare-fun m!251617 () Bool)

(assert (=> b!159585 m!251617))

(declare-fun m!251619 () Bool)

(assert (=> b!159585 m!251619))

(declare-fun m!251621 () Bool)

(assert (=> b!159585 m!251621))

(declare-fun m!251623 () Bool)

(assert (=> b!159585 m!251623))

(declare-fun m!251625 () Bool)

(assert (=> b!159585 m!251625))

(declare-fun m!251627 () Bool)

(assert (=> b!159585 m!251627))

(declare-fun m!251629 () Bool)

(assert (=> b!159585 m!251629))

(declare-fun m!251631 () Bool)

(assert (=> b!159585 m!251631))

(declare-fun m!251633 () Bool)

(assert (=> b!159585 m!251633))

(declare-fun m!251635 () Bool)

(assert (=> b!159585 m!251635))

(declare-fun m!251637 () Bool)

(assert (=> b!159585 m!251637))

(assert (=> b!159586 m!251629))

(assert (=> b!159586 m!251629))

(declare-fun m!251639 () Bool)

(assert (=> b!159586 m!251639))

(declare-fun m!251641 () Bool)

(assert (=> b!159588 m!251641))

(declare-fun m!251643 () Bool)

(assert (=> start!32312 m!251643))

(declare-fun m!251645 () Bool)

(assert (=> start!32312 m!251645))

(push 1)

(assert (not b!159588))

(assert (not b!159586))

(assert (not b!159585))

(assert (not start!32312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53669 () Bool)

(assert (=> d!53669 (= (array_inv!3191 (buf!3902 thiss!1602)) (bvsge (size!3444 (buf!3902 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159588 d!53669))

(declare-fun d!53671 () Bool)

(assert (=> d!53671 (= (byteRangesEq!0 (select (arr!4365 (buf!3902 thiss!1602)) (currentByte!7136 thiss!1602)) lt!251953 #b00000000000000000000000000000000 (currentBit!7131 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7131 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4365 (buf!3902 thiss!1602)) (currentByte!7136 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7131 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!251953) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7131 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13306 () Bool)

(assert (= bs!13306 d!53671))

(declare-fun m!251647 () Bool)

(assert (=> bs!13306 m!251647))

(declare-fun m!251649 () Bool)

(assert (=> bs!13306 m!251649))

(assert (=> b!159586 d!53671))

(declare-fun d!53675 () Bool)

(declare-fun res!133222 () Bool)

(declare-fun e!109058 () Bool)

(assert (=> d!53675 (=> res!133222 e!109058)))

(assert (=> d!53675 (= res!133222 (= #b00000000000000000000000000000000 (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001)))))

(assert (=> d!53675 (= (arrayRangesEq!495 (buf!3902 thiss!1602) lt!251957 #b00000000000000000000000000000000 (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001)) e!109058)))

(declare-fun b!159599 () Bool)

(declare-fun e!109059 () Bool)

(assert (=> b!159599 (= e!109058 e!109059)))

(declare-fun res!133223 () Bool)

(assert (=> b!159599 (=> (not res!133223) (not e!109059))))

(assert (=> b!159599 (= res!133223 (= (select (arr!4365 (buf!3902 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4365 lt!251957) #b00000000000000000000000000000000)))))

(declare-fun b!159600 () Bool)

(assert (=> b!159600 (= e!109059 (arrayRangesEq!495 (buf!3902 thiss!1602) lt!251957 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001)))))

(assert (= (and d!53675 (not res!133222)) b!159599))

(assert (= (and b!159599 res!133223) b!159600))

(declare-fun m!251659 () Bool)

(assert (=> b!159599 m!251659))

(declare-fun m!251661 () Bool)

(assert (=> b!159599 m!251661))

(declare-fun m!251663 () Bool)

(assert (=> b!159600 m!251663))

(assert (=> b!159585 d!53675))

(declare-fun d!53683 () Bool)

(declare-fun res!133226 () Bool)

(declare-fun e!109062 () Bool)

(assert (=> d!53683 (=> res!133226 e!109062)))

(assert (=> d!53683 (= res!133226 (= #b00000000000000000000000000000000 (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001)))))

(assert (=> d!53683 (= (arrayRangesEq!495 (buf!3902 thiss!1602) (array!7607 (store (arr!4365 (buf!3902 thiss!1602)) (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001) lt!251950) (size!3444 (buf!3902 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001)) e!109062)))

(declare-fun b!159603 () Bool)

(declare-fun e!109063 () Bool)

(assert (=> b!159603 (= e!109062 e!109063)))

(declare-fun res!133227 () Bool)

(assert (=> b!159603 (=> (not res!133227) (not e!109063))))

(assert (=> b!159603 (= res!133227 (= (select (arr!4365 (buf!3902 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4365 (array!7607 (store (arr!4365 (buf!3902 thiss!1602)) (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001) lt!251950) (size!3444 (buf!3902 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159604 () Bool)

(assert (=> b!159604 (= e!109063 (arrayRangesEq!495 (buf!3902 thiss!1602) (array!7607 (store (arr!4365 (buf!3902 thiss!1602)) (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001) lt!251950) (size!3444 (buf!3902 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001)))))

(assert (= (and d!53683 (not res!133226)) b!159603))

(assert (= (and b!159603 res!133227) b!159604))

(assert (=> b!159603 m!251659))

(declare-fun m!251669 () Bool)

(assert (=> b!159603 m!251669))

(declare-fun m!251671 () Bool)

(assert (=> b!159604 m!251671))

(assert (=> b!159585 d!53683))

(declare-fun d!53687 () Bool)

(declare-fun e!109068 () Bool)

(assert (=> d!53687 e!109068))

(declare-fun res!133232 () Bool)

(assert (=> d!53687 (=> (not res!133232) (not e!109068))))

(assert (=> d!53687 (= res!133232 (and (bvsge (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001) (size!3444 (buf!3902 thiss!1602)))))))

(declare-fun lt!251963 () Unit!10867)

(declare-fun choose!135 (array!7606 (_ BitVec 32) (_ BitVec 8)) Unit!10867)

(assert (=> d!53687 (= lt!251963 (choose!135 (buf!3902 thiss!1602) (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001) lt!251950))))

(assert (=> d!53687 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001) (size!3444 (buf!3902 thiss!1602))))))

(assert (=> d!53687 (= (arrayUpdatedAtPrefixLemma!103 (buf!3902 thiss!1602) (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001) lt!251950) lt!251963)))

(declare-fun b!159609 () Bool)

(assert (=> b!159609 (= e!109068 (arrayRangesEq!495 (buf!3902 thiss!1602) (array!7607 (store (arr!4365 (buf!3902 thiss!1602)) (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001) lt!251950) (size!3444 (buf!3902 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7136 (_3!512 lt!251954)) #b00000000000000000000000000000001)))))

(assert (= (and d!53687 res!133232) b!159609))

(declare-fun m!251675 () Bool)

(assert (=> d!53687 m!251675))

(assert (=> b!159609 m!251631))

(assert (=> b!159609 m!251627))

(assert (=> b!159585 d!53687))

(declare-fun d!53693 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53693 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3444 (buf!3902 thiss!1602))) ((_ sign_extend 32) (currentByte!7136 thiss!1602)) ((_ sign_extend 32) (currentBit!7131 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3444 (buf!3902 thiss!1602))) ((_ sign_extend 32) (currentByte!7136 thiss!1602)) ((_ sign_extend 32) (currentBit!7131 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13309 () Bool)

(assert (= bs!13309 d!53693))

(declare-fun m!251679 () Bool)

(assert (=> bs!13309 m!251679))

(assert (=> start!32312 d!53693))

(declare-fun d!53697 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53697 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7131 thiss!1602) (currentByte!7136 thiss!1602) (size!3444 (buf!3902 thiss!1602))))))

(declare-fun bs!13312 () Bool)

(assert (= bs!13312 d!53697))

(declare-fun m!251687 () Bool)

(assert (=> bs!13312 m!251687))

(assert (=> start!32312 d!53697))

(push 1)

(assert (not b!159600))

(assert (not d!53687))

(assert (not b!159604))

(assert (not d!53693))

(assert (not b!159609))

(assert (not d!53697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

