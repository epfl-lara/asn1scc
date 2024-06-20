; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56678 () Bool)

(assert start!56678)

(declare-fun res!218720 () Bool)

(declare-fun e!181616 () Bool)

(assert (=> start!56678 (=> (not res!218720) (not e!181616))))

(declare-datatypes ((array!14406 0))(
  ( (array!14407 (arr!7279 (Array (_ BitVec 32) (_ BitVec 8))) (size!6292 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11506 0))(
  ( (BitStream!11507 (buf!6814 array!14406) (currentByte!12575 (_ BitVec 32)) (currentBit!12570 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11506)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56678 (= res!218720 (validate_offset_bit!0 ((_ sign_extend 32) (size!6292 (buf!6814 thiss!914))) ((_ sign_extend 32) (currentByte!12575 thiss!914)) ((_ sign_extend 32) (currentBit!12570 thiss!914))))))

(assert (=> start!56678 e!181616))

(declare-fun e!181617 () Bool)

(declare-fun inv!12 (BitStream!11506) Bool)

(assert (=> start!56678 (and (inv!12 thiss!914) e!181617)))

(assert (=> start!56678 true))

(declare-fun b!261238 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261238 (= e!181616 (and b!187 (bvsge (bvor ((_ sign_extend 24) (select (arr!7279 (buf!6814 thiss!914)) (currentByte!12575 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12570 thiss!914)))) #b00000000000000000000000010000000)))))

(declare-fun b!261239 () Bool)

(declare-fun array_inv!6033 (array!14406) Bool)

(assert (=> b!261239 (= e!181617 (array_inv!6033 (buf!6814 thiss!914)))))

(assert (= (and start!56678 res!218720) b!261238))

(assert (= start!56678 b!261239))

(declare-fun m!390889 () Bool)

(assert (=> start!56678 m!390889))

(declare-fun m!390891 () Bool)

(assert (=> start!56678 m!390891))

(declare-fun m!390893 () Bool)

(assert (=> b!261238 m!390893))

(declare-fun m!390895 () Bool)

(assert (=> b!261238 m!390895))

(declare-fun m!390897 () Bool)

(assert (=> b!261239 m!390897))

(push 1)

(assert (not b!261239))

(assert (not start!56678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

