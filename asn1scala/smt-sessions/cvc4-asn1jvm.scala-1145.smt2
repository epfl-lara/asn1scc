; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32420 () Bool)

(assert start!32420)

(declare-fun b!159851 () Bool)

(declare-fun e!109310 () Bool)

(declare-datatypes ((array!7624 0))(
  ( (array!7625 (arr!4371 (Array (_ BitVec 32) (_ BitVec 8))) (size!3450 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6068 0))(
  ( (BitStream!6069 (buf!3908 array!7624) (currentByte!7153 (_ BitVec 32)) (currentBit!7148 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6068)

(declare-fun array_inv!3197 (array!7624) Bool)

(assert (=> b!159851 (= e!109310 (array_inv!3197 (buf!3908 thiss!1602)))))

(declare-fun b!159852 () Bool)

(declare-fun e!109317 () Bool)

(declare-fun lt!252261 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159852 (= e!109317 (byteRangesEq!0 (select (arr!4371 (buf!3908 thiss!1602)) (currentByte!7153 thiss!1602)) lt!252261 #b00000000000000000000000000000000 (currentBit!7148 thiss!1602)))))

(declare-fun b!159853 () Bool)

(declare-datatypes ((Unit!10901 0))(
  ( (Unit!10902) )
))
(declare-fun e!109313 () Unit!10901)

(declare-fun Unit!10903 () Unit!10901)

(assert (=> b!159853 (= e!109313 Unit!10903)))

(declare-fun call!2705 () Bool)

(assert (=> b!159853 call!2705))

(declare-fun b!159854 () Bool)

(declare-fun e!109316 () Bool)

(declare-fun e!109314 () Bool)

(assert (=> b!159854 (= e!109316 e!109314)))

(declare-fun res!133427 () Bool)

(assert (=> b!159854 (=> res!133427 e!109314)))

(declare-datatypes ((tuple3!802 0))(
  ( (tuple3!803 (_1!7749 Unit!10901) (_2!7749 (_ BitVec 8)) (_3!518 BitStream!6068)) )
))
(declare-fun lt!252250 () tuple3!802)

(assert (=> b!159854 (= res!133427 (not (= (size!3450 (buf!3908 thiss!1602)) (size!3450 (buf!3908 (_3!518 lt!252250))))))))

(declare-fun lt!252253 () Unit!10901)

(assert (=> b!159854 (= lt!252253 e!109313)))

(declare-fun c!8435 () Bool)

(declare-fun lt!252249 () Bool)

(assert (=> b!159854 (= c!8435 lt!252249)))

(declare-fun res!133423 () Bool)

(declare-fun e!109312 () Bool)

(assert (=> start!32420 (=> (not res!133423) (not e!109312))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32420 (= res!133423 (validate_offset_byte!0 ((_ sign_extend 32) (size!3450 (buf!3908 thiss!1602))) ((_ sign_extend 32) (currentByte!7153 thiss!1602)) ((_ sign_extend 32) (currentBit!7148 thiss!1602))))))

(assert (=> start!32420 e!109312))

(declare-fun inv!12 (BitStream!6068) Bool)

(assert (=> start!32420 (and (inv!12 thiss!1602) e!109310)))

(assert (=> start!32420 true))

(declare-fun b!159855 () Bool)

(declare-fun e!109311 () Bool)

(declare-fun arrayRangesEq!501 (array!7624 array!7624 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159855 (= e!109311 (arrayRangesEq!501 (buf!3908 thiss!1602) (buf!3908 (_3!518 lt!252250)) #b00000000000000000000000000000000 (currentByte!7153 thiss!1602)))))

(declare-fun b!159856 () Bool)

(assert (=> b!159856 (= e!109312 (not e!109316))))

(declare-fun res!133424 () Bool)

(assert (=> b!159856 (=> res!133424 e!109316)))

(declare-fun lt!252257 () array!7624)

(assert (=> b!159856 (= res!133424 (not (arrayRangesEq!501 (buf!3908 thiss!1602) lt!252257 #b00000000000000000000000000000000 (bvsub (currentByte!7153 (_3!518 lt!252250)) #b00000000000000000000000000000001))))))

(declare-fun lt!252251 () (_ BitVec 8))

(assert (=> b!159856 (arrayRangesEq!501 (buf!3908 thiss!1602) (array!7625 (store (arr!4371 (buf!3908 thiss!1602)) (bvsub (currentByte!7153 (_3!518 lt!252250)) #b00000000000000000000000000000001) lt!252251) (size!3450 (buf!3908 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7153 (_3!518 lt!252250)) #b00000000000000000000000000000001))))

(declare-fun lt!252260 () Unit!10901)

(declare-fun arrayUpdatedAtPrefixLemma!109 (array!7624 (_ BitVec 32) (_ BitVec 8)) Unit!10901)

(assert (=> b!159856 (= lt!252260 (arrayUpdatedAtPrefixLemma!109 (buf!3908 thiss!1602) (bvsub (currentByte!7153 (_3!518 lt!252250)) #b00000000000000000000000000000001) lt!252251))))

(assert (=> b!159856 (= lt!252251 (select (arr!4371 (buf!3908 (_3!518 lt!252250))) (bvsub (currentByte!7153 (_3!518 lt!252250)) #b00000000000000000000000000000001)))))

(declare-fun lt!252258 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252254 () (_ BitVec 8))

(declare-fun lt!252247 () (_ BitVec 8))

(declare-fun lt!252248 () (_ BitVec 32))

(declare-fun Unit!10904 () Unit!10901)

(declare-fun Unit!10905 () Unit!10901)

(assert (=> b!159856 (= lt!252250 (ite lt!252249 (let ((bdg!9437 ((_ extract 7 0) (bvnot lt!252248)))) (let ((bdg!9438 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4371 (buf!3908 thiss!1602)) (currentByte!7153 thiss!1602) lt!252247) (currentByte!7153 thiss!1602) lt!252261) (bvadd #b00000000000000000000000000000001 (currentByte!7153 thiss!1602)))) ((_ sign_extend 24) bdg!9437))))) (tuple3!803 Unit!10904 bdg!9437 (BitStream!6069 (array!7625 (store (arr!4371 (array!7625 (store (arr!4371 lt!252257) (bvadd #b00000000000000000000000000000001 (currentByte!7153 thiss!1602)) bdg!9438) (size!3450 lt!252257))) (bvadd #b00000000000000000000000000000001 (currentByte!7153 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9438) (bvshl ((_ sign_extend 24) v!222) lt!252258)))) (size!3450 (array!7625 (store (arr!4371 lt!252257) (bvadd #b00000000000000000000000000000001 (currentByte!7153 thiss!1602)) bdg!9438) (size!3450 lt!252257)))) (bvadd #b00000000000000000000000000000001 (currentByte!7153 thiss!1602)) (currentBit!7148 thiss!1602))))) (tuple3!803 Unit!10905 lt!252254 (BitStream!6069 lt!252257 (bvadd #b00000000000000000000000000000001 (currentByte!7153 thiss!1602)) (currentBit!7148 thiss!1602)))))))

(declare-fun lt!252256 () (_ BitVec 32))

(assert (=> b!159856 (= lt!252249 (bvsgt lt!252256 #b00000000000000000000000000000000))))

(assert (=> b!159856 e!109317))

(declare-fun res!133425 () Bool)

(assert (=> b!159856 (=> res!133425 e!109317)))

(assert (=> b!159856 (= res!133425 (bvsge (currentByte!7153 thiss!1602) (size!3450 (buf!3908 thiss!1602))))))

(assert (=> b!159856 (= lt!252257 (array!7625 (store (store (arr!4371 (buf!3908 thiss!1602)) (currentByte!7153 thiss!1602) lt!252247) (currentByte!7153 thiss!1602) lt!252261) (size!3450 (buf!3908 thiss!1602))))))

(assert (=> b!159856 (= lt!252261 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252247) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252256))))))

(assert (=> b!159856 (= lt!252247 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4371 (buf!3908 thiss!1602)) (currentByte!7153 thiss!1602))) lt!252248)))))

(assert (=> b!159856 (= lt!252248 ((_ sign_extend 24) lt!252254))))

(assert (=> b!159856 (= lt!252254 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252258)))))))

(assert (=> b!159856 (= lt!252258 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252256))))))

(assert (=> b!159856 (= lt!252256 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7148 thiss!1602))))))

(declare-fun b!159857 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159857 (= e!109314 (invariant!0 (currentBit!7148 thiss!1602) (currentByte!7153 thiss!1602) (size!3450 (buf!3908 thiss!1602))))))

(declare-fun b!159858 () Bool)

(declare-fun Unit!10906 () Unit!10901)

(assert (=> b!159858 (= e!109313 Unit!10906)))

(declare-fun lt!252252 () Unit!10901)

(assert (=> b!159858 (= lt!252252 (arrayUpdatedAtPrefixLemma!109 (buf!3908 thiss!1602) (currentByte!7153 (_3!518 lt!252250)) (select (arr!4371 (buf!3908 (_3!518 lt!252250))) (currentByte!7153 (_3!518 lt!252250)))))))

(assert (=> b!159858 (arrayRangesEq!501 (buf!3908 thiss!1602) (array!7625 (store (arr!4371 (buf!3908 thiss!1602)) (currentByte!7153 (_3!518 lt!252250)) (select (arr!4371 (buf!3908 (_3!518 lt!252250))) (currentByte!7153 (_3!518 lt!252250)))) (size!3450 (buf!3908 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7153 (_3!518 lt!252250)))))

(declare-fun lt!252259 () Unit!10901)

(assert (=> b!159858 (= lt!252259 (arrayUpdatedAtPrefixLemma!109 lt!252257 (currentByte!7153 (_3!518 lt!252250)) (select (arr!4371 (buf!3908 (_3!518 lt!252250))) (currentByte!7153 (_3!518 lt!252250)))))))

(assert (=> b!159858 call!2705))

(declare-fun lt!252255 () Unit!10901)

(declare-fun arrayRangesEqTransitive!135 (array!7624 array!7624 array!7624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10901)

(assert (=> b!159858 (= lt!252255 (arrayRangesEqTransitive!135 (buf!3908 thiss!1602) lt!252257 (buf!3908 (_3!518 lt!252250)) #b00000000000000000000000000000000 (bvsub (currentByte!7153 (_3!518 lt!252250)) #b00000000000000000000000000000001) (currentByte!7153 (_3!518 lt!252250))))))

(declare-fun res!133426 () Bool)

(assert (=> b!159858 (= res!133426 (arrayRangesEq!501 (buf!3908 thiss!1602) (buf!3908 (_3!518 lt!252250)) #b00000000000000000000000000000000 (bvsub (currentByte!7153 (_3!518 lt!252250)) #b00000000000000000000000000000001)))))

(assert (=> b!159858 (=> (not res!133426) (not e!109311))))

(assert (=> b!159858 e!109311))

(declare-fun bm!2702 () Bool)

(assert (=> bm!2702 (= call!2705 (arrayRangesEq!501 (ite c!8435 lt!252257 (buf!3908 thiss!1602)) (ite c!8435 (array!7625 (store (store (store (arr!4371 (buf!3908 thiss!1602)) (currentByte!7153 thiss!1602) lt!252247) (currentByte!7153 thiss!1602) lt!252261) (currentByte!7153 (_3!518 lt!252250)) (select (arr!4371 (buf!3908 (_3!518 lt!252250))) (currentByte!7153 (_3!518 lt!252250)))) (size!3450 (buf!3908 thiss!1602))) (buf!3908 (_3!518 lt!252250))) #b00000000000000000000000000000000 (ite c!8435 (currentByte!7153 (_3!518 lt!252250)) (currentByte!7153 thiss!1602))))))

(assert (= (and start!32420 res!133423) b!159856))

(assert (= (and b!159856 (not res!133425)) b!159852))

(assert (= (and b!159856 (not res!133424)) b!159854))

(assert (= (and b!159854 c!8435) b!159858))

(assert (= (and b!159854 (not c!8435)) b!159853))

(assert (= (and b!159858 res!133426) b!159855))

(assert (= (or b!159858 b!159853) bm!2702))

(assert (= (and b!159854 (not res!133427)) b!159857))

(assert (= start!32420 b!159851))

(declare-fun m!252171 () Bool)

(assert (=> b!159852 m!252171))

(assert (=> b!159852 m!252171))

(declare-fun m!252173 () Bool)

(assert (=> b!159852 m!252173))

(declare-fun m!252175 () Bool)

(assert (=> b!159858 m!252175))

(declare-fun m!252177 () Bool)

(assert (=> b!159858 m!252177))

(assert (=> b!159858 m!252175))

(declare-fun m!252179 () Bool)

(assert (=> b!159858 m!252179))

(declare-fun m!252181 () Bool)

(assert (=> b!159858 m!252181))

(declare-fun m!252183 () Bool)

(assert (=> b!159858 m!252183))

(assert (=> b!159858 m!252175))

(declare-fun m!252185 () Bool)

(assert (=> b!159858 m!252185))

(declare-fun m!252187 () Bool)

(assert (=> b!159858 m!252187))

(declare-fun m!252189 () Bool)

(assert (=> start!32420 m!252189))

(declare-fun m!252191 () Bool)

(assert (=> start!32420 m!252191))

(declare-fun m!252193 () Bool)

(assert (=> bm!2702 m!252193))

(declare-fun m!252195 () Bool)

(assert (=> bm!2702 m!252195))

(assert (=> bm!2702 m!252175))

(declare-fun m!252197 () Bool)

(assert (=> bm!2702 m!252197))

(declare-fun m!252199 () Bool)

(assert (=> bm!2702 m!252199))

(declare-fun m!252201 () Bool)

(assert (=> b!159851 m!252201))

(declare-fun m!252203 () Bool)

(assert (=> b!159857 m!252203))

(declare-fun m!252205 () Bool)

(assert (=> b!159855 m!252205))

(declare-fun m!252207 () Bool)

(assert (=> b!159856 m!252207))

(declare-fun m!252209 () Bool)

(assert (=> b!159856 m!252209))

(declare-fun m!252211 () Bool)

(assert (=> b!159856 m!252211))

(assert (=> b!159856 m!252195))

(declare-fun m!252213 () Bool)

(assert (=> b!159856 m!252213))

(declare-fun m!252215 () Bool)

(assert (=> b!159856 m!252215))

(assert (=> b!159856 m!252171))

(declare-fun m!252217 () Bool)

(assert (=> b!159856 m!252217))

(declare-fun m!252219 () Bool)

(assert (=> b!159856 m!252219))

(declare-fun m!252221 () Bool)

(assert (=> b!159856 m!252221))

(assert (=> b!159856 m!252199))

(declare-fun m!252223 () Bool)

(assert (=> b!159856 m!252223))

(push 1)

(assert (not b!159855))

(assert (not b!159858))

(assert (not bm!2702))

(assert (not b!159857))

(assert (not b!159856))

(assert (not b!159851))

(assert (not b!159852))

(assert (not start!32420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

