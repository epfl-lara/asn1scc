; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3666 () Bool)

(assert start!3666)

(declare-fun res!14816 () Bool)

(declare-fun e!9977 () Bool)

(assert (=> start!3666 (=> (not res!14816) (not e!9977))))

(declare-datatypes ((A!201 0))(
  ( (A!202 (val!4 Int)) )
))
(declare-datatypes ((OptionMut!3 0))(
  ( (SomeMut!3 (v!352 A!201)) (NoneMut!3) )
))
(declare-fun thiss!1958 () OptionMut!3)

(declare-fun isDefined!4 (OptionMut!3) Bool)

(assert (=> start!3666 (= res!14816 (isDefined!4 thiss!1958))))

(assert (=> start!3666 e!9977))

(declare-fun e!9978 () Bool)

(assert (=> start!3666 e!9978))

(declare-fun b!15973 () Bool)

(get-info :version)

(assert (=> b!15973 (= e!9977 (not ((_ is SomeMut!3) thiss!1958)))))

(declare-fun b!15974 () Bool)

(declare-fun tp_is_empty!9 () Bool)

(assert (=> b!15974 (= e!9978 tp_is_empty!9)))

(assert (= (and start!3666 res!14816) b!15973))

(assert (= (and start!3666 ((_ is SomeMut!3) thiss!1958)) b!15974))

(declare-fun m!22763 () Bool)

(assert (=> start!3666 m!22763))

(check-sat (not start!3666) tp_is_empty!9)
(check-sat)
(get-model)

(declare-fun d!5157 () Bool)

(assert (=> d!5157 (= (isDefined!4 thiss!1958) ((_ is SomeMut!3) thiss!1958))))

(assert (=> start!3666 d!5157))

(check-sat tp_is_empty!9)
