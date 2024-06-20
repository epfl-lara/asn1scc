; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32416 () Bool)

(assert start!32416)

(declare-datatypes ((array!7620 0))(
  ( (array!7621 (arr!4369 (Array (_ BitVec 32) (_ BitVec 8))) (size!3448 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6064 0))(
  ( (BitStream!6065 (buf!3906 array!7620) (currentByte!7151 (_ BitVec 32)) (currentBit!7146 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6064)

(declare-datatypes ((Unit!10889 0))(
  ( (Unit!10890) )
))
(declare-datatypes ((tuple3!798 0))(
  ( (tuple3!799 (_1!7747 Unit!10889) (_2!7747 (_ BitVec 8)) (_3!516 BitStream!6064)) )
))
(declare-fun lt!252161 () tuple3!798)

(declare-fun call!2699 () Bool)

(declare-fun c!8429 () Bool)

(declare-fun bm!2696 () Bool)

(declare-fun arrayRangesEq!499 (array!7620 array!7620 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2696 (= call!2699 (arrayRangesEq!499 (buf!3906 thiss!1602) (ite c!8429 (array!7621 (store (arr!4369 (buf!3906 thiss!1602)) (currentByte!7151 (_3!516 lt!252161)) (select (arr!4369 (buf!3906 (_3!516 lt!252161))) (currentByte!7151 (_3!516 lt!252161)))) (size!3448 (buf!3906 thiss!1602))) (buf!3906 (_3!516 lt!252161))) #b00000000000000000000000000000000 (ite c!8429 (currentByte!7151 (_3!516 lt!252161)) (currentByte!7151 thiss!1602))))))

(declare-fun b!159803 () Bool)

(declare-fun e!109268 () Unit!10889)

(declare-fun Unit!10891 () Unit!10889)

(assert (=> b!159803 (= e!109268 Unit!10891)))

(declare-fun lt!252168 () Unit!10889)

(declare-fun arrayUpdatedAtPrefixLemma!107 (array!7620 (_ BitVec 32) (_ BitVec 8)) Unit!10889)

(assert (=> b!159803 (= lt!252168 (arrayUpdatedAtPrefixLemma!107 (buf!3906 thiss!1602) (currentByte!7151 (_3!516 lt!252161)) (select (arr!4369 (buf!3906 (_3!516 lt!252161))) (currentByte!7151 (_3!516 lt!252161)))))))

(assert (=> b!159803 call!2699))

(declare-fun lt!252158 () Unit!10889)

(declare-fun lt!252165 () array!7620)

(assert (=> b!159803 (= lt!252158 (arrayUpdatedAtPrefixLemma!107 lt!252165 (currentByte!7151 (_3!516 lt!252161)) (select (arr!4369 (buf!3906 (_3!516 lt!252161))) (currentByte!7151 (_3!516 lt!252161)))))))

(declare-fun lt!252157 () (_ BitVec 8))

(declare-fun lt!252164 () (_ BitVec 8))

(assert (=> b!159803 (arrayRangesEq!499 lt!252165 (array!7621 (store (store (store (arr!4369 (buf!3906 thiss!1602)) (currentByte!7151 thiss!1602) lt!252157) (currentByte!7151 thiss!1602) lt!252164) (currentByte!7151 (_3!516 lt!252161)) (select (arr!4369 (buf!3906 (_3!516 lt!252161))) (currentByte!7151 (_3!516 lt!252161)))) (size!3448 (buf!3906 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7151 (_3!516 lt!252161)))))

(declare-fun lt!252162 () Unit!10889)

(declare-fun arrayRangesEqTransitive!133 (array!7620 array!7620 array!7620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10889)

(assert (=> b!159803 (= lt!252162 (arrayRangesEqTransitive!133 (buf!3906 thiss!1602) lt!252165 (buf!3906 (_3!516 lt!252161)) #b00000000000000000000000000000000 (bvsub (currentByte!7151 (_3!516 lt!252161)) #b00000000000000000000000000000001) (currentByte!7151 (_3!516 lt!252161))))))

(declare-fun res!133396 () Bool)

(assert (=> b!159803 (= res!133396 (arrayRangesEq!499 (buf!3906 thiss!1602) (buf!3906 (_3!516 lt!252161)) #b00000000000000000000000000000000 (bvsub (currentByte!7151 (_3!516 lt!252161)) #b00000000000000000000000000000001)))))

(declare-fun e!109265 () Bool)

(assert (=> b!159803 (=> (not res!133396) (not e!109265))))

(assert (=> b!159803 e!109265))

(declare-fun b!159804 () Bool)

(assert (=> b!159804 (= e!109265 (arrayRangesEq!499 (buf!3906 thiss!1602) (buf!3906 (_3!516 lt!252161)) #b00000000000000000000000000000000 (currentByte!7151 thiss!1602)))))

(declare-fun b!159805 () Bool)

(declare-fun e!109262 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159805 (= e!109262 (invariant!0 (currentBit!7146 thiss!1602) (currentByte!7151 thiss!1602) (size!3448 (buf!3906 thiss!1602))))))

(declare-fun b!159806 () Bool)

(declare-fun e!109267 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159806 (= e!109267 (byteRangesEq!0 (select (arr!4369 (buf!3906 thiss!1602)) (currentByte!7151 thiss!1602)) lt!252164 #b00000000000000000000000000000000 (currentBit!7146 thiss!1602)))))

(declare-fun b!159807 () Bool)

(declare-fun e!109266 () Bool)

(declare-fun e!109263 () Bool)

(assert (=> b!159807 (= e!109266 (not e!109263))))

(declare-fun res!133394 () Bool)

(assert (=> b!159807 (=> res!133394 e!109263)))

(assert (=> b!159807 (= res!133394 (not (arrayRangesEq!499 (buf!3906 thiss!1602) lt!252165 #b00000000000000000000000000000000 (bvsub (currentByte!7151 (_3!516 lt!252161)) #b00000000000000000000000000000001))))))

(declare-fun lt!252159 () (_ BitVec 8))

(assert (=> b!159807 (arrayRangesEq!499 (buf!3906 thiss!1602) (array!7621 (store (arr!4369 (buf!3906 thiss!1602)) (bvsub (currentByte!7151 (_3!516 lt!252161)) #b00000000000000000000000000000001) lt!252159) (size!3448 (buf!3906 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7151 (_3!516 lt!252161)) #b00000000000000000000000000000001))))

(declare-fun lt!252170 () Unit!10889)

(assert (=> b!159807 (= lt!252170 (arrayUpdatedAtPrefixLemma!107 (buf!3906 thiss!1602) (bvsub (currentByte!7151 (_3!516 lt!252161)) #b00000000000000000000000000000001) lt!252159))))

(assert (=> b!159807 (= lt!252159 (select (arr!4369 (buf!3906 (_3!516 lt!252161))) (bvsub (currentByte!7151 (_3!516 lt!252161)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252160 () (_ BitVec 32))

(declare-fun lt!252166 () (_ BitVec 8))

(declare-fun lt!252171 () Bool)

(declare-fun lt!252163 () (_ BitVec 32))

(declare-fun Unit!10892 () Unit!10889)

(declare-fun Unit!10893 () Unit!10889)

(assert (=> b!159807 (= lt!252161 (ite lt!252171 (let ((bdg!9437 ((_ extract 7 0) (bvnot lt!252160)))) (let ((bdg!9438 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4369 (buf!3906 thiss!1602)) (currentByte!7151 thiss!1602) lt!252157) (currentByte!7151 thiss!1602) lt!252164) (bvadd #b00000000000000000000000000000001 (currentByte!7151 thiss!1602)))) ((_ sign_extend 24) bdg!9437))))) (tuple3!799 Unit!10892 bdg!9437 (BitStream!6065 (array!7621 (store (arr!4369 (array!7621 (store (arr!4369 lt!252165) (bvadd #b00000000000000000000000000000001 (currentByte!7151 thiss!1602)) bdg!9438) (size!3448 lt!252165))) (bvadd #b00000000000000000000000000000001 (currentByte!7151 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9438) (bvshl ((_ sign_extend 24) v!222) lt!252163)))) (size!3448 (array!7621 (store (arr!4369 lt!252165) (bvadd #b00000000000000000000000000000001 (currentByte!7151 thiss!1602)) bdg!9438) (size!3448 lt!252165)))) (bvadd #b00000000000000000000000000000001 (currentByte!7151 thiss!1602)) (currentBit!7146 thiss!1602))))) (tuple3!799 Unit!10893 lt!252166 (BitStream!6065 lt!252165 (bvadd #b00000000000000000000000000000001 (currentByte!7151 thiss!1602)) (currentBit!7146 thiss!1602)))))))

(declare-fun lt!252167 () (_ BitVec 32))

(assert (=> b!159807 (= lt!252171 (bvsgt lt!252167 #b00000000000000000000000000000000))))

(assert (=> b!159807 e!109267))

(declare-fun res!133395 () Bool)

(assert (=> b!159807 (=> res!133395 e!109267)))

(assert (=> b!159807 (= res!133395 (bvsge (currentByte!7151 thiss!1602) (size!3448 (buf!3906 thiss!1602))))))

(assert (=> b!159807 (= lt!252165 (array!7621 (store (store (arr!4369 (buf!3906 thiss!1602)) (currentByte!7151 thiss!1602) lt!252157) (currentByte!7151 thiss!1602) lt!252164) (size!3448 (buf!3906 thiss!1602))))))

(assert (=> b!159807 (= lt!252164 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252157) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252167))))))

(assert (=> b!159807 (= lt!252157 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4369 (buf!3906 thiss!1602)) (currentByte!7151 thiss!1602))) lt!252160)))))

(assert (=> b!159807 (= lt!252160 ((_ sign_extend 24) lt!252166))))

(assert (=> b!159807 (= lt!252166 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252163)))))))

(assert (=> b!159807 (= lt!252163 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252167))))))

(assert (=> b!159807 (= lt!252167 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7146 thiss!1602))))))

(declare-fun b!159808 () Bool)

(declare-fun Unit!10894 () Unit!10889)

(assert (=> b!159808 (= e!109268 Unit!10894)))

(assert (=> b!159808 call!2699))

(declare-fun b!159809 () Bool)

(declare-fun e!109269 () Bool)

(declare-fun array_inv!3195 (array!7620) Bool)

(assert (=> b!159809 (= e!109269 (array_inv!3195 (buf!3906 thiss!1602)))))

(declare-fun b!159810 () Bool)

(assert (=> b!159810 (= e!109263 e!109262)))

(declare-fun res!133397 () Bool)

(assert (=> b!159810 (=> res!133397 e!109262)))

(assert (=> b!159810 (= res!133397 (not (= (size!3448 (buf!3906 thiss!1602)) (size!3448 (buf!3906 (_3!516 lt!252161))))))))

(declare-fun lt!252169 () Unit!10889)

(assert (=> b!159810 (= lt!252169 e!109268)))

(assert (=> b!159810 (= c!8429 lt!252171)))

(declare-fun res!133393 () Bool)

(assert (=> start!32416 (=> (not res!133393) (not e!109266))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32416 (= res!133393 (validate_offset_byte!0 ((_ sign_extend 32) (size!3448 (buf!3906 thiss!1602))) ((_ sign_extend 32) (currentByte!7151 thiss!1602)) ((_ sign_extend 32) (currentBit!7146 thiss!1602))))))

(assert (=> start!32416 e!109266))

(declare-fun inv!12 (BitStream!6064) Bool)

(assert (=> start!32416 (and (inv!12 thiss!1602) e!109269)))

(assert (=> start!32416 true))

(assert (= (and start!32416 res!133393) b!159807))

(assert (= (and b!159807 (not res!133395)) b!159806))

(assert (= (and b!159807 (not res!133394)) b!159810))

(assert (= (and b!159810 c!8429) b!159803))

(assert (= (and b!159810 (not c!8429)) b!159808))

(assert (= (and b!159803 res!133396) b!159804))

(assert (= (or b!159803 b!159808) bm!2696))

(assert (= (and b!159810 (not res!133397)) b!159805))

(assert (= start!32416 b!159809))

(declare-fun m!252063 () Bool)

(assert (=> b!159803 m!252063))

(declare-fun m!252065 () Bool)

(assert (=> b!159803 m!252065))

(declare-fun m!252067 () Bool)

(assert (=> b!159803 m!252067))

(declare-fun m!252069 () Bool)

(assert (=> b!159803 m!252069))

(declare-fun m!252071 () Bool)

(assert (=> b!159803 m!252071))

(declare-fun m!252073 () Bool)

(assert (=> b!159803 m!252073))

(assert (=> b!159803 m!252063))

(declare-fun m!252075 () Bool)

(assert (=> b!159803 m!252075))

(assert (=> b!159803 m!252063))

(declare-fun m!252077 () Bool)

(assert (=> b!159803 m!252077))

(declare-fun m!252079 () Bool)

(assert (=> b!159803 m!252079))

(declare-fun m!252081 () Bool)

(assert (=> b!159809 m!252081))

(declare-fun m!252083 () Bool)

(assert (=> start!32416 m!252083))

(declare-fun m!252085 () Bool)

(assert (=> start!32416 m!252085))

(assert (=> b!159807 m!252077))

(declare-fun m!252087 () Bool)

(assert (=> b!159807 m!252087))

(declare-fun m!252089 () Bool)

(assert (=> b!159807 m!252089))

(declare-fun m!252091 () Bool)

(assert (=> b!159807 m!252091))

(declare-fun m!252093 () Bool)

(assert (=> b!159807 m!252093))

(declare-fun m!252095 () Bool)

(assert (=> b!159807 m!252095))

(declare-fun m!252097 () Bool)

(assert (=> b!159807 m!252097))

(assert (=> b!159807 m!252071))

(declare-fun m!252099 () Bool)

(assert (=> b!159807 m!252099))

(declare-fun m!252101 () Bool)

(assert (=> b!159807 m!252101))

(declare-fun m!252103 () Bool)

(assert (=> b!159807 m!252103))

(declare-fun m!252105 () Bool)

(assert (=> b!159807 m!252105))

(assert (=> b!159806 m!252097))

(assert (=> b!159806 m!252097))

(declare-fun m!252107 () Bool)

(assert (=> b!159806 m!252107))

(declare-fun m!252109 () Bool)

(assert (=> b!159805 m!252109))

(assert (=> bm!2696 m!252063))

(declare-fun m!252111 () Bool)

(assert (=> bm!2696 m!252111))

(declare-fun m!252113 () Bool)

(assert (=> bm!2696 m!252113))

(declare-fun m!252115 () Bool)

(assert (=> b!159804 m!252115))

(push 1)

(assert (not start!32416))

(assert (not b!159805))

(assert (not b!159804))

(assert (not b!159806))

(assert (not b!159809))

(assert (not bm!2696))

(assert (not b!159803))

(assert (not b!159807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

