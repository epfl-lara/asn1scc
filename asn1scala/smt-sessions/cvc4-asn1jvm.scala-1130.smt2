; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32090 () Bool)

(assert start!32090)

(declare-fun res!132622 () Bool)

(declare-fun e!108305 () Bool)

(assert (=> start!32090 (=> (not res!132622) (not e!108305))))

(declare-datatypes ((array!7516 0))(
  ( (array!7517 (arr!4326 (Array (_ BitVec 32) (_ BitVec 8))) (size!3405 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5978 0))(
  ( (BitStream!5979 (buf!3863 array!7516) (currentByte!7087 (_ BitVec 32)) (currentBit!7082 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5978)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32090 (= res!132622 (validate_offset_byte!0 ((_ sign_extend 32) (size!3405 (buf!3863 thiss!1602))) ((_ sign_extend 32) (currentByte!7087 thiss!1602)) ((_ sign_extend 32) (currentBit!7082 thiss!1602))))))

(assert (=> start!32090 e!108305))

(declare-fun e!108304 () Bool)

(declare-fun inv!12 (BitStream!5978) Bool)

(assert (=> start!32090 (and (inv!12 thiss!1602) e!108304)))

(assert (=> start!32090 true))

(declare-fun b!158881 () Bool)

(declare-datatypes ((Unit!10711 0))(
  ( (Unit!10712) )
))
(declare-datatypes ((tuple3!712 0))(
  ( (tuple3!713 (_1!7704 Unit!10711) (_2!7704 (_ BitVec 8)) (_3!473 BitStream!5978)) )
))
(declare-fun lt!250515 () tuple3!712)

(assert (=> b!158881 (= e!108305 (not (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7087 (_3!473 lt!250515)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7087 (_3!473 lt!250515)) #b00000000000000000000000000000001) (size!3405 (buf!3863 thiss!1602))))))))

(declare-fun lt!250517 () (_ BitVec 8))

(declare-fun arrayRangesEq!456 (array!7516 array!7516 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158881 (arrayRangesEq!456 (buf!3863 thiss!1602) (array!7517 (store (arr!4326 (buf!3863 thiss!1602)) (bvsub (currentByte!7087 (_3!473 lt!250515)) #b00000000000000000000000000000001) lt!250517) (size!3405 (buf!3863 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7087 (_3!473 lt!250515)) #b00000000000000000000000000000001))))

(declare-fun lt!250511 () Unit!10711)

(declare-fun arrayUpdatedAtPrefixLemma!64 (array!7516 (_ BitVec 32) (_ BitVec 8)) Unit!10711)

(assert (=> b!158881 (= lt!250511 (arrayUpdatedAtPrefixLemma!64 (buf!3863 thiss!1602) (bvsub (currentByte!7087 (_3!473 lt!250515)) #b00000000000000000000000000000001) lt!250517))))

(assert (=> b!158881 (= lt!250517 (select (arr!4326 (buf!3863 (_3!473 lt!250515))) (bvsub (currentByte!7087 (_3!473 lt!250515)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250512 () (_ BitVec 32))

(declare-fun lt!250509 () (_ BitVec 32))

(declare-fun lt!250518 () (_ BitVec 8))

(declare-fun lt!250514 () (_ BitVec 8))

(declare-fun lt!250510 () (_ BitVec 8))

(declare-fun lt!250513 () array!7516)

(declare-fun lt!250516 () (_ BitVec 32))

(declare-fun Unit!10713 () Unit!10711)

(declare-fun Unit!10714 () Unit!10711)

(assert (=> b!158881 (= lt!250515 (ite (bvsgt lt!250516 #b00000000000000000000000000000000) (let ((bdg!9228 ((_ extract 7 0) (bvnot lt!250509)))) (let ((bdg!9229 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4326 (buf!3863 thiss!1602)) (currentByte!7087 thiss!1602) lt!250518) (currentByte!7087 thiss!1602) lt!250510) (bvadd #b00000000000000000000000000000001 (currentByte!7087 thiss!1602)))) ((_ sign_extend 24) bdg!9228))))) (tuple3!713 Unit!10713 bdg!9228 (BitStream!5979 (array!7517 (store (arr!4326 (array!7517 (store (arr!4326 lt!250513) (bvadd #b00000000000000000000000000000001 (currentByte!7087 thiss!1602)) bdg!9229) (size!3405 lt!250513))) (bvadd #b00000000000000000000000000000001 (currentByte!7087 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9229) (bvshl ((_ sign_extend 24) v!222) lt!250512)))) (size!3405 (array!7517 (store (arr!4326 lt!250513) (bvadd #b00000000000000000000000000000001 (currentByte!7087 thiss!1602)) bdg!9229) (size!3405 lt!250513)))) (bvadd #b00000000000000000000000000000001 (currentByte!7087 thiss!1602)) (currentBit!7082 thiss!1602))))) (tuple3!713 Unit!10714 lt!250514 (BitStream!5979 lt!250513 (bvadd #b00000000000000000000000000000001 (currentByte!7087 thiss!1602)) (currentBit!7082 thiss!1602)))))))

(declare-fun e!108303 () Bool)

(assert (=> b!158881 e!108303))

(declare-fun res!132623 () Bool)

(assert (=> b!158881 (=> res!132623 e!108303)))

(assert (=> b!158881 (= res!132623 (bvsge (currentByte!7087 thiss!1602) (size!3405 (buf!3863 thiss!1602))))))

(assert (=> b!158881 (= lt!250513 (array!7517 (store (store (arr!4326 (buf!3863 thiss!1602)) (currentByte!7087 thiss!1602) lt!250518) (currentByte!7087 thiss!1602) lt!250510) (size!3405 (buf!3863 thiss!1602))))))

(assert (=> b!158881 (= lt!250510 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250518) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250516))))))

(assert (=> b!158881 (= lt!250518 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4326 (buf!3863 thiss!1602)) (currentByte!7087 thiss!1602))) lt!250509)))))

(assert (=> b!158881 (= lt!250509 ((_ sign_extend 24) lt!250514))))

(assert (=> b!158881 (= lt!250514 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250512)))))))

(assert (=> b!158881 (= lt!250512 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250516))))))

(assert (=> b!158881 (= lt!250516 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7082 thiss!1602))))))

(declare-fun b!158882 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158882 (= e!108303 (byteRangesEq!0 (select (arr!4326 (buf!3863 thiss!1602)) (currentByte!7087 thiss!1602)) lt!250510 #b00000000000000000000000000000000 (currentBit!7082 thiss!1602)))))

(declare-fun b!158883 () Bool)

(declare-fun array_inv!3152 (array!7516) Bool)

(assert (=> b!158883 (= e!108304 (array_inv!3152 (buf!3863 thiss!1602)))))

(assert (= (and start!32090 res!132622) b!158881))

(assert (= (and b!158881 (not res!132623)) b!158882))

(assert (= start!32090 b!158883))

(declare-fun m!249641 () Bool)

(assert (=> start!32090 m!249641))

(declare-fun m!249643 () Bool)

(assert (=> start!32090 m!249643))

(declare-fun m!249645 () Bool)

(assert (=> b!158881 m!249645))

(declare-fun m!249647 () Bool)

(assert (=> b!158881 m!249647))

(declare-fun m!249649 () Bool)

(assert (=> b!158881 m!249649))

(declare-fun m!249651 () Bool)

(assert (=> b!158881 m!249651))

(declare-fun m!249653 () Bool)

(assert (=> b!158881 m!249653))

(declare-fun m!249655 () Bool)

(assert (=> b!158881 m!249655))

(declare-fun m!249657 () Bool)

(assert (=> b!158881 m!249657))

(declare-fun m!249659 () Bool)

(assert (=> b!158881 m!249659))

(declare-fun m!249661 () Bool)

(assert (=> b!158881 m!249661))

(declare-fun m!249663 () Bool)

(assert (=> b!158881 m!249663))

(declare-fun m!249665 () Bool)

(assert (=> b!158881 m!249665))

(assert (=> b!158882 m!249651))

(assert (=> b!158882 m!249651))

(declare-fun m!249667 () Bool)

(assert (=> b!158882 m!249667))

(declare-fun m!249669 () Bool)

(assert (=> b!158883 m!249669))

(push 1)

(assert (not b!158883))

(assert (not b!158882))

(assert (not b!158881))

(assert (not start!32090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

